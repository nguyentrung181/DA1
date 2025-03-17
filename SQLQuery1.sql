-- Chuyển về master để có thể xóa database đang sử dụng
USE master;
ALTER DATABASE PharmacyDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
IF DB_ID('PharmacyDB') IS NOT NULL
    DROP DATABASE PharmacyDB;

-- Tạo lại cơ sở dữ liệu
CREATE DATABASE PharmacyDB;
USE PharmacyDB;

-- Xóa bảng nếu đã tồn tại
IF OBJECT_ID('Prescriptions', 'U') IS NOT NULL
    DROP TABLE Prescriptions;
IF OBJECT_ID('Medications', 'U') IS NOT NULL
    DROP TABLE Medications;
IF OBJECT_ID('Patients', 'U') IS NOT NULL
    DROP TABLE Patients;

-- Tạo bảng Patients (Danh sách bệnh nhân)
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FullName VARCHAR(100),
    DOB DATE,
    Gender VARCHAR(10),
    PhoneNumber VARCHAR(15),
    MedicalHistory TEXT
);

-- Tạo bảng Medications (Danh sách thuốc)
CREATE TABLE Medications (
    MedicineID INT PRIMARY KEY,
    LoaiThuoc NVARCHAR(100),
    MaThuoc VARCHAR(50),
    TenThuoc VARCHAR(100),
    LieuLuong VARCHAR(50),
    ThanhPhan TEXT,
    ChucNangChinh NVARCHAR(50),
    ExpiryDate DATE
);

-- Tạo bảng Prescriptions (Đơn thuốc)
CREATE TABLE Prescriptions (
    PrescriptionID INT PRIMARY KEY,
    PatientID INT,
    MedicineID INT,
    Dosage VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (MedicineID) REFERENCES Medications(MedicineID)
);
-- Thêm dữ liệu vào bảng Patients
INSERT INTO Patients VALUES (201, N'Nguyễn Văn An', '1990-05-15', 'Nam', '0987654321', N'Tiểu đường, cao huyết áp');
INSERT INTO Patients VALUES (202, N'Trần Thị Bích', '1985-09-20', 'Nữ', '0912345678', N'Dị ứng phấn hoa');
INSERT INTO Patients VALUES (203, N'Hoàng Minh Quân', '2000-12-01', 'Nam', '0905123456', N'Viêm xoang mãn tính');
INSERT INTO Patients VALUES (204, N'Phạm Thị Mai', '1978-04-10', 'Nữ', '0938765432', N'Loãng xương');
INSERT INTO Patients VALUES (205, N'Lê Quốc Hưng', '1995-08-30', 'Nam', '0978456123', N'Bệnh tim bẩm sinh');
-- Thêm dữ liệu vào bảng Medications
INSERT INTO Medications VALUES (101, N'Thuốc giảm đau', 'P001', 'Paracetamol', '500mg', 'Paracetamol', N'Giảm đau, hạ sốt', '2025-12-31');
INSERT INTO Medications VALUES (102, N'Thuốc kháng viêm', 'I001', 'Ibuprofen', '200mg', 'Ibuprofen', N'Giảm đau, kháng viêm', '2024-09-30');
INSERT INTO Medications VALUES (103, N'Kháng sinh', 'A001', 'Amoxicillin', '500mg', 'Amoxicillin', N'Điều trị nhiễm trùng', '2026-03-15');
INSERT INTO Medications VALUES (104, N'Thuốc dị ứng', 'C001', 'Cetirizine', '10mg', 'Cetirizine', N'Giảm triệu chứng dị ứng', '2025-06-20');
INSERT INTO Medications VALUES (105, N'Thuốc tiểu đường', 'M001', 'Metformin', '500mg', 'Metformin', N'Kiểm soát đường huyết', '2026-01-10');
INSERT INTO Medications VALUES (106, N'Thuốc giảm mỡ máu', 'S001', 'Simvastatin', '20mg', 'Simvastatin', N'Giảm cholesterol', '2025-08-25');
INSERT INTO Medications VALUES (107, N'Thuốc đau dạ dày', 'O001', 'Omeprazole', '20mg', 'Omeprazole', N'Giảm axit dạ dày', '2024-12-01');
INSERT INTO Medications VALUES (108, N'Thuốc huyết áp', 'L001', 'Lisinopril', '10mg', 'Lisinopril', N'Điều trị tăng huyết áp', '2025-11-11');
INSERT INTO Medications VALUES (109, N'Thuốc kháng sinh', 'AZ001', 'Azithromycin', '500mg', 'Azithromycin', N'Điều trị nhiễm trùng hô hấp', '2025-05-05');
INSERT INTO Medications VALUES (110, N'Thuốc an thần', 'D001', 'Diazepam', '5mg', 'Diazepam', N'Giảm lo âu, mất ngủ', '2024-10-30');
INSERT INTO Medications VALUES (111, N'Thuốc bổ mắt', 'V001', 'Vitamin A', '10.000 IU', 'Vitamin A', N'Hỗ trợ thị lực', '2025-08-01');
INSERT INTO Medications VALUES (112, N'Thuốc giảm đau', 'T001', 'Tramadol', '50mg', 'Tramadol', N'Giảm đau mạnh', '2025-09-15');
INSERT INTO Medications VALUES (113, N'Thuốc cảm cúm', 'C002', 'ColdFlu', '500mg', 'Paracetamol, Vitamin C', N'Giảm triệu chứng cảm cúm', '2024-11-20');
INSERT INTO Medications VALUES (114, N'Thuốc giảm ho', 'H001', 'Dextromethorphan', '15mg', 'Dextromethorphan', N'Giảm ho khan', '2025-12-01');
INSERT INTO Medications VALUES (115, N'Thuốc chữa đau cơ', 'M002', 'Myonal', '50mg', 'Eperisone', N'Điều trị đau cơ', '2025-04-10');
INSERT INTO Medications VALUES (116, N'Thuốc bổ não', 'N001', 'Nootropil', '800mg', 'Piracetam', N'Cải thiện chức năng não', '2025-03-30');
INSERT INTO Medications VALUES (117, N'Thuốc giảm đau xương khớp', 'A002', 'Arcoxia', '60mg', 'Etoricoxib', N'Giảm đau xương khớp', '2025-07-10');
INSERT INTO Medications VALUES (118, N'Thuốc điều trị gout', 'G001', 'Febuxostat', '40mg', 'Febuxostat', N'Điều trị gout mãn tính', '2025-06-15');
INSERT INTO Medications VALUES (119, N'Thuốc hỗ trợ gan', 'H002', 'HepaMerz', '3g', 'L-Ornithine', N'Hỗ trợ chức năng gan', '2025-10-05');
INSERT INTO Medications VALUES (120, N'Thuốc giảm đau thần kinh', 'P002', 'Pregabalin', '75mg', 'Pregabalin', N'Điều trị đau thần kinh', '2025-12-20');
-- Thêm dữ liệu vào bảng Prescriptions
INSERT INTO Prescriptions VALUES (301, 201, 101, '2 viên/ngày');
INSERT INTO Prescriptions VALUES (302, 202, 104, '1 viên/ngày');
INSERT INTO Prescriptions VALUES (303, 203, 103, '3 viên/ngày');
INSERT INTO Prescriptions VALUES (304, 204, 106, '1 viên/ngày');
INSERT INTO Prescriptions VALUES (305, 205, 108, '1 viên/ngày');
-- Kiểm tra dữ liệu
SELECT * FROM Medications;
