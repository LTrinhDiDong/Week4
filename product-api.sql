CREATE DATABASE IF NOT EXISTS product_db;
USE product_db;

CREATE TABLE category (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE product (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DOUBLE NOT NULL,
    quantity_sold INT NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    category_id BIGINT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE CASCADE
);

-- Dữ liệu mẫu
INSERT INTO category (name) VALUES 
('Điện thoại'), ('Laptop'), ('Phụ kiện'), ('Máy tính bảng'), ('Âm thanh'), ('Thiết bị đeo');

INSERT INTO product (name, price, quantity_sold, created_at, category_id) VALUES 
('iPhone 14', 999.99, 50, NOW() - INTERVAL 5 DAY, 1),
('Samsung Galaxy S23', 899.99, 30, NOW() - INTERVAL 10 DAY, 1),
('MacBook Pro', 1999.99, 20, NOW() - INTERVAL 3 DAY, 2),
('Dell XPS 15', 1799.99, 25, NOW() - INTERVAL 7 DAY, 2),
('AirPods Pro', 249.99, 100, NOW() - INTERVAL 2 DAY, 3),
('iPad Pro', 1099.99, 15, NOW() - INTERVAL 6 DAY, 4),
('Galaxy Tab S8', 799.99, 18, NOW() - INTERVAL 8 DAY, 4),
('Sony WH-1000XM4', 349.99, 22, NOW() - INTERVAL 9 DAY, 5),
('Bose QC 45', 329.99, 20, NOW() - INTERVAL 4 DAY, 5),
('Apple Watch Series 8', 399.99, 30, NOW() - INTERVAL 7 DAY, 6),
('Samsung Galaxy Watch 5', 279.99, 28, NOW() - INTERVAL 5 DAY, 6),
('Fitbit Charge 5', 149.99, 17, NOW() - INTERVAL 3 DAY, 6),
('Google Pixel Watch', 349.99, 12, NOW() - INTERVAL 6 DAY, 6),
('Xiaomi Mi Band 7', 49.99, 35, NOW() - INTERVAL 2 DAY, 6);
