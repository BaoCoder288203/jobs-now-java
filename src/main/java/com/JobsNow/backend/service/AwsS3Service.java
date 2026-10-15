package com.JobsNow.backend.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.retry.annotation.Backoff;
import org.springframework.retry.annotation.Retryable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.S3Exception;
import software.amazon.awssdk.services.s3.presigner.S3Presigner;
import software.amazon.awssdk.services.s3.presigner.model.PresignedPutObjectRequest;

import java.io.IOException;
import java.io.InputStream;
import java.time.Duration;

@Slf4j
@Service
public class AwsS3Service {
    private final S3Client s3Client;
    private final S3Presigner s3Presigner;

    public AwsS3Service(S3Client s3Client, S3Presigner s3Presigner) {
        this.s3Client = s3Client;
        this.s3Presigner = s3Presigner;
    }

    @Value("${aws.s3.bucketName}")
    private String bucketName;

    @Value("${aws.s3.endpointUrl}")
    private String endpointURL;

    @Retryable(value = { S3Exception.class }, maxAttempts = 3, backoff = @Backoff(delay = 2000))
    public String uploadFileToS3(InputStream inputStream, String s3Key, String contentType) {
        try {
            byte[] bytes = inputStream.readAllBytes();
            PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                    .bucket(bucketName)
                    .key(s3Key)
                    .contentType(contentType)
                    .contentLength((long) bytes.length)
                    .build();

            s3Client.putObject(putObjectRequest, RequestBody.fromBytes(bytes));

            String cleanKey = s3Key.startsWith("/") ? s3Key.substring(1) : s3Key;
            String baseUrl = endpointURL.endsWith("/") ? endpointURL : endpointURL + "/";
            return baseUrl + bucketName + "/" + cleanKey;
        } catch (S3Exception e) {
            log.error("AWS S3 upload error - bucket: {}, key: {}, awsError: {}", bucketName, s3Key,
                    e.awsErrorDetails() != null ? e.awsErrorDetails().errorMessage() : e.getMessage(), e);
            throw e;
        } catch (Exception e) {
            log.error("AWS S3 upload error - bucket: {}, key: {}, error: {}", bucketName, s3Key, e.getMessage(), e);
            throw new RuntimeException("Upload file failed: " + e.getMessage(), e);
        } finally {
            try {
                inputStream.close();
            } catch (IOException ex) {
                log.warn("Error closing input stream: {}", ex.getMessage());
            }
        }
    }
    public String generatePreSignedUrl(String fileName, String contentType) {
        int extIndex = fileName.lastIndexOf(".");
        String baseName = fileName.substring(0, extIndex);
        String extension = fileName.substring(extIndex);
        String newFileName = baseName + "_" + System.currentTimeMillis() + extension;

        PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                .bucket(bucketName)
                .key(newFileName)
                .contentType(contentType)
                .build();
        PresignedPutObjectRequest presignedRequest = s3Presigner.presignPutObject(r -> r
                .signatureDuration(Duration.ofMinutes(3))
                .putObjectRequest(putObjectRequest));
        return presignedRequest.url().toString();
    }

    public String uploadMultipartImage(MultipartFile file, String folderPrefix) {
        if (file == null || file.isEmpty()) {
            throw new IllegalArgumentException("File is required");
        }
        String originalFileName = file.getOriginalFilename();
        if (originalFileName == null || !originalFileName.contains(".")) {
            throw new IllegalArgumentException("Invalid file name");
        }
        int dot = originalFileName.lastIndexOf(".");
        String baseName = originalFileName.substring(0, dot);
        String extension = originalFileName.substring(dot);
        String normalizedFolder = folderPrefix.endsWith("/") ? folderPrefix : folderPrefix + "/";
        String s3Key = normalizedFolder + baseName + "_" + System.currentTimeMillis() + extension;
        try {
            return uploadFileToS3(file.getInputStream(), s3Key, file.getContentType());
        } catch (IOException e) {
            throw new RuntimeException("Upload file failed", e);
        }
    }
}
