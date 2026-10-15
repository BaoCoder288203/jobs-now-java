-- ========================================================
-- SEED DATA: CÁC ROLE VÀ TÀI KHOẢN ADMIN FULL QUYỀN
-- Hệ thống JobsNow (PostgreSQL)
-- ========================================================

-- 1. TẠO CÁC ROLE CHÍNH CỦA HỆ THỐNG
-- Bảng: role (Model: Role.java)
-- - role_id: IDENTITY (Primary Key)
-- - role_name: Tên quyền với tiền tố ROLE_ (Unique, Not Null)
INSERT INTO role (role_name) VALUES 
    ('ROLE_ADMIN'),
    ('ROLE_COMPANY'),
    ('ROLE_JOBSEEKER')
ON CONFLICT (role_name) DO NOTHING;

-- 2. TẠO TÀI KHOẢN ADMIN FULL QUYỀN
-- Bảng: users (Model: User.java)
-- - email: admin@jobsnow.vn (Unique, Not Null)
-- - password: admin123 (BCrypt hash với cost 10)
-- - role_id: Khóa ngoại trỏ đến 'ROLE_ADMIN' trong bảng role
-- - status: 'ACTIVE' (Enum: ACTIVE | DISABLED)
-- - is_verified: true (Đã xác thực email)
INSERT INTO users (
    email, 
    phone, 
    password_hash, 
    full_name, 
    role_id, 
    status, 
    is_verified, 
    created_at
)
VALUES (
    'admin@jobsnow.vn',
    '0901234567',
    '$2a$10$zqUyH37GkxNPf6T3DKe08e6IWFX8ocBCF6CuQSOXAK3GAJbhWEEUC',
    'System Administrator',
    (SELECT role_id FROM role WHERE role_name = 'ROLE_ADMIN'),
    'ACTIVE',
    true,
    NOW()
)
ON CONFLICT (email) DO UPDATE SET
    role_id = EXCLUDED.role_id,
    password_hash = EXCLUDED.password_hash,
    status = EXCLUDED.status,
    is_verified = EXCLUDED.is_verified;
