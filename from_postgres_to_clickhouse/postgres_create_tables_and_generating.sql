CREATE TABLE Company (
  CompanyID SERIAL PRIMARY KEY,
  Name VARCHAR(255),
  Location VARCHAR(255)
);

CREATE TABLE Department (
  DepartmentID SERIAL PRIMARY KEY,
  Name VARCHAR(255),
  Description VARCHAR(255)
);

CREATE TABLE CompanyDepartment (
  CompanyID INT,
  DepartmentID INT,
  PRIMARY KEY (CompanyID, DepartmentID),
  FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID),
  FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Person (
  PersonID SERIAL PRIMARY KEY,
  Name VARCHAR(255),
  Surname VARCHAR(255),
  SocialSecurityID BIGINT,
  CompanyID INT,
  FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

CREATE TABLE Employee (
  EmployeeID SERIAL PRIMARY KEY,
  PersonID INT,
  Position VARCHAR(255),
  FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

CREATE TABLE Manager (
  ManagerID SERIAL PRIMARY KEY,
  PersonID INT,
  DepartmentID INT,
  FOREIGN KEY (PersonID) REFERENCES Person(PersonID),
  FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);


INSERT INTO Company (Name, Location) VALUES
('Южуралзолото', '457020,Челябинская обл., г. Пласт, тер. Шахта Центральная'),
('Тинькоф', '127287,г. Москва, вн.тер.г. муниципальный округ Савеловский, ул Хуторская 2-я, д. 38А, стр. 26'),
('Сбербанк', '117312,г. Москва, ул. Вавилова, д. 19'),
('Альфа-банк', '107078, г. Москва, ул. Каланчевская, д. 27')
;

INSERT INTO Department (Name, Description) VALUES
('Департамент анализа рисков', 'Анализ рисков'),
('Департамент противодействия недобросовестным практикам', 'Антифрод')
;


INSERT INTO CompanyDepartment (CompanyID, DepartmentID) VALUES
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
(16, 1),
(16, 2)
;

INSERT INTO person (Name, Surname, SocialSecurityID, CompanyID) VALUES
('Joseph', 'Mcdonald', 755896523, 13),
('Micheal', 'Kline', 27725583, 13),
('Dr. Nicole', 'Roberts', 241080522, 13),
('Sarah', 'Powell', 512078414, 13),
('Patricia', 'Hall', 731402288, 13),
('Steven', 'Chaney', 421731785, 13),
('Perry', 'Vaughn', 705108432, 13),
('Rachel', 'Phillips', 893541582, 13),
('Karen', 'Scott', 178787257, 13),
('Margaret', 'Fox', 560449514, 13),
('Evan', 'Nunez', 385596637, 13),
('Michele', 'Barton', 565277656, 13),
('Cathy', 'Smith', 840416066, 13),
('Barbara', 'White', 485817876, 13),
('Kimberly', 'Davis', 160484501, 13),
('Joseph', 'Chavez', 144798591, 13),
('Veronica', 'Moore', 19620426, 13),
('Sandra', 'Taylor', 662651852, 13),
('Wendy', 'Bryant', 725056669, 13),
('Cameron', 'King', 152188671, 13),
('Kristen', 'Evans', 399359691, 14),
('Mrs. Samantha', 'Powers', 500783097, 14),
('Matthew', 'Hanna', 419441479, 14),
('James', 'Jones', 712669288, 14),
('Brandon', 'Rogers', 147191847, 14),
('Zachary', 'King', 702693629, 14),
('Brittany', 'Moore', 334591739, 14),
('Anna', 'Bates', 809931294, 14),
('Jack', 'Brown', 557432685, 14),
('Timothy', 'Mccullough', 511522322, 14),
('John', 'Moore', 391630924, 14),
('Samuel', 'Kennedy', 429612750, 14),
('Eric', 'Hughes', 423973547, 14),
('Sean', 'Reyes', 312277604, 14),
('Shannon', 'Smith', 748251315, 14),
('Gary', 'Marshall', 177405891, 14),
('Mrs. Natalie', 'Navarro', 388579458, 14),
('Emily', 'Smith', 563359160, 14),
('Kristina', 'Cox', 575836371, 14),
('Anna', 'Duran', 544210918, 14),
('Lydia', 'Davis', 425023574, 15),
('Donna', 'Jones', 44465637, 15),
('Kendra', 'Soto', 26433750, 15),
('Shelley', 'Downs', 198353435, 15),
('Wendy', 'Freeman', 7954866, 15),
('Natalie', 'Smith', 102395650, 15),
('Michaela', 'Diaz', 661690185, 15),
('Joshua', 'Ramirez', 280150237, 15),
('Sharon', 'Craig', 525979624, 15),
('Nicole', 'Hale', 898261409, 15),
('Jeremy', 'Bartlett', 594612802, 15),
('James', 'Davis', 432962194, 15),
('Breanna', 'Warner', 794789395, 15),
('Eric', 'Matthews', 757630890, 15),
('Gregory', 'Martin', 332781260, 15),
('Joshua', 'Malone', 305333732, 15),
('Kelly', 'Holt', 324660825, 15),
('Danielle', 'Ritter', 472136796, 15),
('Michele', 'Wallace', 228907882, 15),
('Emma', 'Mcgee', 885900940, 15),
('Jeffrey', 'Johnson', 382629752, 16),
('Susan', 'Johnson', 686806088, 16),
('Kathryn', 'Stafford', 610726303, 16),
('Brandon', 'Lee', 796361220, 16),
('Theresa', 'Ramos', 89880223, 16),
('Victoria', 'Wright', 331360050, 16),
('Linda', 'Fuentes', 65970494, 16),
('Daniel', 'Watts', 163628136, 16),
('Michael', 'Patterson', 680842179, 16),
('Marie', 'Smith', 376482202, 16),
('Scott', 'Wiley', 673897524, 16),
('Tiffany', 'Howard', 713678126, 16),
('Bryan', 'Williams', 475122602, 16),
('Kristen', 'Franklin', 353091789, 16),
('Julia', 'Hodges', 107381407, 16),
('Anthony', 'Gallagher', 863524566, 16),
('Stefanie', 'Jones', 86420957, 16),
('Mr. Andrew', 'Webster', 848568128, 16),
('Donald', 'Mcgrath', 846120991, 16),
('Alexis', 'Kane', 194614266, 16)
;

INSERT INTO employee (PersonID, Position) VALUES
(1, 'Mining engineer'),
(2, 'Garment/textile technologist'),
(3, 'Counselling psychologist'),
(4, 'Pharmacologist'),
(5, 'Graphic designer'),
(6, 'Accountant, chartered'),
(7, 'Surveyor, commercial/residential'),
(8, 'Investment banker, corporate'),
(9, 'Armed forces logistics/support/administrative officer'),
(10, 'Lexicographer'),
(11, 'Scientist, physiological'),
(12, 'Media buyer'),
(13, 'Civil engineer, consulting'),
(14, 'Financial adviser'),
(15, 'Cabin crew'),
(16, 'Chemical engineer'),
(17, 'Animal technologist'),
(18, 'Immigration officer'),
(19, 'Clinical molecular geneticist'),
(20, 'Software engineer'),
(21, 'Rural practice surveyor'),
(22, 'Surveyor, minerals'),
(23, 'Engineer, site'),
(24, 'Wellsite geologist'),
(25, 'Dealer'),
(26, 'Learning mentor'),
(27, 'Geographical information systems officer'),
(28, 'Retail merchandiser'),
(29, 'Media planner'),
(30, 'Government social research officer'),
(31, 'Magazine journalist'),
(32, 'Architectural technologist'),
(33, 'International aid/development worker'),
(34, 'Office manager'),
(35, 'Logistics and distribution manager'),
(36, 'Fashion designer'),
(37, 'Medical physicist'),
(38, 'Games developer'),
(39, 'Oncologist'),
(40, 'Scientist, marine'),
(41, 'Agricultural engineer'),
(42, 'Chartered certified accountant'),
(43, 'Arts administrator'),
(44, 'Tourist information centre manager'),
(45, 'Licensed conveyancer'),
(46, 'Product designer'),
(47, 'Diplomatic Services operational officer'),
(48, 'Analytical chemist'),
(49, 'Health visitor'),
(50, 'Magazine journalist'),
(51, 'Sound technician, broadcasting/film/video'),
(52, 'Mining engineer'),
(53, 'Records manager'),
(54, 'Pathologist'),
(55, 'Broadcast engineer'),
(56, 'Holiday representative'),
(57, 'Historic buildings inspector/conservation officer'),
(58, 'Ophthalmologist'),
(59, 'Industrial buyer'),
(60, 'Engineer, energy'),
(61, 'International aid/development worker'),
(62, 'Health physicist'),
(63, 'Licensed conveyancer'),
(64, 'Product manager'),
(65, 'Arts administrator'),
(66, 'Graphic designer'),
(67, 'Therapist, art'),
(68, 'Clinical cytogeneticist'),
(69, 'Travel agency manager'),
(70, 'Media planner'),
(71, 'Animator'),
(72, 'Claims inspector/assessor'),
(73, 'Designer, jewellery'),
(74, 'Development worker, international aid'),
(75, 'Secondary school teacher'),
(76, 'Set designer'),
(77, 'Chief Marketing Officer'),
(78, 'Psychologist, educational'),
(79, 'Production designer, theatre/television/film'),
(80, 'Animal technologist')
;

INSERT INTO manager (PersonID, DepartmentID) VALUES
(3, 1),
(8, 2),
(22, 1),
(36, 2),
(45, 1),
(48, 2),
(66, 1),
(72, 2)
;
