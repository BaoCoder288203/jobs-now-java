-- ==============================================================================
-- Seed Data for Industry (Ngành), JobCategory (Nghề nghiệp), Major (Chuyên ngành)
-- Database: Neon PostgreSQL (jobsnow)
-- ==============================================================================

BEGIN;

-- 1. Reset các bảng danh mục (an toàn vì hiện tại chưa có job hay education nào liên kết)
TRUNCATE TABLE job_category, industry, major RESTART IDENTITY CASCADE;

-- ------------------------------------------------------------------------------
-- 2. Thêm Ngành (Industry)
-- ------------------------------------------------------------------------------
INSERT INTO industry (name) VALUES
('Công nghệ thông tin / Phần mềm'),
('Viễn thông & Mạng'),
('Tài chính / Ngân hàng / Bảo hiểm'),
('Kế toán / Kiểm toán / Thuế'),
('Marketing / Truyền thông / Quảng cáo'),
('Bán hàng / Kinh doanh / Phát triển thị trường'),
('Bán lẻ / Thương mại điện tử / FMCG'),
('Hành chính / Nhân sự / Pháp lý'),
('Giáo dục / Đào tạo / Nghiên cứu'),
('Y tế / Dược phẩm / Chăm sóc sức khỏe'),
('Xây dựng / Kiến trúc / Nội thất'),
('Bất động sản / Quản lý tài sản'),
('Logistics / Chuỗi cung ứng / Kho vận'),
('Xuất nhập khẩu / Ngoại thương'),
('Sản xuất / Chế tạo / Tự động hóa'),
('Cơ khí / Điện tử / Kỹ thuật công nghiệp'),
('Du lịch / Khách sạn / Nhà hàng / F&B'),
('Thiết kế đồ họa / Nghệ thuật / Đa phương tiện'),
('Báo chí / Biên phiên dịch / Xuất bản'),
('Nông nghiệp / Lâm nghiệp / Thủy sản'),
('Năng lượng / Môi trường / Dầu khí'),
('Dịch vụ khách hàng / Chăm sóc khách hàng'),
('Tư vấn quản trị / Chiến lược kinh doanh'),
('Vận tải / Ô tô / Xe máy');

-- ------------------------------------------------------------------------------
-- 3. Thêm Nghề nghiệp (JobCategory) theo đúng ngành tương ứng
-- ------------------------------------------------------------------------------

-- Ngành 1: Công nghệ thông tin / Phần mềm
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Lập trình viên Frontend (React, Vue, Angular)'),
    ('Lập trình viên Backend (Java, Node.js, .NET, Python, Golang)'),
    ('Lập trình viên Fullstack'),
    ('Lập trình viên Di động (iOS, Android, Flutter, React Native)'),
    ('Kỹ sư DevOps / Cloud (AWS, Azure, GCP, Kubernetes)'),
    ('Kỹ sư Trí tuệ nhân tạo (AI) / Machine Learning'),
    ('Kỹ sư Dữ liệu (Data Engineer)'),
    ('Chuyên viên Phân tích dữ liệu (Data Analyst / BI)'),
    ('Kỹ sư Kiểm thử phần mềm (QA / QC / Tester)'),
    ('Kỹ sư An toàn thông tin / An ninh mạng (Cyber Security)'),
    ('Quản lý dự án CNTT (IT Project Manager / Scrum Master)'),
    ('Chuyên viên Phân tích nghiệp vụ phần mềm (Business Analyst - BA)'),
    ('Kiến trúc sư giải pháp phần mềm (Solution Architect)'),
    ('Lập trình hệ thống nhúng / IoT (Embedded Systems)')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Công nghệ thông tin / Phần mềm') AS i;

-- Ngành 2: Viễn thông & Mạng
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Kỹ sư Mạng máy tính & Hạ tầng mạng (Network Engineer)'),
    ('Kỹ sư Quản trị hệ thống (System Administrator)'),
    ('Kỹ sư Tối ưu hóa mạng di động (4G/5G Radio Optimization)'),
    ('Kỹ sư Vận hành trung tâm dữ liệu (Data Center Operations)'),
    ('Kỹ sư Truyền dẫn cáp quang & Viễn thông')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Viễn thông & Mạng') AS i;

-- Ngành 3: Tài chính / Ngân hàng / Bảo hiểm
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Chuyên viên Quản lý khách hàng cá nhân (RM cá nhân)'),
    ('Chuyên viên Quản lý khách hàng doanh nghiệp (RM doanh nghiệp)'),
    ('Chuyên viên Thẩm định và Tái thẩm định tín dụng'),
    ('Giao dịch viên ngân hàng (Bank Teller)'),
    ('Chuyên viên Phân tích tài chính & Định giá đầu tư'),
    ('Chuyên viên Quản trị rủi ro tín dụng & thị trường'),
    ('Môi giới chứng khoán & Tư vấn tài chính cá nhân'),
    ('Chuyên viên Khai thác bảo hiểm & Định phí bảo hiểm (Actuary)')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Tài chính / Ngân hàng / Bảo hiểm') AS i;

-- Ngành 4: Kế toán / Kiểm toán / Thuế
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Kế toán tổng hợp'),
    ('Kế toán thuế & Báo cáo tài chính'),
    ('Kế toán thanh toán & Công nợ'),
    ('Kế toán kho & Quản lý vật tư'),
    ('Kế toán trưởng (Chief Accountant)'),
    ('Trợ lý kiểm toán (Audit Assistant)'),
    ('Kiểm toán viên độc lập (Senior Auditor)'),
    ('Chuyên viên Kiểm toán nội bộ (Internal Auditor)')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Kế toán / Kiểm toán / Thuế') AS i;

-- Ngành 5: Marketing / Truyền thông / Quảng cáo
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Chuyên viên Digital Marketing tổng thể'),
    ('Chuyên viên Chạy quảng cáo Performance (Facebook, Google, TikTok Ads)'),
    ('Chuyên viên SEO & Tối ưu hóa công cụ tìm kiếm'),
    ('Chuyên viên Sáng tạo nội dung (Content Writer / Copywriter)'),
    ('Chuyên viên Quản trị thương hiệu (Brand Executive / Manager)'),
    ('Chuyên viên Quan hệ công chúng (PR & Communications)'),
    ('Chuyên viên Tổ chức sự kiện (Event Planning & Execution)'),
    ('Quản trị kênh mạng xã hội (Social Media Specialist / Community)'),
    ('Chuyên viên Sáng tạo nội dung video ngắn (TikTok/Reels Creator)')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Marketing / Truyền thông / Quảng cáo') AS i;

-- Ngành 6: Bán hàng / Kinh doanh / Phát triển thị trường
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Chuyên viên Phát triển kinh doanh B2B (B2B Sales)'),
    ('Nhân viên Bán hàng trực tiếp / Tư vấn bán hàng (B2C Sales)'),
    ('Nhân viên Telesales / Bán hàng qua điện thoại'),
    ('Quản lý kinh doanh khu vực (Area Sales Manager - ASM)'),
    ('Giám đốc kinh doanh (Head of Sales / CCO)'),
    ('Chuyên viên Quản lý khách hàng trọng điểm (Key Account Manager - KAM)'),
    ('Đại diện thương mại & Đấu thầu dự án')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Bán hàng / Kinh doanh / Phát triển thị trường') AS i;

-- Ngành 7: Bán lẻ / Thương mại điện tử / FMCG
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Chuyên viên Vận hành sàn TMĐT (Shopee, TikTok Shop, Lazada)'),
    ('Quản lý cửa hàng bán lẻ (Store Manager / Shop Leader)'),
    ('Giám sát bán hàng kênh siêu thị (Modern Trade Supervisor)'),
    ('Quản lý kênh phân phối đại lý truyền thống (General Trade)'),
    ('Chuyên viên Thu mua hàng hóa (Purchasing / Merchandiser)'),
    ('MC / Host Livestream bán hàng chuyên nghiệp')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Bán lẻ / Thương mại điện tử / FMCG') AS i;

-- Ngành 8: Hành chính / Nhân sự / Pháp lý
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Chuyên viên Tuyển dụng (Recruiter / Talent Acquisition)'),
    ('Chuyên viên Tiền lương & Chế độ phúc lợi (C&B Specialist)'),
    ('Chuyên viên Đào tạo & Phát triển nhân tài (L&D Specialist)'),
    ('Chuyên viên Đối tác nhân sự (HR Business Partner - HRBP)'),
    ('Trưởng phòng Nhân sự (Human Resources Manager)'),
    ('Nhân viên Hành chính & Lễ tân văn phòng'),
    ('Quản lý văn phòng (Office Manager)'),
    ('Chuyên viên Pháp chế doanh nghiệp (Legal Officer / Legal Counsel)')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Hành chính / Nhân sự / Pháp lý') AS i;

-- Ngành 9: Giáo dục / Đào tạo / Nghiên cứu
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Giảng viên Đại học / Cao đẳng'),
    ('Giáo viên Tiếng Anh (IELTS / TOEIC / Giao tiếp)'),
    ('Giáo viên Mầm non / Tiểu học / Phổ thông'),
    ('Chuyên viên Phát triển chương trình đào tạo (Instructional Designer)'),
    ('Chuyên viên Tư vấn tuyển sinh & Khóa học'),
    ('Cố vấn học tập & Quản lý lớp học')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Giáo dục / Đào tạo / Nghiên cứu') AS i;

-- Ngành 10: Y tế / Dược phẩm / Chăm sóc sức khỏe
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Trình dược viên kênh ETC (Bệnh viện)'),
    ('Trình dược viên kênh OTC (Nhà thuốc)'),
    ('Dược sĩ chuyên môn / Dược sĩ tư vấn bán thuốc'),
    ('Bác sĩ đa khoa / Bác sĩ chuyên khoa'),
    ('Điều dưỡng viên / Y tá chăm sóc'),
    ('Kỹ thuật viên xét nghiệm y học'),
    ('Kỹ thuật viên chẩn đoán hình ảnh (X-quang, MRI, Siêu âm)'),
    ('Chuyên viên Nghiên cứu & Phát triển Dược phẩm (R&D)')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Y tế / Dược phẩm / Chăm sóc sức khỏe') AS i;

-- Ngành 11: Xây dựng / Kiến trúc / Nội thất
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Kỹ sư Giám sát thi công xây dựng'),
    ('Kỹ sư Kết cấu công trình (Civil / Structural Engineer)'),
    ('Kỹ sư Dự toán & Khối lượng công trình (QS Engineer)'),
    ('Kiến trúc sư thiết kế công trình'),
    ('Kiến trúc sư / Nhà thiết kế nội thất'),
    ('Kỹ sư Cơ điện công trình (MEP Engineer)'),
    ('Chỉ huy trưởng công trình xây dựng')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Xây dựng / Kiến trúc / Nội thất') AS i;

-- Ngành 12: Bất động sản / Quản lý tài sản
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Chuyên viên Tư vấn môi giới Bất động sản dự án'),
    ('Chuyên viên Môi giới Bất động sản thổ cư / cho thuê'),
    ('Chuyên viên Thẩm định giá tài sản & Bất động sản'),
    ('Chuyên viên Phát triển quỹ đất & Pháp lý dự án'),
    ('Ban quản lý vận hành tòa nhà / Khu đô thị')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Bất động sản / Quản lý tài sản') AS i;

-- Ngành 13: Logistics / Chuỗi cung ứng / Kho vận
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Chuyên viên Kế hoạch & Điều phối chuỗi cung ứng (Supply Chain)'),
    ('Quản lý kho bãi & Hàng tồn kho (Warehouse Supervisor/Manager)'),
    ('Chuyên viên Giao nhận vận tải (Freight Forwarder)'),
    ('Chuyên viên Thủ tục Hải quan & Khai báo thông quan'),
    ('Nhân viên Điều phối giao hàng & Vận tải nội địa')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Logistics / Chuỗi cung ứng / Kho vận') AS i;

-- Ngành 14: Xuất nhập khẩu / Ngoại thương
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Chuyên viên Chứng từ xuất nhập khẩu (Import-Export Documentation)'),
    ('Chuyên viên Mua hàng quốc tế (Overseas Sourcing / Purchasing)'),
    ('Nhân viên Kinh doanh xuất khẩu (International Sales / Export Sales)'),
    ('Chuyên viên Hiện trường xuất nhập khẩu (OPS Field)')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Xuất nhập khẩu / Ngoại thương') AS i;

-- Ngành 15: Sản xuất / Chế tạo / Tự động hóa
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Quản lý sản xuất / Trưởng ca sản xuất'),
    ('Kỹ sư Quản lý chất lượng sản phẩm (QA/QC Sản xuất)'),
    ('Kỹ sư Cải tiến quy trình (Lean / Kaizen / Six Sigma)'),
    ('Kỹ sư Lập trình PLC & Tự động hóa công nghiệp'),
    ('Kỹ sư Vận hành máy CNC & Khuôn mẫu'),
    ('Kỹ sư An toàn lao động & Môi trường (EHS Officer)')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Sản xuất / Chế tạo / Tự động hóa') AS i;

-- Ngành 16: Cơ khí / Điện tử / Kỹ thuật công nghiệp
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Kỹ sư Thiết kế cơ khí (SolidWorks, AutoCAD, Catia)'),
    ('Kỹ sư Thiết kế phần cứng & Mạch điện tử (Hardware / PCB)'),
    ('Kỹ sư Bảo trì & Bảo dưỡng máy móc thiết bị (Maintenance Engineer)'),
    ('Kỹ sư Nhiệt điện lạnh / Hệ thống thông gió điều hòa (HVAC)'),
    ('Kỹ thuật viên Sửa chữa điện - cơ khí chính xác')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Cơ khí / Điện tử / Kỹ thuật công nghiệp') AS i;

-- Ngành 17: Du lịch / Khách sạn / Nhà hàng / F&B
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Quản lý nhà hàng / Cửa hàng ẩm thực (Restaurant Manager)'),
    ('Bếp trưởng / Đầu bếp chuyên nghiệp (Chef / Cook)'),
    ('Chuyên viên Pha chế đồ uống (Bartender / Barista)'),
    ('Quản lý tiền sảnh khách sạn (Front Office Manager)'),
    ('Hướng dẫn viên du lịch (Tour Guide nội địa & quốc tế)'),
    ('Nhân viên Phục vụ bàn & Buồng phòng khách sạn')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Du lịch / Khách sạn / Nhà hàng / F&B') AS i;

-- Ngành 18: Thiết kế đồ họa / Nghệ thuật / Đa phương tiện
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Chuyên viên Thiết kế đồ họa 2D (Graphic Designer)'),
    ('Nhà thiết kế trải nghiệm & Giao diện người dùng (UI/UX Designer)'),
    ('Chuyên viên Dựng phim & Kỹ xảo video (Video Editor / Motion Graphics)'),
    ('Họa sĩ 3D Model & Hoạt hình (3D Artist / Animator)'),
    ('Chuyên viên Thiết kế bao bì & Nhận diện thương hiệu (Branding Designer)'),
    ('Nhiếp ảnh gia & Quay phim chuyên nghiệp (Photographer / Cameraman)')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Thiết kế đồ họa / Nghệ thuật / Đa phương tiện') AS i;

-- Ngành 19: Báo chí / Biên phiên dịch / Xuất bản
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Phóng viên / Biên tập viên tin tức'),
    ('Biên dịch viên Tiếng Anh / Tiếng Nhật / Tiếng Hàn / Tiếng Trung'),
    ('Phiên dịch viên cabin / Phiên dịch hiện trường'),
    ('Biên tập viên sách & Ấn phẩm xuất bản')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Báo chí / Biên phiên dịch / Xuất bản') AS i;

-- Ngành 20: Nông nghiệp / Lâm nghiệp / Thủy sản
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Kỹ sư Nông nghiệp công nghệ cao / Trồng trọt'),
    ('Kỹ sư Nuôi trồng thủy hải sản'),
    ('Bác sĩ thú y / Kỹ sư chăn nuôi thú y'),
    ('Chuyên viên Dinh dưỡng cây trồng & Thổ nhưỡng')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Nông nghiệp / Lâm nghiệp / Thủy sản') AS i;

-- Ngành 21: Năng lượng / Môi trường / Dầu khí
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Kỹ sư Năng lượng tái tạo (Điện mặt trời, Điện gió)'),
    ('Kỹ sư Xử lý nước thải & Quản lý môi trường'),
    ('Kỹ sư Vận hành trạm biến áp & Hệ thống điện lưới'),
    ('Kỹ sư Khai thác mỏ & Địa chất công trình')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Năng lượng / Môi trường / Dầu khí') AS i;

-- Ngành 22: Dịch vụ khách hàng / Chăm sóc khách hàng
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Nhân viên Tổng đài & Chăm sóc khách hàng (Call Center / CSKH)'),
    ('Chuyên viên Tiếp nhận & Giải quyết khiếu nại khách hàng'),
    ('Quản lý bộ phận Chăm sóc khách hàng (Customer Care Lead)'),
    ('Chuyên viên Nâng cao trải nghiệm khách hàng (CX Specialist)')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Dịch vụ khách hàng / Chăm sóc khách hàng') AS i;

-- Ngành 23: Tư vấn quản trị / Chiến lược kinh doanh
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Chuyên viên Tư vấn chiến lược doanh nghiệp'),
    ('Chuyên viên Tư vấn Chuyển đổi số (Digital Transformation Consultant)'),
    ('Chuyên viên Tối ưu hóa vận hành & Quy trình doanh nghiệp'),
    ('Chuyên viên Quản trị rủi ro & Tuân thủ doanh nghiệp')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Tư vấn quản trị / Chiến lược kinh doanh') AS i;

-- Ngành 24: Vận tải / Ô tô / Xe máy
INSERT INTO job_category (name, industry_id)
SELECT category_name, i.industry_id
FROM (VALUES
    ('Kỹ sư Công nghệ kỹ thuật Ô tô'),
    ('Cố vấn dịch vụ sửa chữa bảo dưỡng ô tô (Service Advisor)'),
    ('Kỹ thuật viên Sửa chữa điện - máy gầm ô tô'),
    ('Nhân viên Tư vấn bán hàng ô tô (Automotive Sales Consultant)')
) AS c(category_name)
CROSS JOIN (SELECT industry_id FROM industry WHERE name = 'Vận tải / Ô tô / Xe máy') AS i;


-- ------------------------------------------------------------------------------
-- 4. Thêm Chuyên ngành (Major)
-- ------------------------------------------------------------------------------
INSERT INTO major (name) VALUES
-- Khối Công nghệ thông tin & Máy tính
('Khoa học máy tính (Computer Science)'),
('Kỹ thuật phần mềm (Software Engineering)'),
('Hệ thống thông tin quản lý (MIS)'),
('Công nghệ thông tin (Information Technology)'),
('Mạng máy tính và Truyền thông dữ liệu'),
('An toàn thông tin / An ninh mạng (Cyber Security)'),
('Trí tuệ nhân tạo và Khoa học dữ liệu (AI & Data Science)'),
('Khoa học dữ liệu (Data Science)'),
('Kỹ thuật máy tính (Computer Engineering)'),
('Lập trình trò chơi và Đồ họa tương tác (Game Development)'),

-- Khối Kỹ thuật & Công nghệ
('Kỹ thuật cơ điện tử (Mechatronics Engineering)'),
('Kỹ thuật điều khiển và Tự động hóa (Automation Engineering)'),
('Kỹ thuật điện, Điện tử (Electrical & Electronics Engineering)'),
('Kỹ thuật cơ khí (Mechanical Engineering)'),
('Kỹ thuật ô tô (Automotive Engineering)'),
('Kỹ thuật nhiệt / Điện lạnh (HVAC)'),
('Kỹ thuật hóa học (Chemical Engineering)'),
('Công nghệ sinh học (Biotechnology)'),
('Công nghệ thực phẩm (Food Technology)'),
('Kỹ thuật môi trường (Environmental Engineering)'),
('Kỹ thuật vật liệu (Materials Engineering)'),

-- Khối Xây dựng & Kiến trúc
('Kỹ thuật xây dựng công trình (Civil Engineering)'),
('Kỹ thuật xây dựng công trình giao thông (Cầu đường)'),
('Kiến trúc công trình (Architecture)'),
('Kiến trúc cảnh quan (Landscape Architecture)'),
('Thiết kế nội thất (Interior Design)'),
('Quy hoạch đô thị và nông thôn'),
('Quản lý xây dựng và Kinh tế xây dựng'),

-- Khối Kinh tế, Kinh doanh & Quản lý
('Quản trị kinh doanh (Business Administration)'),
('Kinh doanh quốc tế (International Business)'),
('Kinh tế đối ngoại (Foreign Economics)'),
('Kinh tế quốc tế (International Economics)'),
('Marketing'),
('Truyền thông Marketing tích hợp (IMC)'),
('Thương mại điện tử (E-Commerce)'),
('Tài chính - Ngân hàng (Finance & Banking)'),
('Kế toán (Accounting)'),
('Kiểm toán (Auditing)'),
('Quản trị nhân lực (Human Resource Management)'),
('Logistics và Quản lý chuỗi cung ứng (Supply Chain Management)'),
('Bất động sản (Real Estate)'),
('Kinh doanh thương mại (Commercial Business)'),
('Bảo hiểm và Định phí tài chính (Actuarial Science)'),
('Toán tài chính / Quản trị rủi ro'),

-- Khối Truyền thông, Báo chí & Thiết kế nghệ thuật
('Truyền thông đa phương tiện (Multimedia Communications)'),
('Quan hệ công chúng (Public Relations - PR)'),
('Báo chí (Journalism)'),
('Thiết kế đồ họa (Graphic Design)'),
('Thiết kế mỹ thuật số (Digital Art)'),
('Thiết kế thời trang (Fashion Design)'),
('Quay phim và Đạo diễn truyền hình'),

-- Khối Ngôn ngữ & Xã hội nhân văn
('Ngôn ngữ Anh (English Studies)'),
('Ngôn ngữ Nhật Bản (Japanese Studies)'),
('Ngôn ngữ Hàn Quốc (Korean Studies)'),
('Ngôn ngữ Trung Quốc (Chinese Studies)'),
('Ngôn ngữ Pháp (French Studies)'),
('Luật kinh tế (Economic Law)'),
('Luật thương mại quốc tế'),
('Luật dân sự và Tố tụng dân sự'),
('Tâm lý học (Psychology)'),
('Quan hệ quốc tế (International Relations)'),
('Xã hội học (Sociology)'),

-- Khối Du lịch & Dịch vụ
('Quản trị khách sạn (Hospitality Management)'),
('Quản trị dịch vụ du lịch và lữ hành (Tourism Management)'),
('Quản trị nhà hàng và dịch vụ ăn uống (F&B Management)'),

-- Khối Y tế & Dược phẩm
('Y khoa (Bác sĩ đa khoa)'),
('Dược học (Pharmacy)'),
('Răng - Hàm - Mặt'),
('Y học cổ truyền'),
('Điều dưỡng (Nursing)'),
('Kỹ thuật xét nghiệm y học'),
('Kỹ thuật hình ảnh y học'),
('Y tế công cộng'),

-- Khối Nông - Lâm - Ngư nghiệp
('Nông nghiệp công nghệ cao'),
('Bác sĩ thú y (Veterinary Medicine)'),
('Nuôi trồng thủy sản (Aquaculture)'),
('Khoa học đất và Dinh dưỡng cây trồng'),
('Quản lý tài nguyên và Môi trường');

COMMIT;
