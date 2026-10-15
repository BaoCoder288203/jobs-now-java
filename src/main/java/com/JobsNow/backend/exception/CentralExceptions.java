package com.JobsNow.backend.exception;

import com.JobsNow.backend.response.BaseResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CentralExceptions {
    @ExceptionHandler(exception = BadRequestException.class)
    public ResponseEntity<?> handleBadRequestException(BadRequestException ex) {
        BaseResponse response = new BaseResponse();
        response.setCode(400);
        response.setMessage(ex.getMessage());
        return ResponseEntity.ok(response);
    }
    @ExceptionHandler(exception = UnauthorizedException.class)
    public ResponseEntity<?> handleUnauthorizedException(UnauthorizedException ex) {
        BaseResponse response = new BaseResponse();
        response.setCode(401);
        response.setMessage(ex.getMessage());
        return ResponseEntity.ok(response);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<?> handleValidationException(MethodArgumentNotValidException ex) {
        BaseResponse response = new BaseResponse();
        response.setCode(400);
        String message = ex.getBindingResult()
                .getFieldErrors().stream()
                .map(error -> error.getDefaultMessage())
                .findFirst()
                .orElse("Validation error");
        response.setMessage(message);
        return ResponseEntity.badRequest().body(response);
    }

    @ExceptionHandler(exception = NotFoundException.class)
    public ResponseEntity<?> handleNotFoundException(NotFoundException ex) {
        BaseResponse response = new BaseResponse();
        response.setCode(404);
        response.setMessage(ex.getMessage());
        return ResponseEntity.ok(response);
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<?> handleGeneralException(Exception ex) {
        BaseResponse response = new BaseResponse();
        response.setCode(500);
        response.setMessage(ex.getMessage() != null ? ex.getMessage() : "Internal server error");
        return ResponseEntity.status(org.springframework.http.HttpStatus.INTERNAL_SERVER_ERROR).body(response);
    }

}
