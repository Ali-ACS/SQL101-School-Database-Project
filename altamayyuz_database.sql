
-- ========================================================
-- مشروع SQL 101 - قاعدة بيانات التميز
-- ========================================================

-- إنشاء قاعدة البيانات وضبطها
DROP DATABASE IF EXISTS AlTamayyuz;
CREATE DATABASE AlTamayyuz;
USE AlTamayyuz;

-- 1. إنشاء الجداول الأساسية
-- إنشاء جدول الطلاب
CREATE TABLE Students (
    Student_ID INT PRIMARY KEY AUTO_INCREMENT, -- رقم تسلسلي فريد للطالب مع تزايد رقم الآيدي تلقائياً
    Student_Name VARCHAR(225) NOT NULL, -- اسم الطالب نصي ويشترط ألا يكون فارغاً
    Student_Birth_Date DATE, -- تاريخ ميلاد الطالب
    Student_Gender CHAR(1) CHECK (Student_Gender IN ('M', 'F')), -- جنس الطالب (ذكر أو أنثى)
    Enrollment_Date DATE, -- تاريخ الالتحاق
    Student_Email VARCHAR(225) UNIQUE, -- بريد إلكتروني فريد لا يتكرر
    Academic_Level INT CHECK (Academic_Level IN (1, 2, 3, 4, 5, 6)), -- مستويات الدراسة من 1 إلى 6
    track VARCHAR(25) CHECK (track IN ('Scientific', 'Humanities')), -- المسار محصور بين علمي وإنساني
    Student_GPA DECIMAL(5,2) CHECK (Student_GPA BETWEEN 0.00 AND 100.00) -- المعدل التراكمي بين 0 و 100
);

-- إنشاء جدول المعلمين
CREATE TABLE Teachers (
    Teacher_ID INT PRIMARY KEY AUTO_INCREMENT, -- الرقم التسلسلي للمعلم: مفتاح أساسي فريد يتزايد تلقائياً
    Teacher_Name VARCHAR(225) NOT NULL, -- اسم المعلم: نص متغير لا يمكن تركه فارغاً
    Teacher_Birth_Date DATE, -- تاريخ ميلاد المعلم بصيغة تاريخ
    Teacher_Gender CHAR(1) CHECK (Teacher_Gender IN ('M', 'F')), -- جنس المعلم: محصور بين M و F
    Teacher_Email VARCHAR(225) UNIQUE, -- البريد الإلكتروني للمعلم: فريد ولا يتكرر
    Teacher_Office_Number VARCHAR(10) UNIQUE -- رقم أو رمز المكتب: نص فريد لكل معلم
);

-- إنشاء جدول المواد
CREATE TABLE Materials (
    Material_ID INT PRIMARY KEY AUTO_INCREMENT, -- الرقم التسلسلي للمادة: مفتاح أساسي فريد يتزايد تلقائياً
    Material_Name VARCHAR(50) NOT NULL -- اسم المادة: بحد أقصى 50 حرفاً ولا يمكن تركه فارغاً
);

-- عرض الجداول المنشأة
SHOW TABLES;


-- 2. إدخال البيانات في الجداول
-- إدخال 30 سجلاً في جدول الطلاب
INSERT INTO Students (Student_ID, Student_Name, Student_Birth_Date, Student_Gender, Enrollment_Date, Student_Email, Academic_Level, track, Student_GPA) VALUES
(1, 'Ali Mohammed', '2001-12-02', 'M', '2023-09-01', 'ali.m@gmail.com', 1, 'Scientific', 96.65), -- الطالب 1: علي، مستوى 1 مسار علمي بمعدل 96.65
(2, 'Sara Ahmed', '2002-05-14', 'F', '2023-09-01', 'sara.a@gmail.com', 1, 'Scientific', 88.50), -- الطالب 2: سارة، مستوى 1 مسار علمي بمعدل 88.50
(3, 'Omar Khalid', '2000-08-22', 'M', '2022-09-01', 'omar.k@gmail.com', 3, 'Humanities', 75.20), -- الطالب 3: عمر، مستوى 3 مسار إنساني بمعدل 75.20
(4, 'Noura Fahad', '2003-01-10', 'F', '2024-01-15', 'noura.f@gmail.com', 2, 'Scientific', 92.10), -- الطالب 4: نورة، مستوى 2 مسار علمي بمعدل 92.10
(5, 'Zaid Tariq', '2001-11-05', 'M', '2023-09-01', 'zaid.t@gmail.com', 2, 'Humanities', 81.40), -- الطالب 5: زيد، مستوى 2 مسار إنساني بمعدل 81.40
(6, 'Reem Saleh', '2002-03-30', 'F', '2023-09-01', 'reem.s@gmail.com', 1, 'Scientific', 94.00), -- الطالب 6: ريم، مستوى 1 مسار علمي بمعدل 94.00
(7, 'Fahad Nasser', '1999-07-19', 'M', '2021-09-01', 'fahad.n@gmail.com', 5, 'Scientific', 69.80), -- الطالب 7: فهد، مستوى 5 مسار علمي بمعدل 69.80
(8, 'Mona Abdullah', '2002-09-12', 'F', '2023-09-01', 'mona.ab@gmail.com', 3, 'Humanities', 85.75), -- الطالب 8: منى، مستوى 3 مسار إنساني بمعدل 85.75
(9, 'Hassan Saeed', '2000-02-18', 'M', '2022-09-01', 'hassan.s@gmail.com', 4, 'Scientific', 78.90), -- الطالب 9: حسن، مستوى 4 مسار علمي بمعدل 78.90
(10, 'Laila Mansour', '2003-06-25', 'F', '2024-01-15', 'laila.m@gmail.com', 1, 'Humanities', 90.30), -- الطالب 10: ليلى، مستوى 1 مسار إنساني بمعدل 90.30
(11, 'Youssef Ibrahim', '2001-04-11', 'M', '2023-09-01', 'youssef.i@gmail.com', 2, 'Scientific', 83.25), -- الطالب 11: يوسف، مستوى 2 مسار علمي بمعدل 83.25
(12, 'Huda Salem', '2002-10-08', 'F', '2023-09-01', 'huda.s@gmail.com', 3, 'Scientific', 87.60), -- الطالب 12: هدى، مستوى 3 مسار علمي بمعدل 87.60
(13, 'Hamad Sultan', '2000-12-01', 'M', '2022-09-01', 'hamad.s@gmail.com', 4, 'Humanities', 72.45), -- الطالب 13: حمد، مستوى 4 مسار إنساني بمعدل 72.45
(14, 'Fatima Qasim', '2003-03-17', 'F', '2024-01-15', 'fatima.q@gmail.com', 1, 'Scientific', 98.10), -- الطالب 14: فاطمة، مستوى 1 مسار علمي بمعدل 98.10
(15, 'Majed Bander', '2001-08-09', 'M', '2023-09-01', 'majed.b@gmail.com', 2, 'Scientific', 79.50), -- الطالب 15: ماجد، مستوى 2 مسار علمي بمعدل 79.50
(16, 'Aisha Yasser', '2002-01-29', 'F', '2023-09-01', 'aisha.y@gmail.com', 3, 'Humanities', 89.00), -- الطالب 16: عائشة، مستوى 3 مسار إنساني بمعدل 89.00
(17, 'Rayan Adel', '2000-05-15', 'M', '2022-09-01', 'rayan.a@gmail.com', 4, 'Scientific', 91.20), -- الطالب 17: ريان، مستوى 4 مسار علمي بمعدل 91.20
(18, 'Kholoud Walid', '2003-11-20', 'F', '2024-01-15', 'kholoud.w@gmail.com', 1, 'Scientific', 93.40), -- الطالب 18: خلود، مستوى 1 مسار علمي بمعدل 93.40
(19, 'Bader Saud', '1999-10-04', 'M', '2021-09-01', 'bader.s@gmail.com', 6, 'Humanities', 74.80), -- الطالب 19: بدر، مستوى 6 مسار إنساني بمعدل 74.80
(20, 'Asma Mutlaq', '2002-07-13', 'F', '2023-09-01', 'asma.m@gmail.com', 2, 'Scientific', 86.15), -- الطالب 20: أسماء، مستوى 2 مسار علمي بمعدل 86.15
(21, 'Turki Nayef', '2001-09-27', 'M', '2023-09-01', 'turki.n@gmail.com', 3, 'Humanities', 80.00), -- الطالب 21: تركي، مستوى 3 مسار إنساني بمعدل 80.00
(22, 'Raghad Fawaz', '2003-04-03', 'F', '2024-01-15', 'raghad.f@gmail.com', 1, 'Scientific', 95.70), -- الطالب 22: رغد، مستوى 1 مسار علمي بمعدل 95.70
(23, 'Sultan Hamad', '2000-03-21', 'M', '2022-09-01', 'sultan.h@gmail.com', 5, 'Scientific', 71.30), -- الطالب 23: سلطان، مستوى 5 مسار علمي بمعدل 71.30
(24, 'Dana Hazem', '2002-12-16', 'F', '2023-09-01', 'dana.h@gmail.com', 2, 'Humanities', 84.60), -- الطالب 24: دانة، مستوى 2 مسار إنساني بمعدل 84.60
(25, 'Meshari Talal', '2001-06-07', 'M', '2023-09-01', 'meshari.t@gmail.com', 3, 'Scientific', 88.90), -- الطالب 25: مشاري، مستوى 3 مسار علمي بمعدل 88.90
(26, 'Shahad Nabil', '2003-08-31', 'F', '2024-01-15', 'shahad.n@gmail.com', 1, 'Scientific', 97.25), -- الطالب 26: شهد، مستوى 1 مسار علمي بمعدل 97.25
(27, 'Nasser Abdulaziz', '2000-11-19', 'M', '2022-09-01', 'nasser.a@gmail.com', 4, 'Humanities', 76.50), -- الطالب 27: ناصر، مستوى 4 مسار إنساني بمعدل 76.50
(28, 'Rawan Emad', '2002-02-11', 'F', '2023-09-01', 'rawan.e@gmail.com', 2, 'Scientific', 90.80), -- الطالب 28: روان، مستوى 2 مسار علمي بمعدل 90.80
(29, 'Abdulrahman Ziyad', '1999-04-05', 'M', '2021-09-01', 'abdulrahman.z@gmail.com', 6, 'Scientific', 82.35), -- الطالب 29: عبد الرحمن، مستوى 6 مسار علمي بمعدل 82.35
(30, 'Mariam Hani', '2003-10-23', 'F', '2024-01-15', 'mariam.h@gmail.com', 1, 'Humanities', 85.00); -- الطالب 30: مريم، مستوى 1 مسار إنساني بمعدل 85.00

-- إدخال 10 سجلات في جدول المعلمين
INSERT INTO Teachers (Teacher_ID, Teacher_Name, Teacher_Birth_Date, Teacher_Gender, Teacher_Email, Teacher_Office_Number) VALUES
(1, 'Ahmed Al-Ghamdi', '1980-04-12', 'M', 'ahmed.g@altamayyuz.edu', 'A-101'), -- المعلم 1: أحمد الغامدي، مكتب A-101
(2, 'Sarah Al-Shehri', '1985-09-23', 'F', 'sarah.s@altamayyuz.edu', 'B-201'), -- المعلمة 2: سارة الشهري، مكتب B-201
(3, 'Khalid Al-Otaibi', '1975-01-15', 'M', 'khalid.o@altamayyuz.edu', 'A-102'), -- المعلم 3: خالد العتيبي، مكتب A-102
(4, 'Mona Al-Harbi', '1988-11-30', 'F', 'mona.h@altamayyuz.edu', 'B-202'), -- المعلمة 4: منى الحربي، مكتب B-202
(5, 'Tariq Al-Zahrani', '1990-06-05', 'M', 'tariq.z@altamayyuz.edu', 'C-301'), -- المعلم 5: طارق الزهراني، مكتب C-301
(6, 'Reem Al-Dosari', '1983-02-18', 'F', 'reem.d@altamayyuz.edu', 'B-203'), -- المعلمة 6: ريم الدوسري، مكتب B-203
(7, 'Fahad Al-Qahtani', '1972-08-25', 'M', 'fahad.q@altamayyuz.edu', 'A-103'), -- المعلم 7: فهد القحطاني، مكتب A-103
(8, 'Noura Al-Mutairi', '1986-12-10', 'F', 'noura.m@altamayyuz.edu', 'B-204'), -- المعلمة 8: نورة المطيري، مكتب B-204
(9, 'Sultan Al-Enazi', '1991-03-14', 'M', 'sultan.e@altamayyuz.edu', 'C-302'), -- المعلم 9: سلطان العنزي، مكتب C-302
(10, 'Laila Al-Sayed', '1984-07-22', 'F', 'laila.s@altamayyuz.edu', 'B-205'); -- المعلمة 10: ليلى السيد، مكتب B-205

-- إدخال 6 مواد دراسية في جدول المواد
INSERT INTO Materials (Material_ID, Material_Name) VALUES
(1, 'Mathematics'), -- المادة 1: مادة الرياضيات
(2, 'Physics'), -- المادة 2: مادة الفيزياء
(3, 'Chemistry'), -- المادة 3: مادة الكيمياء
(4, 'Arabic Language'), -- المادة 4: مادة اللغة العربية
(5, 'English Language'), -- المادة 5: مادة اللغة الإنجليزية
(6, 'Islamic Studies'); -- المادة 6: مادة الدراسات الإسلامية


-- 3. استعلامات العرض والترتيب
-- عرض محتويات جميع الجداول
SELECT * FROM Students;
SELECT * FROM Materials;
SELECT * FROM Teachers;

-- عرض محتويات جدول الطلاب مع ترتيب الصفوف تصاعدياً حسب اسم الطالب
SELECT * FROM Students ORDER BY Student_Name ASC;

-- عرض رقم الطالب واسمه مع إعطاء اسم مستعار لحقل اسم الطالب
SELECT Student_ID, Student_Name AS 'Name' FROM Students;


-- 4. عمليات التحديث (UPDATE)
-- تعديل البريد الإلكتروني للطالب صاحب الرقم التعريفي 1
UPDATE Students
SET Student_Email = 'Ali-M-ALZAHRANI@gmail.com'
WHERE Student_ID = 1;

-- تعديل وتحديث رقم المكتب الخاص بالمعلم صاحب المعرف رقم 1
UPDATE Teachers
SET Teacher_Office_Number = 'A-150'
WHERE Teacher_ID = 1;


-- 5. تعديل اسم الجدول
-- تعديل اسم جدول الطلاب إلى Students_2006
ALTER TABLE Students
RENAME TO Students_2006;

-- التحقق من الاسم الجديد للجدول
SHOW TABLES;
employee