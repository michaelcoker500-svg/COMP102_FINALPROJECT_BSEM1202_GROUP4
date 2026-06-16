
-- STEP 1: CREATE THE DATABASE

CREATE DATABASE public_health_clinic_record_system;



-- STEP 2: CREATE ALL TABLES (DDL - Data Definition Language)



-- TABLE 1: Patient

CREATE TABLE Patient (
    Patient_ID   INT PRIMARY KEY AUTO_INCREMENT,
    First_Name    VARCHAR(45),
    Last_Name     VARCHAR(25),
    Date_Of_Birth DATE,
    Gender        VARCHAR(10),
    Address       VARCHAR(50),
    Phone_Number  VARCHAR(20)
);


-- TABLE 2: Health_Worker

CREATE TABLE Health_Worker (
    Worker_ID      INT PRIMARY KEY AUTO_INCREMENT,
    First_Name     VARCHAR(35),
    Last_Name      VARCHAR(35),
    Role           VARCHAR(45),
    Phone_Number   VARCHAR(45),
    Date_Employed  DATE
);


-- TABLE 3: Appointment

CREATE TABLE Appointment (
    Appointment_ID   INT PRIMARY KEY AUTO_INCREMENT,
    Appointment_Date DATE,
    Status           VARCHAR(25),
    Patient_ID       INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    Worker_ID        INT,
    FOREIGN KEY (Worker_ID)  REFERENCES Health_Worker(Worker_ID)
);


-- TABLE 4: Check_Up

CREATE TABLE Check_Up (
    Checkup_ID        INT PRIMARY KEY AUTO_INCREMENT,
    Checkup_Date      DATE,
    Checkup_Time      VARCHAR(25),
    Patient_ID        INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    Health_Worker_ID  INT,
    FOREIGN KEY (Health_Worker_ID) REFERENCES Health_Worker(Worker_ID)
);


-- TABLE 5: Diagnosis

CREATE TABLE Diagnosis (
    Diagnosis_ID    INT PRIMARY KEY AUTO_INCREMENT,
    Diagnosis_Name  VARCHAR(45),
    Description     VARCHAR(100),
    Diagnosis_Date  DATE,
    Checkup_ID      INT,
    FOREIGN KEY (Checkup_ID) REFERENCES Check_Up(Checkup_ID),
    Patient_ID      INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);


-- TABLE 6: Treatment

CREATE TABLE Treatment (
    Treatment_ID           INT PRIMARY KEY AUTO_INCREMENT,
    Treatment_Name         VARCHAR(25),
    Medication_Prescribed  VARCHAR(25),
    Dosage                 VARCHAR(20),
    Start_Date             DATE,
    End_Date               DATE,
    Diagnosis_ID           INT,
    FOREIGN KEY (Diagnosis_ID) REFERENCES Diagnosis(Diagnosis_ID),
    Patient_ID             INT,
    FOREIGN KEY (Patient_ID)   REFERENCES Patient(Patient_ID)
);


-- TABLE 7: Payments

CREATE TABLE Payments (
    Payment_ID      INT PRIMARY KEY AUTO_INCREMENT,
    Payment_Date    DATE,
    Amount_Paid     DECIMAL(10,2),
    Payment_Method  VARCHAR(25),
    Payment_Type    VARCHAR(35),
    Patient_ID      INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    Appointment_ID  INT,
    FOREIGN KEY (Appointment_ID) REFERENCES Appointment(Appointment_ID)
);


-- TABLE 8: Inventory

CREATE TABLE Inventory (
    Item_ID             INT PRIMARY KEY AUTO_INCREMENT,
    Item_Name           VARCHAR(35),
    Category            VARCHAR(35),
    Quantity_Available  INT,
    Expiry_Date         DATE,
    Treatment_ID        INT,
    FOREIGN KEY (Treatment_ID) REFERENCES Treatment(Treatment_ID)
);



-- DDL - ALTER TABLE COMMANDS


#this is to change the name of a table
RENAME TABLE Appointment TO Clinic_Appointment;

#rename it back to original name
RENAME TABLE Clinic_Appointment TO Appointment;

#how to add a column
ALTER TABLE Patient ADD Blood_Type VARCHAR(10);

#modify a data type
ALTER TABLE Patient MODIFY First_Name VARCHAR(50);

#how to remove a column
ALTER TABLE Patient DROP COLUMN Blood_Type;

#changing a column name
ALTER TABLE Health_Worker CHANGE First_Name Full_Name VARCHAR(50);

#change it back to original name
ALTER TABLE Health_Worker CHANGE Full_Name First_Name VARCHAR(50);

#how to drop a particular database
#DROP DATABASE public_health_clinic_record_system;

#dropping a table
#DROP TABLE Inventory;



-- STEP 3: INSERT SAMPLE DATA (DML - Data Manipulation Language)
-- INSERT INTO Patient (20 records)


INSERT INTO Patient (First_Name, Last_Name, Date_Of_Birth, Gender, Address, Phone_Number)
VALUES
    ('Aminata',   'Kamara',   '1990-03-15', 'Female', 'Freetown, Western Area',      '076-111-222'),
    ('Mohamed',   'Conteh',   '1985-07-22', 'Male',   'Bo, Southern Province',       '077-333-444'),
    ('Fatmata',   'Bangura',  '2000-11-05', 'Female', 'Kenema, Eastern Province',    '078-555-666'),
    ('Ibrahim',   'Koroma',   '1978-01-30', 'Male',   'Makeni, Northern Province',   '079-777-888'),
    ('Mariama',   'Sesay',    '1995-06-18', 'Female', 'Lunsar, Northern Province',   '076-999-000'),
    ('Alhaji',    'Jalloh',   '1982-04-10', 'Male',   'Freetown, East End',          '077-112-334'),
    ('Binta',     'Turay',    '1998-09-25', 'Female', 'Waterloo, Western Rural',     '078-445-667'),
    ('Sorie',     'Dumbuya',  '1975-12-03', 'Male',   'Port Loko, North West',       '079-778-900'),
    ('Kadiatu',   'Mansaray', '2003-08-14', 'Female', 'Kono, Eastern Province',      '076-001-223'),
    ('Amara',     'Fofanah',  '1991-02-28', 'Male',   'Bonthe, Southern Province',   '077-334-556'),
    ('Isatu',     'Koroma',   '1987-05-17', 'Female', 'Moyamba, Southern Province',  '078-667-889'),
    ('Lansana',   'Kanu',     '1969-10-01', 'Male',   'Kailahun, Eastern Province',  '079-890-012'),
    ('Adama',     'Barrie',   '2001-07-07', 'Female', 'Freetown, Congo Town',        '076-123-345'),
    ('Emmanuel',  'Lahai',    '1993-11-19', 'Male',   'Freetown, Kissy',             '077-456-678'),
    ('Sia',       'Williams', '1980-06-30', 'Female', 'Bo, Tikonko',                 '078-789-901'),
    ('Abu',       'Bangura',  '1996-03-22', 'Male',   'Kabala, Koinadugu',           '079-012-234'),
    ('Memunatu',  'Kamara',   '2005-01-11', 'Female', 'Freetown, Murray Town',       '076-234-456'),
    ('Hassan',    'Sesay',    '1973-08-08', 'Male',   'Magburaka, North East',       '077-567-789'),
    ('Fatima',    'Conteh',   '1999-04-04', 'Female', 'Freetown, Aberdeen',          '078-890-012'),
    ('Sulaiman',  'Jalloh',   '1988-12-25', 'Male',   'Daru, Eastern Province',      '079-123-345');



-- INSERT INTO Health_Worker (20 records)

INSERT INTO Health_Worker (First_Name, Last_Name, Role, Phone_Number, Date_Employed)
VALUES
    ('Dr. Samuel',    'Johnson',  'Doctor', '076-100-200', '2018-04-01'),
    ('Dr. Grace',     'Turay',    'Doctor', '077-300-400', '2019-08-15'),
    ('Dr. Michael',   'Coker',    'Doctor', '075-001-100', '2010-12-01'),
    ('Nurse Hawa',    'Mansaray', 'Nurse',  '078-500-600', '2020-01-10'),
    ('Nurse John',    'Fofanah',  'Nurse',  '079-700-800', '2021-03-22'),
    ('Dr. Abu',       'Kamara',   'Doctor', '076-201-301', '2017-06-15'),
    ('Dr. Adama',     'Bangura',  'Doctor', '077-401-501', '2016-09-20'),
    ('Dr. Isatu',     'Koroma',   'Doctor', '078-601-701', '2015-03-11'),
    ('Dr. Lansana',   'Sesay',    'Doctor', '079-801-901', '2014-07-25'),
    ('Dr. Mariama',   'Conteh',   'Doctor', '076-111-301', '2013-01-08'),
    ('Nurse Fatima',  'Jalloh',   'Nurse',  '077-222-401', '2022-04-14'),
    ('Nurse Binta',   'Kanu',     'Nurse',  '078-333-501', '2022-07-30'),
    ('Nurse Amara',   'Turay',    'Nurse',  '079-444-601', '2021-11-03'),
    ('Nurse Kadiatu', 'Fofanah',  'Nurse',  '076-555-701', '2020-09-19'),
    ('Nurse Sia',     'Mansaray', 'Nurse',  '077-666-801', '2023-02-28'),
    ('Dr. Osman',     'Dumbuya',  'Doctor', '078-777-901', '2012-05-17'),
    ('Nurse Hawa',    'Koroma',   'Nurse',  '079-888-101', '2023-06-01'),
    ('Dr. Patricia',  'Williams', 'Doctor', '076-999-201', '2011-08-22'),
    ('Nurse Emmanuel','Lahai',    'Nurse',  '077-100-301', '2024-01-15'),
    ('Dr. Alhaji',    'Barrie',   'Doctor', '078-200-401', '2016-12-04');



-- INSERT INTO Appointment (20 records)

INSERT INTO Appointment (Appointment_Date, Status, Patient_ID, Worker_ID)
VALUES
    ('2025-01-10', 'Completed',  1,  1),
    ('2025-01-15', 'Completed',  2,  2),
    ('2025-02-05', 'Completed',  3,  3),
    ('2025-02-20', 'Pending',    4,  4),
    ('2025-03-01', 'Cancelled',  5,  5),
    ('2025-03-10', 'Completed',  1,  2),
    ('2025-03-15', 'Completed',  7,  7),
    ('2025-03-20', 'Pending',    8,  8),
    ('2025-04-01', 'Completed',  9,  9),
    ('2025-04-05', 'Completed', 10, 10),
    ('2025-04-10', 'Completed', 11, 11),
    ('2025-04-15', 'Pending',   12, 12),
    ('2025-04-20', 'Completed', 13, 13),
    ('2025-04-25', 'Completed', 14, 14),
    ('2025-05-01', 'Cancelled', 15, 15),
    ('2025-05-05', 'Completed', 16, 16),
    ('2025-05-10', 'Completed', 17, 17),
    ('2025-05-15', 'Pending',   18, 18),
    ('2025-05-20', 'Completed', 19, 19),
    ('2025-05-25', 'Completed', 20, 20);



-- INSERT INTO Check_Up (20 records)

INSERT INTO Check_Up (Checkup_Date, Checkup_Time, Patient_ID, Health_Worker_ID)
VALUES
    ('2025-01-10', '09:00 AM',  1,  1),
    ('2025-01-15', '10:30 AM',  2,  2),
    ('2025-02-05', '11:00 AM',  3,  3),
    ('2025-02-20', '02:00 PM',  4,  4),
    ('2025-03-10', '08:30 AM',  1,  2),
    ('2025-03-15', '09:45 AM',  6,  6),
    ('2025-03-20', '10:00 AM',  7,  7),
    ('2025-03-25', '11:15 AM',  8,  8),
    ('2025-04-01', '01:00 PM',  9,  9),
    ('2025-04-05', '02:30 PM', 10, 10),
    ('2025-04-10', '03:00 PM', 11, 11),
    ('2025-04-15', '08:00 AM', 12, 12),
    ('2025-04-20', '09:30 AM', 13, 13),
    ('2025-04-25', '10:45 AM', 14, 14),
    ('2025-05-01', '12:00 PM', 15, 15),
    ('2025-05-05', '01:15 PM', 16, 16),
    ('2025-05-10', '02:45 PM', 17, 17),
    ('2025-05-15', '03:30 PM', 18, 18),
    ('2025-05-20', '09:00 AM', 19, 19),
    ('2025-05-25', '10:30 AM', 20, 20);



-- INSERT INTO Diagnosis (20 records)

INSERT INTO Diagnosis (Diagnosis_Name, Description, Diagnosis_Date, Checkup_ID, Patient_ID)
VALUES
    ('Malaria',        'Plasmodium falciparum infection',         '2025-01-10',  1,  1),
    ('Typhoid Fever',  'Salmonella typhi bacterial infection',    '2025-01-15',  2,  2),
    ('Anaemia',        'Low red blood cell count detected',       '2025-02-05',  3,  3),
    ('Hypertension',   'High blood pressure Stage 1',             '2025-02-20',  4,  4),
    ('Malaria',        'Recurring malaria case',                  '2025-03-10',  5,  1),
    ('Tuberculosis',   'Pulmonary TB confirmed by sputum test',   '2025-03-15',  6,  6),
    ('Diabetes',       'Type 2 diabetes, elevated blood sugar',   '2025-03-20',  7,  7),
    ('Cholera',        'Vibrio cholerae intestinal infection',    '2025-03-25',  8,  8),
    ('Pneumonia',      'Bacterial infection in both lungs',       '2025-04-01',  9,  9),
    ('Diarrhoea',      'Acute watery diarrhoea, dehydration',    '2025-04-05', 10, 10),
    ('Skin Infection', 'Staphylococcal skin abscess',             '2025-04-10', 11, 11),
    ('Malnutrition',   'Severe acute malnutrition in child',      '2025-04-15', 12, 12),
    ('Typhoid Fever',  'Second typhoid case this month',          '2025-04-20', 13, 13),
    ('Hypertension',   'High blood pressure Stage 2',             '2025-04-25', 14, 14),
    ('Malaria',        'Malaria in pregnant patient',             '2025-05-01', 15, 15),
    ('Anaemia',        'Iron deficiency anaemia',                 '2025-05-05', 16, 16),
    ('Cholera',        'Cholera outbreak related case',           '2025-05-10', 17, 17),
    ('Diabetes',       'Type 1 diabetes, newly diagnosed',        '2025-05-15', 18, 18),
    ('Pneumonia',      'Viral pneumonia, mild severity',          '2025-05-20', 19, 19),
    ('Tuberculosis',   'Latent TB found during screening',        '2025-05-25', 20, 20);



-- INSERT INTO Treatment (20 records)

INSERT INTO Treatment (Treatment_Name, Medication_Prescribed, Dosage, Start_Date, End_Date, Diagnosis_ID, Patient_ID)
VALUES
    ('Antimalarial Therapy',  'Artemether-Lumefantrine', '80mg',      '2025-01-10', '2025-01-13',  1,  1),
    ('Antibiotic Therapy',    'Ciprofloxacin',           '500mg',     '2025-01-15', '2025-01-22',  2,  2),
    ('Iron Supplementation',  'Ferrous Sulphate',        '200mg',     '2025-02-05', '2025-03-05',  3,  3),
    ('Antihypertensive',      'Amlodipine',              '5mg',       '2025-02-20', '2025-05-20',  4,  4),
    ('Antimalarial Therapy',  'Artemether-Lumefantrine', '80mg',      '2025-03-10', '2025-03-13',  5,  1),
    ('TB Treatment',          'Rifampicin',              '600mg',     '2025-03-15', '2025-09-15',  6,  6),
    ('Diabetes Management',   'Metformin',               '850mg',     '2025-03-20', '2025-09-20',  7,  7),
    ('Rehydration Therapy',   'ORS Solution',            '1000ml',    '2025-03-25', '2025-03-28',  8,  8),
    ('Antibiotic Therapy',    'Amoxicillin',             '500mg',     '2025-04-01', '2025-04-08',  9,  9),
    ('Rehydration Therapy',   'ORS Solution',            '500ml',     '2025-04-05', '2025-04-07', 10, 10),
    ('Antibiotic Therapy',    'Flucloxacillin',          '250mg',     '2025-04-10', '2025-04-17', 11, 11),
    ('Nutritional Support',   'Plumpy Nut',              '92g',       '2025-04-15', '2025-07-15', 12, 12),
    ('Antibiotic Therapy',    'Ciprofloxacin',           '500mg',     '2025-04-20', '2025-04-27', 13, 13),
    ('Antihypertensive',      'Lisinopril',              '10mg',      '2025-04-25', '2025-07-25', 14, 14),
    ('Antimalarial Therapy',  'Quinine',                 '600mg',     '2025-05-01', '2025-05-08', 15, 15),
    ('Iron Supplementation',  'Ferrous Sulphate',        '200mg',     '2025-05-05', '2025-06-05', 16, 16),
    ('Rehydration Therapy',   'ORS Solution',            '1000ml',    '2025-05-10', '2025-05-13', 17, 17),
    ('Insulin Therapy',       'Insulin Glargine',        '10 units',  '2025-05-15', '2025-11-15', 18, 18),
    ('Antiviral Therapy',     'Oseltamivir',             '75mg',      '2025-05-20', '2025-05-25', 19, 19),
    ('TB Treatment',          'Isoniazid',               '300mg',     '2025-05-25', '2025-11-25', 20, 20);



-- INSERT INTO Payments (20 records)

INSERT INTO Payments (Payment_Date, Amount_Paid, Payment_Method, Payment_Type, Patient_ID, Appointment_ID)
VALUES
    ('2025-01-10', 50000.00, 'Cash',         'Consultation',  1,  1),
    ('2025-01-15', 75000.00, 'Mobile Money', 'Consultation',  2,  2),
    ('2025-02-05', 30000.00, 'Cash',         'Medication',    3,  3),
    ('2025-02-20', 45000.00, 'Cash',         'Consultation',  4,  4),
    ('2025-03-10', 50000.00, 'Mobile Money', 'Consultation',  1,  6),
    ('2025-03-10', 20000.00, 'Cash',         'Medication',    1,  6),
    ('2025-03-15', 60000.00, 'Cash',         'Consultation',  7,  7),
    ('2025-03-20', 35000.00, 'Cash',         'Medication',    8,  8),
    ('2025-04-01', 80000.00, 'Cash',         'Consultation',  9,  9),
    ('2025-04-05', 15000.00, 'Cash',         'Medication',   10, 10),
    ('2025-04-10', 40000.00, 'Mobile Money', 'Consultation', 11, 11),
    ('2025-04-15', 25000.00, 'Cash',         'Medication',   12, 12),
    ('2025-04-20', 75000.00, 'Cash',         'Consultation', 13, 13),
    ('2025-04-25', 55000.00, 'Mobile Money', 'Consultation', 14, 14),
    ('2025-05-05', 30000.00, 'Cash',         'Medication',   16, 16),
    ('2025-05-10', 20000.00, 'Mobile Money', 'Consultation', 17, 17),
    ('2025-05-15', 90000.00, 'Cash',         'Consultation', 18, 18),
    ('2025-05-20', 45000.00, 'Cash',         'Medication',   19, 19),
    ('2025-05-25', 60000.00, 'Mobile Money', 'Consultation', 20, 20),
    ('2025-05-25', 20000.00, 'Cash',         'Medication',   20, 20);



-- INSERT INTO Inventory (20 records)

INSERT INTO Inventory (Item_Name, Category, Quantity_Available, Expiry_Date, Treatment_ID)
VALUES
    ('Artemether-Lumefantrine', 'Medicine',    200, '2026-12-31',  1),
    ('Ciprofloxacin',           'Medicine',    150, '2026-06-30',  2),
    ('Ferrous Sulphate',        'Medicine',    300, '2027-01-15',  3),
    ('Amlodipine',              'Medicine',    100, '2027-03-10',  4),
    ('Artemether-Lumefantrine', 'Medicine',    180, '2026-12-31',  5),
    ('Rifampicin',              'Medicine',     80, '2027-06-01',  6),
    ('Metformin',               'Medicine',    250, '2027-09-15',  7),
    ('ORS Sachets',             'Medicine',    500, '2028-01-01',  8),
    ('Amoxicillin',             'Medicine',    400, '2026-08-20',  9),
    ('ORS Sachets',             'Medicine',    500, '2028-01-01', 10),
    ('Flucloxacillin',          'Medicine',    120, '2026-10-10', 11),
    ('Plumpy Nut',              'Supplement',   60, '2026-04-30', 12),
    ('Ciprofloxacin',           'Medicine',    150, '2026-06-30', 13),
    ('Lisinopril',              'Medicine',    200, '2027-05-25', 14),
    ('Quinine',                 'Medicine',     90, '2026-11-15', 15),
    ('Ferrous Sulphate',        'Medicine',    300, '2027-01-15', 16),
    ('ORS Sachets',             'Medicine',    500, '2028-01-01', 17),
    ('Insulin Glargine',        'Medicine',     50, '2026-03-01', 18),
    ('Oseltamivir',             'Medicine',     70, '2026-07-20', 19),
    ('Isoniazid',               'Medicine',    110, '2027-08-10', 20);



-- STEP 4: UPDATE RECORDS IN A TABLE


#update a single column for one record
UPDATE Patient
SET Phone_Number = '+23276111111'
WHERE Patient_ID = 1;

#update a different column for one record
UPDATE Patient
SET Address = 'Freetown, Hill Station'
WHERE Patient_ID = 3;

#how to do 2 changes at the same time
UPDATE Patient
SET Address = 'Bo, Tikonko', Phone_Number = '099-222-222'
WHERE Patient_ID = 9;

#update appointment status from Pending to Completed
UPDATE Appointment
SET Status = 'Completed'
WHERE Appointment_ID = 4;

#update phone number for Dr. Samuel Johnson
UPDATE Health_Worker
SET Phone_Number = '076-111-999'
WHERE Worker_ID = 1;

#update inventory quantity after new stock delivery
UPDATE Inventory
SET Quantity_Available = 250
WHERE Item_Name = 'Rifampicin';



-- STEP 5: DELETE RECORDS FROM A TABLE


#how to delete a row from a table
DELETE FROM Appointment
WHERE Appointment_ID = 5;

#delete all cancelled appointments
DELETE FROM Appointment
WHERE Status = 'Cancelled';

#delete expired inventory items
DELETE FROM Inventory
WHERE Expiry_Date < CURDATE();

#How to truncate a table (removes all rows but keeps the table)
#TRUNCATE TABLE Inventory;



-- STEP 6: SELECT QUERIES


#  * means u want to select all the records in the table
#how to select all records from a table
SELECT * FROM Patient;

SELECT * FROM Health_Worker;

SELECT * FROM Appointment;

SELECT * FROM Check_Up;

SELECT * FROM Diagnosis;

SELECT * FROM Treatment;

SELECT * FROM Payments;

SELECT * FROM Inventory;



-- SELECT - specific columns only


#how to select specific columns from a table
SELECT First_Name, Last_Name, Phone_Number FROM Patient;

#select specific columns from health worker
SELECT First_Name, Last_Name, Role FROM Health_Worker;



-- WHERE - search for specific records


#how to search for a specific record using ID
SELECT * FROM Patient
WHERE Patient_ID = 3;

#how to display all female patients
SELECT * FROM Patient
WHERE Gender = 'Female';

#how to display all male patients
SELECT * FROM Patient
WHERE Gender = 'Male';

#how to display all doctors only
SELECT * FROM Health_Worker
WHERE Role = 'Doctor';

#how to display all nurses only
SELECT * FROM Health_Worker
WHERE Role = 'Nurse';

#how to display all completed appointments
SELECT * FROM Appointment
WHERE Status = 'Completed';

#how to display all pending appointments
SELECT * FROM Appointment
WHERE Status = 'Pending';

#how to display patients from Freetown
SELECT * FROM Patient
WHERE Address LIKE 'Freetown%';

#how to display patients from Bo
SELECT * FROM Patient
WHERE Address LIKE 'Bo%';

#how to display all malaria diagnoses
SELECT * FROM Diagnosis
WHERE Diagnosis_Name = 'Malaria';



-- AND - get a specific result using two conditions


#how to use AND to get a specific result
#both conditions must be true
SELECT * FROM Payments
WHERE Amount_Paid > 50000 AND Payment_Method = 'Cash';

#display completed appointments for a specific patient
SELECT * FROM Appointment
WHERE Status = 'Completed' AND Patient_ID = 1;



-- OR - using OR to get results


#using OR - only one condition needs to be true
SELECT * FROM Diagnosis
WHERE Diagnosis_Name = 'Malaria' OR Diagnosis_Name = 'Typhoid Fever';

#display patients from Freetown or Bo
SELECT * FROM Patient
WHERE Address LIKE 'Freetown%' OR Address LIKE 'Bo%';



-- BETWEEN - search within a range


#how to use BETWEEN
SELECT * FROM Payments
WHERE Amount_Paid BETWEEN 30000 AND 70000;

#display appointments between two dates
SELECT * FROM Appointment
WHERE Appointment_Date BETWEEN '2025-01-01' AND '2025-03-31';



-- LIKE - search using patterns


#if u want to search where Last_Name starts with K
#u put the % at the end of the letter 'K%'
SELECT * FROM Patient
WHERE Last_Name LIKE 'K%';

#if the name ends with a u put % before the letter '%a'
SELECT * FROM Patient
WHERE Last_Name LIKE '%a';

#this displays names that have the letter 'a' inside them
SELECT * FROM Health_Worker
WHERE First_Name LIKE '%a%';

#where the Diagnosis_Name starts with the word Typhoid
SELECT * FROM Diagnosis
WHERE Diagnosis_Name LIKE 'Typhoid%';

#search for patients whose address contains Freetown
SELECT * FROM Patient
WHERE Address LIKE '%Freetown%';



-- IN - display records that match a list of values


#this only displays records where the ID matches the numbers in the IN bracket
SELECT * FROM Patient
WHERE Patient_ID IN (2, 4, 7);

#display specific diagnoses using IN
SELECT * FROM Diagnosis
WHERE Diagnosis_Name IN ('Malaria', 'Tuberculosis', 'Cholera');

#display specific workers using IN
SELECT * FROM Health_Worker
WHERE Worker_ID IN (1, 3, 5);


-- ORDER BY - sort records in ascending or descending order
-- ASC = ascending (smallest to biggest / A to Z)
-- DESC = descending (biggest to smallest / Z to A)


#how to sort patients alphabetically by first name
SELECT * FROM Patient
ORDER BY First_Name ASC;

#sort payments from highest to lowest amount
SELECT * FROM Payments
ORDER BY Amount_Paid DESC;

#sort appointments from newest to oldest
SELECT * FROM Appointment
ORDER BY Appointment_Date DESC;

#sort health workers by date employed oldest to newest
SELECT * FROM Health_Worker
ORDER BY Date_Employed ASC;


-- LIMIT - show a limited number of records
-- it can be used to show few records
-- to get the top result
-- control large datasets


#how to use the LIMIT clause
SELECT * FROM Patient
LIMIT 5;

#how to display the top 5 highest payments
SELECT * FROM Payments
ORDER BY Amount_Paid DESC
LIMIT 5;

#display top 3 most recent appointments
SELECT * FROM Appointment
ORDER BY Appointment_Date DESC
LIMIT 3;

#offset means skip the number of records given
#OFFSET 5 means skip the first 5 records and start from record 6
SELECT * FROM Patient
LIMIT 5 OFFSET 5;



-- STEP 7: AGGREGATE FUNCTIONS
-- AVG(), COUNT(), MIN(), MAX(), SUM()


#how to check the average amount paid
SELECT AVG(Amount_Paid) FROM Payments;

#how to check the total sum of all payments
SELECT SUM(Amount_Paid) FROM Payments;

#how to count how many records are in a table
SELECT COUNT(*) FROM Patient;

SELECT COUNT(Patient_ID) FROM Patient;

#how to check the minimum payment amount
SELECT MIN(Amount_Paid) FROM Payments;

#how to check the maximum payment amount
SELECT MAX(Amount_Paid) FROM Payments;

#total amount paid per patient
SELECT Patient_ID, SUM(Amount_Paid) AS Total_Amount_Paid
FROM Payments
GROUP BY Patient_ID
ORDER BY Total_Amount_Paid DESC;

#average payment per payment type
SELECT Payment_Type, AVG(Amount_Paid) AS Average_Amount
FROM Payments
GROUP BY Payment_Type;

#count of total appointments per health worker
SELECT Worker_ID, COUNT(Appointment_ID) AS Total_Appointments
FROM Appointment
GROUP BY Worker_ID
ORDER BY Total_Appointments DESC;

#count of most common diagnoses at the clinic
SELECT Diagnosis_Name, COUNT(Diagnosis_ID) AS Total_Cases
FROM Diagnosis
GROUP BY Diagnosis_Name
ORDER BY Total_Cases DESC;

#top 3 patients who paid the most
SELECT Patient_ID, SUM(Amount_Paid) AS Total_Paid
FROM Payments
GROUP BY Patient_ID
ORDER BY Total_Paid DESC
LIMIT 3;

#5 most recent checkups
SELECT * FROM Check_Up
ORDER BY Checkup_Date DESC
LIMIT 5;

