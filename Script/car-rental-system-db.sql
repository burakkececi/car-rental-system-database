-------------------------------------------
-- DROP TABLES
-------------------------------------------

DROP TABLE billing;
DROP TABLE booking;
DROP TABLE serves;
DROP TABLE inform;
DROP TABLE fixes;
DROP TABLE contact;
DROP TABLE customer;
DROP TABLE customer_type;
DROP TABLE car_insurance;
DROP TABLE insurance_company;
DROP TABLE car;
DROP TABLE location;
DROP TABLE car_model;
DROP TABLE car_type;
DROP TABLE payment;
DROP TABLE staff;
DROP TABLE car_service;

-------------------------------------------
-- Customer Type
-------------------------------------------

CREATE TABLE customer_type(
    customer_type_id CHAR(4) NOT NULL,
    customer_type_name VARCHAR2(25) NOT NULL,
    customer_type_discount_rate NUMBER(2) NOT NULL,
    CONSTRAINT customer_type_id_pk PRIMARY KEY (customer_type_id),
    CONSTRAINT customer_type_name_uk UNIQUE (customer_type_name),
    CONSTRAINT customer_type_check_id CHECK (length(customer_type_id) = 4)
);

INSERT INTO customer_type VALUES ('1000', 'STAFF', 15);
INSERT INTO customer_type VALUES ('1001', 'PREMIUM', 30);
INSERT INTO customer_type VALUES ('1002', ' GOLD', 20);
INSERT INTO customer_type VALUES ('1003', 'BRONZE', 10);
INSERT INTO customer_type VALUES ('1004', 'NORMAL', 0);

-------------------------------------------
-- Customer
-------------------------------------------

CREATE TABLE customer(
identity_number CHAR(11) NOT NULL,
customer_first_name  VARCHAR2(25) NOT NULL,
customer_middle_name VARCHAR2(25),
customer_last_name VARCHAR2(25) NOT NULL,
customer_city VARCHAR2(35) NOT NULL,
customer_email VARCHAR2(30) NOT NULL,
customer_password VARCHAR2(35) NOT NULL,
customer_phone_number NUMBER(10) NOT NULL,
customer_licence_class CHAR(3) NOT NULL,
customer_licence_expiration_date DATE NOT NULL,
customer_type_id CHAR(4) NOT NULL,
customer_created_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
customer_updated_datetime TIMESTAMP NULL,
customer_available CHAR(1) NOT NULL,
CONSTRAINT customer_identity_number_pk PRIMARY KEY (identity_number),
CONSTRAINT customer_email_uk UNIQUE (customer_email),
CONSTRAINT customer_customer_type_fk FOREIGN KEY (customer_type_id) REFERENCES customer_type(customer_type_id),
CONSTRAINT customer_check_identity_number CHECK (length(identity_number) = 11)
);

INSERT INTO customer(identity_number, customer_first_name, customer_middle_name, customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000001' , 'Namik', 'Boğaç', 'Kekikli', 'Muğla', 'namik@gmail.com', 'namik123', 5555555555, 'B', TO_DATE('15-10-2024', 'DD-MM-YYYY'), '1000', 'T');
INSERT INTO customer(identity_number, customer_first_name,customer_middle_name, customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000002' ,'Elif', NULL, 'Keçeci', 'Muğla', 'elif@gmail.com', 'elif123', 5545677896, 'B', TO_DATE('16-10-2022', 'DD-MM-YYYY'), '1004', 'T');
INSERT INTO customer(identity_number, customer_first_name,customer_middle_name, customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000003' ,'Cenk', NULL, 'Gül', 'İzmit', 'cenk@gmail.com', 'cenk123', 5677654335, 'B', TO_DATE('11-10-2023', 'DD-MM-YYYY'), '1002', 'T');
INSERT INTO customer(identity_number, customer_first_name,customer_middle_name, customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000004' ,'Melisa',NULL, 'Pamuk', 'Muğla', 'melisa@gmail.com', 'melisa123', 5556789899, 'B', TO_DATE('15-10-2026', 'DD-MM-YYYY'), '1003', 'T');
INSERT INTO customer(identity_number, customer_first_name,customer_middle_name, customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000005' ,'Kerem', NULL, 'Komgun', 'Antalya', 'kerem@gmail.com', 'kerem123', 5534567064, 'B', TO_DATE('10-10-2023', 'DD-MM-YYYY'), '1004', 'T');
INSERT INTO customer(identity_number, customer_first_name,customer_middle_name, customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000006' ,'Selin', NULL, 'Lokum', 'İzmir', 'selin@gmail.com', 'selin123', 5543213344, 'B', TO_DATE('16-10-2023', 'DD-MM-YYYY'), '1002', 'T');
INSERT INTO customer(identity_number, customer_first_name,customer_middle_name, customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000007' , 'Mahmut', NULL, 'İhsan', 'Çanakkale', 'mahmut@gmail.com', 'mahmut123', 5512222222, 'B', TO_DATE('19-10-2024', 'DD-MM-YYYY'), '1002', 'T');
INSERT INTO customer(identity_number, customer_first_name,customer_middle_name, customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000008' , 'Cüneyt', NULL, 'Toyar', 'Yalova', 'cüneyt@gmail.com', 'cüneyt123', 5789876778, 'B', TO_DATE('17-10-2023', 'DD-MM-YYYY'), '1003', 'T');
INSERT INTO customer(identity_number, customer_first_name,customer_middle_name, customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000009' , 'Kutay', NULL, 'Karman', 'Ankara', 'kutay@gmail.com', 'kutay123', 5789766754, 'B', TO_DATE('10-10-2024', 'DD-MM-YYYY'), '1001', 'T');
INSERT INTO customer(identity_number, customer_first_name,customer_middle_name, customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000010' , 'Emre',NULL, 'Turan', 'İzmir', 'emre@gmail.com', 'emre123', 5555555555, 'B', TO_DATE('12-10-2025', 'DD-MM-YYYY'), '1004', 'T');
INSERT INTO customer(identity_number, customer_first_name,customer_middle_name, customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000011' , 'Zeynep', NULL, 'Aydın', 'Aydın', 'zeynep@gmail.com', 'zeynep123', 5522367654, 'B', TO_DATE('18-10-2024', 'DD-MM-YYYY'), '1004', 'T');
INSERT INTO customer(identity_number, customer_first_name ,customer_middle_name, customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000012' , 'Ahmet', NULL, 'Heybeli', 'Balıkesir', 'ahmet@gmail.com', 'ahmet123', 5321111111, 'B', TO_DATE('10-10-2025', 'DD-MM-YYYY'), '1004', 'T');
INSERT INTO customer(identity_number, customer_first_name,customer_middle_name, customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000013' ,'Emir', NULL, 'Puyta', 'Diyarbakır', 'emir@gmail.com', 'emir123', 5678978998, 'B', TO_DATE('19-10-2026', 'DD-MM-YYYY'), '1004', 'T');
INSERT INTO customer(identity_number, customer_first_name, customer_middle_name, customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000014' , 'Simge', NULL, 'Güler', 'Rize', 'simge@gmail.com', 'simge123', 5542345321, 'B', TO_DATE('15-10-2027', 'DD-MM-YYYY'), '1004', 'T');
INSERT INTO customer(identity_number, customer_first_name,customer_middle_name, customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000015' , 'Selim', NULL, 'Mutlu', 'Manisa', 'selim@gmail.com', 'selim123', 5374563432, 'B', TO_DATE('18-10-2025', 'DD-MM-YYYY'), '1003', 'T');
INSERT INTO customer(identity_number, customer_first_name,customer_middle_name ,customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000016' , 'Selen',NULL, 'Yılmaz', 'İstanbul', 'selen@gmail.com', 'selen123', 5583214547, 'B', TO_DATE('19-10-2023', 'DD-MM-YYYY'), '1002', 'T');
INSERT INTO customer(identity_number, customer_first_name,customer_middle_name, customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000017' , 'Can', NULL, 'Yaman', 'Trabzon', 'can@gmail.com', 'can123', 5543786787, 'B', TO_DATE('15-10-2022', 'DD-MM-YYYY'), '1004', 'T');
INSERT INTO customer(identity_number, customer_first_name, customer_middle_name, customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000018' , 'Melis', NULL, 'Koyan', 'Çorum', 'melis@gmail.com', 'melis123', 5321234433, 'B', TO_DATE('17-10-2025', 'DD-MM-YYYY'), '1001', 'T');
INSERT INTO customer(identity_number, customer_first_name,customer_middle_name, customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000019' , 'Yeliz', NULL, 'Kabuk', 'Ankara', 'yeliz@gmail.com', 'yeliz123', 5523457897, 'B', TO_DATE('20-10-2023', 'DD-MM-YYYY'), '1002', 'T');
INSERT INTO customer(identity_number, customer_first_name,customer_middle_name, customer_last_name, customer_city, customer_email, customer_password, customer_phone_number, customer_licence_class, customer_licence_expiration_date, customer_type_id, customer_available) 
VALUES ('10000000020' , 'Oytun', NULL, 'Saler', 'Kırklareli', 'oytun@gmail.com', 'oytun123', 5675874342, 'B', TO_DATE('12-10-2024', 'DD-MM-YYYY'), '1001', 'T');

-------------------------------------------
-- Location
-------------------------------------------

CREATE TABLE location(
location_id CHAR(4) NOT NULL,
location_name VARCHAR2(50) NOT NULL,
location_city VARCHAR2(20) NOT NULL,
CONSTRAINT location_location_id_pk PRIMARY KEY (location_id)
);

INSERT INTO location 
VALUES ('1000', 'Bodrum Havalimani', 'Muğla');
INSERT INTO location 
VALUES ('1001', 'Çayeli', 'Rize');
INSERT INTO location 
VALUES ('1002', 'Çorum Havalimani', 'Çorum');
INSERT INTO location 
VALUES ('1003', 'Salihli', 'Manisa');
INSERT INTO location 
VALUES ('1004', 'Yalova Havalimani', 'Yalova');
INSERT INTO location 
VALUES ('1005', 'Diyabakır Havalimani', 'Diyarbakır');
INSERT INTO location 
VALUES ('1006', 'Milas', 'Muğla');
INSERT INTO location 
VALUES ('1007', 'İzmit Havalimani', 'İzmit');
INSERT INTO location 
VALUES ('1008', 'Trabzonspor Stadyumu', 'Trabzon');
INSERT INTO location 
VALUES ('1009', 'Etimesgut', 'Ankara');
INSERT INTO location 
VALUES ('1010', 'Çanakkale Havalimani', 'Çanakkale');
INSERT INTO location 
VALUES ('1011', 'Konak', 'İzmir');
INSERT INTO location 
VALUES ('1012', 'Kırklareli Havalimani', 'Kırklareli');
INSERT INTO location 
VALUES ('1013', 'Sabiha Gökçen Havalimani', 'İstanbul');
INSERT INTO location 
VALUES ('1014', 'Çankaya', 'Ankara');
INSERT INTO location 
VALUES ('1015', 'Aydın Havalimani', 'Aydın');
INSERT INTO location 
VALUES ('1016', 'Adnan Menderes Havalimani', 'İzmir');
INSERT INTO location 
VALUES ('1017', 'Kaş', 'Antalya');
INSERT INTO location 
VALUES ('1018', 'Kadiköy', 'İstanbul');
INSERT INTO location 
VALUES ('1019', 'Balikesir Havalimani', 'Balıkesir');

-------------------------------------------
-- Car Type
-------------------------------------------

CREATE TABLE car_type(
    car_type_id CHAR(4) NOT NULL,
    car_type_maker VARCHAR2(15) NOT NULL,
    car_type_model_name VARCHAR2(20) NOT NULL,
    car_type_model_class CHAR(1) NOT NULL,
    CONSTRAINT car_type_car_type_id_pk PRIMARY KEY(car_type_id)
);

INSERT INTO car_type 
VALUES ('1000','Opel', 'Astra', 'C');
INSERT INTO car_type 
VALUES ('1001','Volkswagen', 'Passat', 'D');
INSERT INTO car_type 
VALUES ('1002','Fiat', 'Egea', 'C');
INSERT INTO car_type 
VALUES ('1003','Fiat', 'Egea', 'C');
INSERT INTO car_type 
VALUES ('1004','Audi', 'A3', 'C');
INSERT INTO car_type 
VALUES ('1005','Opel', 'Corsa', 'B');
INSERT INTO car_type 
VALUES ('1006','Renault', 'Megane', 'C');
INSERT INTO car_type 
VALUES ('1007','BMW', 'F30', 'D');
INSERT INTO car_type 
VALUES ('1008','Citroen', 'C4', 'C');
INSERT INTO car_type 
VALUES ('1009','BMW', '1.16', 'C');
INSERT INTO car_type 
VALUES ('1010','Volkswagen', 'T-Roc', 'C');
INSERT INTO car_type 
VALUES ('1011','Volkswagen', 'Golf', 'C');
INSERT INTO car_type 
VALUES ('1012','Mercedes', 'C', 'D');
INSERT INTO car_type 
VALUES ('1013','Opel', 'Corsa', 'B');
INSERT INTO car_type 
VALUES ('1014','Renault', 'Clio', 'B');
INSERT INTO car_type 
VALUES ('1015','Renault', 'Clio', 'B');
INSERT INTO car_type 
VALUES ('1016','Mercedes', 'A180', 'C');
INSERT INTO car_type 
VALUES ('1017','Citroen', 'C3', 'B');
INSERT INTO car_type 
VALUES ('1018','Audi', 'A4', 'D');
INSERT INTO car_type 
VALUES ('1019','Volkswagen', 'Polo', 'B');

-------------------------------------------
-- Car Model
-------------------------------------------

CREATE TABLE car_model(
model_id CHAR(4) NOT NULL,
car_type_id CHAR(4) NOT NULL,
model_year NUMBER(4) NOT NULL,
cost_per_day NUMBER NOT NULL,
late_fee_per_hour NUMBER NOT NULL,
CONSTRAINT car_model_model_id_pk PRIMARY KEY(model_id),
CONSTRAINT car_model_car_type_fk FOREIGN KEY(car_type_id) REFERENCES car_type(car_type_id)
);

INSERT INTO car_model VALUES ('4000','1005', 2015, 156.00, 29.00);
INSERT INTO car_model VALUES ('4001','1001', 2019, 180.00, 41.00);
INSERT INTO car_model VALUES ('4002','1014', 2008, 109.00, 23.00);
INSERT INTO car_model VALUES ('4003','1004', 2007, 105.00, 22.00);
INSERT INTO car_model VALUES ('4004','1013', 2016, 145.00, 32.00);
INSERT INTO car_model VALUES ('4005','1016', 2014, 140.00, 30.00);
INSERT INTO car_model VALUES ('4006','1012', 2010, 120.00, 26.00);
INSERT INTO car_model VALUES ('4007','1009', 2019, 169.00, 31.00);
INSERT INTO car_model VALUES ('4008','1000', 2021, 170.00, 30.00);
INSERT INTO car_model VALUES ('4009','1002', 2011, 116.00, 24.00);
INSERT INTO car_model VALUES ('4010','1018', 2013, 118.00, 23.00);
INSERT INTO car_model VALUES ('4011','1008', 2007, 107.00, 19.00);
INSERT INTO car_model VALUES ('4012','1011', 2005, 95.00, 14.00);
INSERT INTO car_model VALUES ('4013','1007', 2010, 110.00, 19.00);
INSERT INTO car_model VALUES ('4014','1010', 2008, 100.00, 16.00);
INSERT INTO car_model VALUES ('4015','1019', 2022, 210.00, 35.00);
INSERT INTO car_model VALUES ('4016','1003', 2010, 115.00, 15.00);
INSERT INTO car_model VALUES ('4017','1017', 2021, 200.00, 32.00);
INSERT INTO car_model VALUES ('4018','1006', 2018, 150.00, 25.00);
INSERT INTO car_model VALUES ('4019','1015', 2005, 90.00, 12.00);

-------------------------------------------
-- Car
-------------------------------------------

CREATE TABLE car(
chassis_number CHAR(17) NOT NULL,
car_availability CHAR(1) NOT NULL,
car_mileage NUMBER NOT NULL,
car_rating CHAR(1),
car_model_id CHAR(4) NOT NULL,
car_location_id CHAR(4) NOT NULL,
car_belongs_to_loc_datetime TIMESTAMP NOT NULL,
CONSTRAINT car_chassis_number_pk PRIMARY KEY (chassis_number),
CONSTRAINT car_car_model_id_fk FOREIGN KEY (car_model_id) REFERENCES car_model(model_id),
CONSTRAINT car_location_id_fk FOREIGN KEY (car_location_id) REFERENCES location (location_id),
CONSTRAINT car_check_chassis_number CHECK (length(chassis_number) = 17)
);

INSERT INTO car 
VALUES ('5KLSH41TYRW321946', 'T', 100000, '2', '4003', '1003', TO_TIMESTAMP('29-APR-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));
INSERT INTO car 
VALUES ('8CKRS67SLMN765987', 'F', 21387, '3', '4006', '1006', TO_TIMESTAMP('10-JUL-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));
INSERT INTO car 
VALUES ('2PTRY22KLRJ398221', 'T', 67500, '8', '4018', '1018', TO_TIMESTAMP('21-NOV-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));
INSERT INTO car 
VALUES ('7YOTR32PRTY110156', 'T', 56780, '3', '4004', '1004', TO_TIMESTAMP('21-MAY-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));
INSERT INTO car 
VALUES ('4PCVY98SFRT131176', 'F', 10567, '5', '4011', '1011', TO_TIMESTAMP('11-DEC-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));
INSERT INTO car 
VALUES ('1HGBH41JXMN109186', 'T', 145644, '1', '4001', '1001', TO_TIMESTAMP('22-FEB-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));
INSERT INTO car 
VALUES ('2PYTR98KHGR987156', 'T', 123400, '5', '4010', '1010', TO_TIMESTAMP('30-NOV-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));
INSERT INTO car 
VALUES ('1PRST41JXMN109186', 'T', 76800, '8', '4017', '1017', TO_TIMESTAMP('16-MAY-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));
INSERT INTO car 
VALUES ('8PTQQ75JXMS312476', 'F', 6000, '5', '4012', '1012', TO_TIMESTAMP('22-JAN-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));
INSERT INTO car 
VALUES ('4OTYM41JHYT109290', 'T', 134222, '2', '4002', '1002', TO_TIMESTAMP('27-MAR-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));
INSERT INTO car 
VALUES ('9TYRQ31SLMY907805', 'T', 22890, '4', '4007', '1007', TO_TIMESTAMP('19-AUG-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));
INSERT INTO car 
VALUES ('4PPRT98JJYR121190', 'T', 16700, '6', '4014', '1014', TO_TIMESTAMP('22-APR-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));
INSERT INTO car 
VALUES ('2HGBH34SFGN109186', 'F', 12600, '1', '4000', '1000', TO_TIMESTAMP('24-JAN-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));
INSERT INTO car 
VALUES ('2HHTY98YPMN110196', 'T', 89765, '7', '4016', '1016', TO_TIMESTAMP('29-AUG-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));
INSERT INTO car 
VALUES ('1YTRR98MMJN131176', 'T', 45500, '9', '4019', '1019', TO_TIMESTAMP('28-JUL-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));
INSERT INTO car 
VALUES ('4UYTR67JTYR109626', 'T', 86750, '3', '4005', '1005', TO_TIMESTAMP('19-JUN-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));
INSERT INTO car 
VALUES ('3TYTT89ZYTR189876', 'F', 167800, '6', '4013', '1013', TO_TIMESTAMP('20-FEB-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));
INSERT INTO car 
VALUES ('9UYRT11PLKR999156', 'T', 80978, '7', '4015', '1015', TO_TIMESTAMP('20-DEC-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));
INSERT INTO car 
VALUES ('5TRWQ76CMNT378298', 'T', 21345, '4', '4008', '1008', TO_TIMESTAMP('30-SEP-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));
INSERT INTO car 
VALUES ('4LKRY90DFRW312964', 'T', 214500, '4', '4009', '1009', TO_TIMESTAMP('23-OCT-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF'));


-------------------------------------------
-- Insurance Company
-------------------------------------------

CREATE TABLE insurance_company(
    company_id CHAR(4) NOT NULL, 
    company_name VARCHAR(20) NOT NULL, 
    company_city VARCHAR(100) NOT NULL, 
    company_phone_number NUMBER(10) NOT NULL,
    company_created_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    company_updated_datetime TIMESTAMP NULL,
    company_available CHAR(1) NOT NULL,
    CONSTRAINT insurance_company_id_pk PRIMARY KEY (company_id),
    CONSTRAINT insurance_company_name_uk UNIQUE(company_name)
);

INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3000', 'AGOR', 'İzmit', 5522388281, 'T');
INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3001', 'SİGMA', 'Yalova',5321234231, 'T');
INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3002', 'HYAR', 'İstanbul',1234124512, 'F');
INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3003', 'KRON', 'Ankara',5232187641, 'T');
INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3004', 'KİKSA', 'Muğla',5321283281, 'F');
INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3005', 'SAYES', 'Antalya',2322134312, 'T');
INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3006', 'MONAL', 'Yalova',5679231218, 'T');
INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3007', 'KEREV', 'Diyarbakır',3421232456, 'F');
INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3008', 'YUKA', 'Çanakkale',5234882813, 'T');
INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3009', 'KALT', 'Çorum',2312341313, 'F');
INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3010', 'ORKAN', 'Muğla',6789456783, 'T');
INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3011', 'ŞULA', 'Trabzon',5232382810, 'F');
INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3012', 'KURSAN', 'Rize',1234532314, 'T');
INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3013', 'BORKA', 'Ankara',8923217656, 'F');
INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3014', 'İLSAN', 'Kırklareli',2134562313, 'T');
INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3015', 'OPAK', 'Aydın',8765678664, 'T');
INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3016', 'ŞOKTAN', 'Manisa',7658943536, 'F');
INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3017', 'RSR', 'Balıkesir',9852318281, 'T');
INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3018', 'YHTY', 'Çanakkale',1985678483, 'F');
INSERT INTO insurance_company (company_id, company_name, company_city, company_phone_number, company_available)
VALUES('3019', 'TURAN', 'İstanbul',8967568483, 'T');

-------------------------------------------
-- Car Insurance
-------------------------------------------

CREATE TABLE car_insurance(
policy_number CHAR(13) NOT NULL,
car_id CHAR(17) NOT NULL,
insurance_company_id CHAR(4) NOT NULL,
expiration_date DATE NOT NULL,
created_date DATE NOT NULL,
CONSTRAINT car_insurance_policy_number PRIMARY KEY (policy_number),
CONSTRAINT car_insurance_company_fk FOREIGN KEY (insurance_company_id) REFERENCES insurance_company(company_id),
CONSTRAINT car_insurance_id_fk FOREIGN KEY (car_id) REFERENCES car(chassis_number)
);

INSERT INTO car_insurance 
VALUES ('C18Y678453S19', '4OTYM41JHYT109290', '3002', TO_DATE('26-06-2022', 'DD-MM-YYYY'), TO_DATE('13-07-2024', 'DD-MM-YYYY'));
INSERT INTO car_insurance 
VALUES ('A23C564598T87', '7YOTR32PRTY110156', '3004', TO_DATE('15-07-2022', 'DD-MM-YYYY'), TO_DATE('22-01-2024', 'DD-MM-YYYY'));
INSERT INTO car_insurance 
VALUES ('C19K907187F12', '5KLSH41TYRW321946', '3003', TO_DATE('11-10-2022', 'DD-MM-YYYY'), TO_DATE('16-02-2024', 'DD-MM-YYYY'));
INSERT INTO car_insurance 
VALUES ('D41R893769L95', '4UYTR67JTYR109626', '3005', TO_DATE('20-11-2022', 'DD-MM-YYYY'), TO_DATE('21-02-2024', 'DD-MM-YYYY'));
INSERT INTO car_insurance 
VALUES ('A13B324567F12', '2HGBH34SFGN109186', '3000', TO_DATE('26-12-2022', 'DD-MM-YYYY'), TO_DATE('15-01-2024', 'DD-MM-YYYY'));
INSERT INTO car_insurance 
VALUES ('H87C346999N76', '2HHTY98YPMN110196', '3016', TO_DATE('12-03-2022', 'DD-MM-YYYY'), TO_DATE('25-09-2024', 'DD-MM-YYYY'));
INSERT INTO car_insurance 
VALUES ('P22Y119543R42', '2PYTR98KHGR987156', '3010', TO_DATE('16-02-2022', 'DD-MM-YYYY'), TO_DATE('13-10-2024', 'DD-MM-YYYY'));
INSERT INTO car_insurance 
VALUES ('W87M217875L93', '8CKRS67SLMN765987', '3006', TO_DATE('12-01-2022', 'DD-MM-YYYY'), TO_DATE('29-11-2024', 'DD-MM-YYYY'));
INSERT INTO car_insurance 
VALUES ('Y65C873567M12', '9UYRT11PLKR999156', '3015', TO_DATE('16-06-2022', 'DD-MM-YYYY'), TO_DATE('18-12-2024', 'DD-MM-YYYY'));
INSERT INTO car_insurance 
VALUES ('P67C187546V22', '5TRWQ76CMNT378298', '3008', TO_DATE('27-12-2022', 'DD-MM-YYYY'), TO_DATE('19-06-2024', 'DD-MM-YYYY'));
INSERT INTO car_insurance 
VALUES ('P87C177555Y43', '1PRST41JXMN109186', '3017', TO_DATE('17-09-2022', 'DD-MM-YYYY'), TO_DATE('30-07-2024', 'DD-MM-YYYY'));
INSERT INTO car_insurance 
VALUES ('T45Q231677G12', '4LKRY90DFRW312964', '3009', TO_DATE('15-10-2022', 'DD-MM-YYYY'), TO_DATE('16-08-2024', 'DD-MM-YYYY'));
INSERT INTO car_insurance 
VALUES ('K22L288988D12', '2PTRY22KLRJ398221', '3018', TO_DATE('22-11-2022', 'DD-MM-YYYY'), TO_DATE('12-09-2024', 'DD-MM-YYYY'));
INSERT INTO car_insurance 
VALUES ('A65T167287D12', '4PPRT98JJYR121190', '3014', TO_DATE('24-07-2022', 'DD-MM-YYYY'), TO_DATE('25-04-2024', 'DD-MM-YYYY'));
INSERT INTO car_insurance 
VALUES ('B41B237869R32', '4PCVY98SFRT131176', '3011', TO_DATE('24-06-2022', 'DD-MM-YYYY'), TO_DATE('16-10-2024', 'DD-MM-YYYY'));
INSERT INTO car_insurance 
VALUES ('F87R876432L12', '9TYRQ31SLMY907805', '3007', TO_DATE('16-04-2022', 'DD-MM-YYYY'), TO_DATE('16-11-2024', 'DD-MM-YYYY'));
INSERT INTO car_insurance 
VALUES ('B31C343567D23', '1HGBH41JXMN109186', '3001', TO_DATE('26-03-2022', 'DD-MM-YYYY'), TO_DATE('28-07-2024', 'DD-MM-YYYY'));
INSERT INTO car_insurance 
VALUES ('F87C655567T12', '8PTQQ75JXMS312476', '3012', TO_DATE('25-02-2022', 'DD-MM-YYYY'), TO_DATE('15-09-2024', 'DD-MM-YYYY'));
INSERT INTO car_insurance 
VALUES ('P98T985567Y12', '3TYTT89ZYTR189876', '3013', TO_DATE('26-10-2022', 'DD-MM-YYYY'), TO_DATE('16-12-2024', 'DD-MM-YYYY'));

-------------------------------------------
-- Booking
-------------------------------------------

CREATE TABLE booking(
booking_id CHAR(5) NOT NULL,
customer_id CHAR(11) NOT NULL,
car_id CHAR(17) NOT NULL,
booking_from_datetime TIMESTAMP NOT NULL,
booking_return_datetime TIMESTAMP NOT NULL,
pick_up_location_id CHAR(4) NOT NULL,
drop_off_location_id CHAR(4) NOT NULL,
booking_actual_return_datetime TIMESTAMP,
booking_created_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
booking_updated_datetime TIMESTAMP NULL,
booking_available CHAR(1) NOT NULL,
CONSTRAINT booking_booking_id_pk PRIMARY KEY (booking_id),
CONSTRAINT booking_customer_id_fk FOREIGN KEY (customer_id) REFERENCES customer (identity_number),
CONSTRAINT booking_car_id_fk FOREIGN KEY (car_id) REFERENCES car (chassis_number),
CONSTRAINT booking_pick_up_location_id_fk FOREIGN KEY (pick_up_location_id) REFERENCES location (location_id),
CONSTRAINT booking_drop_off_location_id_fk FOREIGN KEY (drop_off_location_id) REFERENCES location (location_id)
);

-------------------------------------------
-- Payment
-------------------------------------------

CREATE TABLE payment (
    payment_id CHAR(4) NOT NULL,
    payment_type VARCHAR2(25) NOT NULL,
    CONSTRAINT payment_id_pk PRIMARY KEY (payment_id)
);

INSERT INTO payment (payment_id, payment_type)
VALUES ('0000', 'CASH');
INSERT INTO payment (payment_id, payment_type)
VALUES ('0001', 'CHECK');
INSERT INTO payment (payment_id, payment_type)
VALUES ('0002', 'DEBIT CARD');
INSERT INTO payment (payment_id, payment_type)
VALUES ('0003', 'CREDIT CARD');
INSERT INTO payment (payment_id, payment_type)
VALUES ('0004', 'MOBILE PAYMENT');
INSERT INTO payment (payment_id, payment_type)
VALUES ('0005', 'ELECTRONIC BANK TRANSFER');

-------------------------------------------
-- Billing
-------------------------------------------

CREATE TABLE billing(
bill_id NUMBER GENERATED BY DEFAULT AS IDENTITY START WITH 1000 INCREMENT BY 1,
bill_booked_id CHAR(5) NOT NULL,
bill_payment_id CHAR(4),
bill_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
total_fee NUMBER DEFAULT 0,
total_late_fee NUMBER DEFAULT 0,
CONSTRAINT billing_bill_id_pk PRIMARY KEY (bill_id),
CONSTRAINT billing_pay_id_fk FOREIGN KEY (bill_payment_id) REFERENCES payment(payment_id),
CONSTRAINT billing_booked_id_fk FOREIGN KEY (bill_booked_id) REFERENCES booking(booking_id)
);



-------------------------------------------
-- Staff
-------------------------------------------

CREATE TABLE staff(
    staff_id CHAR(4) NOT NULL,
    staff_first_name  VARCHAR2(25) NOT NULL,
    staff_middle_name VARCHAR2(25),
    staff_last_name VARCHAR2(25) NOT NULL,
    staff_email VARCHAR2(30) NOT NULL,
    staff_password VARCHAR2(35) NOT NULL,
    staff_phone_number NUMBER(10) NOT NULL,
    staff_created_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    staff_updated_datetime TIMESTAMP NULL,
    staff_available CHAR(1) NOT NULL,
    CONSTRAINT staff_id_pk PRIMARY KEY (staff_id),
    CONSTRAINT staff_email_uk UNIQUE (staff_email)
);

INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1000', 'Namik', 'Boğaç', 'Kekikli', 'namik@gmail.com', 'namik123', 5555555555, 'T');
INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1001', 'Emre',null, 'Dalgıç', 'dalgic@gmail.com', 'emre123', 5152235896, 'F');
INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1002', 'Ali','Ihsan', 'Kıymaz', 'alikiymaz@gmail.com', 'kiymaz369', 5235647887, 'T');
INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1003', 'Furkan',null, 'Çelik', 'furkancelik@gmail.com', 'furkan119', 5230527817, 'T');
INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1004', 'Ali','Osman', 'Fırat', 'aliosman@gmail.com', 'aliosman112', 521456226, 'F');
INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1005', 'Kutay',null, 'Çelik', 'kutaycelik@outlook.com', 'xxkutayxx', 5321982003, 'F');
INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1006', 'Çağrı',null, 'Ertuğrul', 'cagribey@gmail.com', 'cagricagri', 5212589779, 'T');
INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1007', 'Burak','Can', 'Kıraç', 'burakcan@yahoo.com', '4burak4', 5055888922, 'T');
INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1008', 'Ali','Furkan', 'Yalgıç', 'aliyalgic@gmail.com', 'yalgic88', 5237891214, 'F');
INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1009', 'Mehmet','Barış', 'Yılmaz', 'barisyilmaz@gmail.com', 'barisyilmaz78', 5055258877, 'T');
INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1010', 'Ali',null,'Kiraz', 'alikiraz@gmail.com', 'kiraz369', 5235647700, 'F');
INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1011', 'Büşra',null, 'Vardar', 'büsravardar@gmail.com', 'büsravardar123', 5232223664, 'T');
INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1012', 'Gamze',null, 'Asmalı', 'gamzeasmali@gmail.com', 'gamzeeee1', 5322200301, 'T');
INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1013', 'Nilay',null, 'Aybak', 'nihalaybak@gmail.com', 'aybaknihal', 5235646348, 'F');
INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1014', 'Gizem','Nur', 'Yalçın', 'gizemnur@gmail.com', 'nurgizem123', 5551647887, 'T');
INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1015', 'Cüneyt',null, 'Yerebakan', 'cüneytyerebakan@gmail.com', 'cüneyt456', 5235325656, 'F');
INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1016', 'Mehmet','Yavuz', 'Ak', 'mehmetak@gmail.com', 'memetak', 5051747887, 'F');
INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1017', 'Ferit',null, 'Zafer', 'feritzafer@gmail.com', 'zafer369', 5558981579, 'T');
INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1018', 'Zeynep','Su', 'Çiçek', 'zeynepcicek@gmail.com', 'zeynepcicek123', 5067451213, 'F');
INSERT INTO staff(staff_id, staff_first_name, staff_middle_name, staff_last_name, staff_email, staff_password, staff_phone_number, staff_available)
VALUES ('1019', 'Ali','Zeyd', 'Sancaklı', 'alizeydgmail.com', 'alizey269', 5428561457, 'T');


-------------------------------------------
-- Car Service
-------------------------------------------

CREATE TABLE car_service (
    car_service_id CHAR(4) NOT NULL,
    car_service_name  VARCHAR2(35) NOT NULL,
    car_service_city  VARCHAR2(25) NOT NULL,
    car_service_phone_number NUMBER(10) NOT NULL,
    car_service_created_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    car_service_updated_datetime TIMESTAMP NULL,
    car_service_available CHAR(1) NOT NULL,
    CONSTRAINT car_service_id_pk PRIMARY KEY (car_service_id),
    CONSTRAINT car_service_name_uk UNIQUE (car_service_name)
);

INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0000', 'KARAMANLILAR YETKILI SERVIS', 'IZMIR', 5236967856, 'T');
INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0001', 'SEÇKİN YETKILI SERVIS', 'ANKARA', 5078945625, 'T');
INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0002', 'KARACA ACİL SERVIS', 'IZMIR', 5324582252, 'F');
INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0003', 'FARUKLAR YETKILI SERVIS', 'ISTANBUL', 5158995656, 'T');
INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0004', 'KONYAALTI YETKILI SERVIS', 'ANTALYA', 5055644225, 'T');
INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0005', 'GULBAHCE CAR SERVICE', 'IZMIR', 5078945678, 'F');
INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0006', 'AHMET USTA', 'BALIKESİR', 5236879457, 'T');
INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0007', 'NİYAZİ USTA', 'BİLECİK', 5534782525, 'F');
INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0008', 'KARAHALLILAR YETKİLİ SERVİS', 'MUĞLA', 5078884567, 'F');
INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0009', 'ARABAM CAR SERVICE', 'BURSA', 5058991231, 'T');
INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0010', 'ZAFEROGLU YETKİLİ SERVİS', 'BOLU', 5075356465, 'F');
INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0011', 'DUMAN ACİL SERVİS', 'IZMIR', 5078981144, 'F');
INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0012', 'VEVAX CAR SERVICE', 'İSTANBUL', 5227456785, 'T');
INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0013', 'SAHİL OTO SERVİS', 'TRABZON', 5322214585, 'F');
INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0014', 'CENKBEY YOL YARDIM', 'ADANA', 5065446767, 'T');
INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0015', 'FIAT YETKİLİ SERVİS', 'IZMIR', 5078987979, 'F');
INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0016', 'MENGENLER YETKİLİ SERVİS', 'EDİRNE', 5157844545, 'T');
INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0017', 'BORUSAN YETKİLİ SERVİS', 'ANKARA', 5552249852, 'F');
INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0018', 'ERYAMAN YOL YARDIM', 'TRABZON', 5071411000, 'F');
INSERT INTO car_service(car_service_id, car_service_name, car_service_city, car_service_phone_number, car_service_available)
VALUES ('0019', 'HENCAN YETKİLİ SERVİS', 'ORDU', 5528955645, 'T');


-------------------------------------------
-- Inform
-------------------------------------------

CREATE TABLE inform(
    inform_id CHAR(6) NOT NULL,
    inform_staff_id CHAR(4) NOT NULL,
    inform_company_id CHAR(4) NOT NULL,
    inform_created_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    inform_status VARCHAR2(15) NOT NULL, 
    inform_reason VARCHAR2(100) NOT NULL, 
    inform_failed_outcome VARCHAR2(100),
    inform_updated_datetime TIMESTAMP,
    CONSTRAINT inform_id_pk PRIMARY KEY (inform_id),
    CONSTRAINT inform_staff_id_fk FOREIGN KEY (inform_staff_id) REFERENCES staff(staff_id),
    CONSTRAINT inform_company_id_fk FOREIGN KEY (inform_company_id) REFERENCES insurance_company(company_id)
);

INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000000', '1000', '3000', 'Approved', 'Şasi Kırık', TO_TIMESTAMP('10-SEP-2014:10:19.123000','DD-MON-RRHH24:MI:SS.FF'), 'Fixed');
INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000001', '1002', '3001', 'Approved', 'Fren Tutmuyor', TO_TIMESTAMP('11-JAN-2215:11:18.124000','DD-MON-RRHH24:MI:SS.FF'), 'Fixed');
INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000002', '1003', '3003', 'Rejected', 'Motor Yagı Azalmış', TO_TIMESTAMP('12-FEB-2116:12:17.125000','DD-MON-RRHH24:MI:SS.FF'), 'Failed');
INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000003', '1006', '3005', 'Approved', 'Lastik Aşınmış', TO_TIMESTAMP('13-MAR-2017:13:16.126000','DD-MON-RRHH24:MI:SS.FF'), 'Fixed');
INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000004', '1007', '3006', 'Approved', 'Marş Motoru Arızalı', TO_TIMESTAMP('14-APR-1914:14:15.127000','DD-MON-RRHH24:MI:SS.FF'), 'Fixed');
INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000005', '1009', '3008', 'Rejected', 'Lastik Havası İnik', TO_TIMESTAMP('15-MAY-1813:15:14.128000','DD-MON-RRHH24:MI:SS.FF'), 'Failed');
INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000006', '1011', '3010', 'Approved', 'Yakıt Tüketimi Çok Artmış', TO_TIMESTAMP('16-JUN-2013:16:13.129000','DD-MON-RRHH24:MI:SS.FF'), 'Fixed');
INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000007', '1012', '3012', 'Approved', 'Motordan Ses Geliyor', TO_TIMESTAMP('17-JUL-2114:17:12.130000','DD-MON-RRHH24:MI:SS.FF'), 'Failed');
INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000008', '1014', '3014', 'Approved', 'Akü Bitmiş', TO_TIMESTAMP('18-AUG-2214:18:11.131000','DD-MON-RRHH24:MI:SS.FF'), 'Fixed');
INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000009', '1017', '3015', 'Approved', 'Debriyaj Balatası Aşınmış', TO_TIMESTAMP('19-SEP-2115:19:10.132000','DD-MON-RRHH24:MI:SS.FF'), 'Fixed');
INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000010', '1019', '3017', 'Rejected', 'Şasi Kırık', TO_TIMESTAMP('20-OCT-2116:20:30.133000','DD-MON-RRHH24:MI:SS.FF'), 'Failed');
INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000011', '1019', '3019', 'Approved', 'Fren Yağı Azalmış', TO_TIMESTAMP('21-NOV-2215:21:33.134000','DD-MON-RRHH24:MI:SS.FF'), 'Failed');
INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000012', '1017', '3004', 'Rejected', 'Tampon Kırık', TO_TIMESTAMP('22-DEC-2216:22:35.135000','DD-MON-RRHH24:MI:SS.FF'), 'Failed');
INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000013', '1014', '3019', 'Approved', 'Ön Cam Catlak', TO_TIMESTAMP('23-NOV-1917:23:36.136000','DD-MON-RRHH24:MI:SS.FF'), 'Fixed');
INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000014', '1012', '3017', 'Rejected', 'Fren Lambası Yanmıyor', TO_TIMESTAMP('24-OCT-1913:24:37.137000','DD-MON-RRHH24:MI:SS.FF'), 'Failed');
INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000015', '1011', '3015', 'Approved', 'Yan Ayna Kırık', TO_TIMESTAMP('25-SEP-1812:25:38.138000','DD-MON-RRHH24:MI:SS.FF'), 'Fixed');
INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000016', '1009', '3012', 'Rejected', 'Marş Motoru Arızalı', TO_TIMESTAMP('26-AUG-2012:26:39.139000','DD-MON-RRHH24:MI:SS.FF'), 'Failed');
INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000017', '1007', '3010', 'Approved', 'Motor Yagı Azalmış', TO_TIMESTAMP('27-JUL-2005:27:34.140000','DD-MON-RRHH24:MI:SS.FF'), 'Fixed');
INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000018', '1006', '3008', 'Rejected', 'Yakıt Tüketimi Çok Artmış', TO_TIMESTAMP('28-MAY-2110:28:33.141000','DD-MON-RRHH24:MI:SS.FF'), 'Failed');
INSERT INTO inform (inform_id, inform_staff_id, inform_company_id, inform_status, inform_reason, inform_updated_datetime, inform_failed_outcome)
VALUES ('000019', '1003', '3006', 'Approved', 'Lastik Aşınmış', TO_TIMESTAMP('29-JAN-2111:29:31.142000','DD-MON-RRHH24:MI:SS.FF'), 'Failed');


-------------------------------------------
-- Fixes
-------------------------------------------

CREATE TABLE fixes(
    fixes_id CHAR(6) NOT NULL,
    fixes_car_id CHAR(17) NOT NULL,
    fixes_car_service_id CHAR(4) NOT NULL,
    fixes_created_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    fixes_status VARCHAR2(15) NOT NULL, 
    fixes_reason VARCHAR2(100) NOT NULL, 
    fixes_failed_outcome VARCHAR2(100),
    fixes_updated_datetime TIMESTAMP,
    CONSTRAINT fixes_id_pk PRIMARY KEY (fixes_id),
    CONSTRAINT fixes_car_id_fk FOREIGN KEY (fixes_car_id) REFERENCES car(chassis_number),
    CONSTRAINT fixes_car_service_id_fk FOREIGN KEY (fixes_car_service_id) REFERENCES car_service(car_service_id)
);

INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason)
VALUES ('000000', '1HGBH41JXMN109186', '0000', 'Approved', 'Şasi Kirik');
INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason) 
VALUES ('000001', '5KLSH41TYRW321946', '0001', 'Not Approved', 'Motor problemi');
INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason) 
VALUES ('000002', '8CKRS67SLMN765987', '0002', 'Approved', 'Fren arızası');
INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason) 
VALUES ('000003', '2PTRY22KLRJ398221', '0003', 'Approved', 'Şanzıman problemi');
INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason) 
VALUES ('000004', '7YOTR32PRTY110156', '0004', 'Not Approved', 'Akü arızası');
INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason) 
VALUES ('000005', '4PCVY98SFRT131176', '0005', 'Not Approved', 'Elektrik problemi');
INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason) 
VALUES ('000006', '2PYTR98KHGR987156', '0006', 'Not Approved', 'Süspansiyon problemi');
INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason) 
VALUES ('000007', '1PRST41JXMN109186', '0007', 'Approved', 'Direksiyon problemi');
INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason) 
VALUES ('000008', '8PTQQ75JXMS312476', '0008', 'Approved', 'Radyatör problemi');
INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason) 
VALUES ('000009', '4OTYM41JHYT109290', '0009', 'Approved', 'Gaz pedalı arızası');
INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason) 
VALUES ('000010', '9TYRQ31SLMY907805', '0010', 'Approved', 'Klima arızası');
INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason) 
VALUES ('000011', '2HGBH34SFGN109186', '0011', 'Approved', 'Debriyaj problemi');
INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason) 
VALUES ('000012', '2HHTY98YPMN110196', '0012', 'Not Approved', 'Bujiler arızası');
INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason) 
VALUES ('000013', '2HHTY98YPMN110196', '0013', 'Not Approved', 'Yakıt pompası arızası');
INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason) 
VALUES ('000014', '1YTRR98MMJN131176', '0014', 'Approved', 'Yakıt deposu problemi');
INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason) 
VALUES ('000015', '4LKRY90DFRW312964', '0015', 'Not Approved', 'Egzoz arızası');
INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason) 
VALUES ('000016', '1YTRR98MMJN131176', '0016', 'Not Approved', 'Karter problemi');
INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason) 
VALUES ('000017', '4LKRY90DFRW312964', '0017', 'Approved', 'Gaz enjektörü arızası');
INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason) 
VALUES ('000018', '5TRWQ76CMNT378298', '0018', 'Approved', 'Karter gövdesi problemi');
INSERT INTO fixes (fixes_id, fixes_car_id, fixes_car_service_id, fixes_status, fixes_reason) 
VALUES ('000019', '5TRWQ76CMNT378298', '0019', 'Not Approved', 'Emme manifoldu problemi');

-------------------------------------------
-- Serves
-------------------------------------------

CREATE TABLE serves(
    serves_id CHAR(6) NOT NULL,
    serves_staff_id CHAR(4) NOT NULL,
    serves_customer_id CHAR(11) NOT NULL,
    serves_created_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    serves_status VARCHAR2(15) NOT NULL, 
    serves_reason VARCHAR2(100) NOT NULL, 
    serves_failed_outcome VARCHAR2(100),
    serves_updated_datetime TIMESTAMP,
    CONSTRAINT serves_id_pk PRIMARY KEY (serves_id),
    CONSTRAINT serves_staff_id_fk FOREIGN KEY (serves_staff_id) REFERENCES staff(staff_id),
    CONSTRAINT serves_customer_id_fk FOREIGN KEY (serves_customer_id) REFERENCES customer(identity_number)
);



INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000000', '1000', '10000000001', 'Approved', 'Araba yolda kaldı.');
INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000001', '1001', '10000000002', 'Unapproved', 'Araba hızlı gitmiyor.');
INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000002', '1002', '10000000003', 'Approved', 'Araba hararet yaptı.');
INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000003', '1003', '10000000004', 'Approved', 'Araba vites yükseltmiyor.');
INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000004', '1004', '10000000005', 'Approved', 'Araba marş basmıyor.');
INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000005', '1005', '10000000006', 'Approved', 'Araba marş basmıyor.');
INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000006', '1006', '10000000007', 'Unapproved', 'Ses sistemi çalışmıyor.');
INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000007', '1007', '10000000008', 'Unapproved', 'Bluetooth bağlanmıyor.');
INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000008', '1008', '10000000009', 'Approved', 'Akü bitti.');
INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000009', '1009', '10000000010', 'Approved', 'Lastik patladı.');
INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000010', '1010', '10000000011', 'Approved', 'Benzin bitti.');
INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000011', '1011', '10000000012', 'Approved', 'Araba yağ akıtıyor.');
INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000012', '1012', '10000000013', 'Approved', 'Araba marş basmıyor.');
INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000013', '1013', '10000000014', 'Unapproved', 'Arabayı beğenmedim.');
INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000014', '1014', '10000000015', 'Approved', 'Araba marş basmıyor.');
INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000015', '1015', '10000000016', 'Approved', 'Araba camı kırıldı.');
INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000016', '1016', '10000000017', 'Approved', 'Araba motor lambası yandı .');
INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000017', '1017', '10000000018', 'Approved', 'Direksiyon kitlendi.');
INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000018', '1018', '10000000019', 'Unapproved', 'Ön koltuklar hareket etmiyor.');
INSERT INTO serves (serves_id, serves_staff_id, serves_customer_id, serves_status, serves_reason)
VALUES ('000019', '1019', '10000000020', 'Approved', 'Egzozdan duman geliyor.');

-------------------------------------------
-- Contact
-------------------------------------------

CREATE TABLE contact(
    contact_id CHAR(6) NOT NULL,
    contact_car_service_id CHAR(4) NOT NULL,
    contact_company_id CHAR(4) NOT NULL,
    contact_created_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    contact_status VARCHAR2(15) NOT NULL, 
    contact_reason VARCHAR2(100) NOT NULL, 
    contact_failed_outcome VARCHAR2(100),
    contact_updated_datetime TIMESTAMP,
    CONSTRAINT contact_id_pk PRIMARY KEY (contact_id),
    CONSTRAINT contact_car_service_id_fk FOREIGN KEY (contact_car_service_id) REFERENCES car_service(car_service_id),
    CONSTRAINT contact_company_id_fk FOREIGN KEY (contact_company_id) REFERENCES insurance_company(company_id)
);


INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000000', '0000', '3000', 'Approved', 'Şasi Kirik');
INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000001', '0001', '3001', 'Approved', 'Fren tutmuyor');
INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000002', '0002', '3003', 'Rejected', 'Motor Yagı Azalmış');
INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000003', '0003', '3005', 'Approved', 'Lastik Aşınmış');
INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000004', '0004', '3006', 'Approved', 'Marş Motoru Ağrızalı');
INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000005', '0005', '3008', 'Rejected', 'Elektrik problemi');
INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000006', '0006', '3010', 'Approved', 'Süspansiyon problemi');
INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000007', '0007', '3012', 'Approved', 'Direksiyon problemi');
INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000008', '0008', '3014', 'Approved', 'Radyatör problemi');
INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000009', '0009', '3015', 'Approved', 'Gaz pedalı arızası');
INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000010', '0010', '3017', 'Rejected', 'Klima arızası');
INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000011', '0011', '3019', 'Approved', 'Debriyaj problemi');
INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000012', '0012', '3004', 'Rejected', 'Bujiler arızası');
INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000013', '0013', '3019', 'Approved', 'Yakıt pompası arızası');
INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000014', '0014', '3017', 'Rejected', 'Yakıt deposu problemi');
INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000015', '0015', '3015', 'Approved', 'Egzoz arızası');
INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000016', '0016', '3012', 'Rejected', 'Karter problemi');
INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000017', '0017', '3010', 'Approved', 'Gaz enjektörü arızası');
INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000018', '0018', '3008', 'Rejected', 'Karter gövdesi problemi');
INSERT INTO contact (contact_id, contact_car_service_id, contact_company_id, contact_status, contact_reason)
VALUES ('000019', '0019', '3006', 'Approved', 'Emme manifoldu problemi');

----------------------------------------
-- calculate_fees updated trigger
----------------------------------------

CREATE OR REPLACE TRIGGER calculate_fees
AFTER INSERT ON booking
FOR EACH ROW
BEGIN
  DECLARE
    cost_per_day NUMBER;
    late_fee_per_hour NUMBER;
    d_rate NUMBER(2,0);
    num_days NUMBER;
    num_hours NUMBER;
    total_fee NUMBER;
    late_fee NUMBER;
  BEGIN
    -- Calculate the number of days the car was rented
    SELECT extract(day FROM (:NEW.booking_return_datetime - :NEW.booking_from_datetime)) INTO num_days FROM dual;

    -- Get the cost per day and late fee per hour for the car model
    SELECT cm.cost_per_day, cm.late_fee_per_hour
    INTO cost_per_day, late_fee_per_hour
    FROM car_model cm
    INNER JOIN car c ON cm.model_id = c.car_model_id
    WHERE c.chassis_number = :NEW.car_id;

    -- Get the discount from customer type
    SELECT ct.customer_type_discount_rate
    INTO d_rate 
    FROM customer_type ct
    INNER JOIN customer c ON ct.customer_type_id = c.customer_type_id
    WHERE c.identity_number = :NEW.customer_id;

    -- Calculate the total fee and late fee
    total_fee := cost_per_day * num_days - (cost_per_day * num_days * (d_rate/100));
    late_fee := 0;
    IF :NEW.booking_actual_return_datetime > :NEW.booking_return_datetime THEN
      SELECT extract(hour FROM (:NEW.booking_actual_return_datetime - :NEW.booking_return_datetime)) INTO num_hours FROM dual;
      late_fee := late_fee_per_hour * num_hours;
    END IF;

    -- Insert the rental record with the calculated fees
    INSERT INTO billing(bill_booked_id, total_fee, total_late_fee) VALUES (:NEW.booking_id, total_fee, late_fee);
  END;
END;

/

-------------------------------------------
-- Booking insert 20 tuple
-------------------------------------------

INSERT INTO booking (booking_id, customer_id, car_id, booking_from_datetime, booking_return_datetime, pick_up_location_id,drop_off_location_id,booking_actual_return_datetime, booking_available) 
VALUES ('10000', '10000000007', '8CKRS67SLMN765987', TO_TIMESTAMP('25-DEC-2209:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), TO_TIMESTAMP('28-DEC-2215:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), '1012', '1006', TO_DATE('29-12-2022', 'DD-MM-YYYY'), 'T');
INSERT INTO booking (booking_id, customer_id, car_id, booking_from_datetime, booking_return_datetime, pick_up_location_id,drop_off_location_id,booking_actual_return_datetime, booking_available) 
VALUES ('10001', '10000000009', '5TRWQ76CMNT378298', TO_TIMESTAMP('13-OCT-2209:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), TO_TIMESTAMP('21-OCT-2215:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), '1015', '1008', TO_DATE('21-10-2022', 'DD-MM-YYYY'), 'T');
INSERT INTO booking (booking_id, customer_id, car_id, booking_from_datetime, booking_return_datetime, pick_up_location_id,drop_off_location_id,booking_actual_return_datetime, booking_available) 
VALUES ('10002', '10000000010', '4LKRY90DFRW312964', TO_TIMESTAMP('22-NOV-2209:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), TO_TIMESTAMP('17-DEC-2215:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), '1006', '1009', TO_DATE('17-12-2022', 'DD-MM-YYYY'), 'T');
INSERT INTO booking (booking_id, customer_id, car_id, booking_from_datetime, booking_return_datetime, pick_up_location_id,drop_off_location_id,booking_actual_return_datetime, booking_available) 
VALUES ('10003', '10000000020', '1YTRR98MMJN131176', TO_TIMESTAMP('30-MAY-2209:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), TO_TIMESTAMP('18-JUN-2215:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), '1011', '1019', TO_DATE('19-06-2022', 'DD-MM-YYYY'), 'F');
INSERT INTO booking (booking_id, customer_id, car_id, booking_from_datetime, booking_return_datetime, pick_up_location_id,drop_off_location_id,booking_actual_return_datetime, booking_available) 
VALUES ('10004', '10000000006', '4UYTR67JTYR109626', TO_TIMESTAMP('16-SEP-2209:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), TO_TIMESTAMP('17-SEP-2215:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), '1007', '1005', TO_DATE('17-09-2022', 'DD-MM-YYYY'), 'T');
INSERT INTO booking (booking_id, customer_id, car_id, booking_from_datetime, booking_return_datetime, pick_up_location_id,drop_off_location_id,booking_actual_return_datetime, booking_available) 
VALUES ('10005', '10000000001', '2HGBH34SFGN109186', TO_TIMESTAMP('05-JUL-2209:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), TO_TIMESTAMP('14-AUG-2215:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), '1019', '1000', TO_DATE('14-08-2022', 'DD-MM-YYYY'), 'T');
INSERT INTO booking (booking_id, customer_id, car_id, booking_from_datetime, booking_return_datetime, pick_up_location_id,drop_off_location_id,booking_actual_return_datetime, booking_available) 
VALUES ('10006', '10000000013', '8PTQQ75JXMS312476', TO_TIMESTAMP('08-JAN-2209:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), TO_TIMESTAMP('13-JAN-2215:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), '1010', '1012', TO_DATE('13-01-2022', 'DD-MM-YYYY'), 'T');
INSERT INTO booking (booking_id, customer_id, car_id, booking_from_datetime, booking_return_datetime, pick_up_location_id,drop_off_location_id,booking_actual_return_datetime, booking_available) 
VALUES ('10007', '10000000019', '2PTRY22KLRJ398221', TO_TIMESTAMP('23-OCT-2209:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), TO_TIMESTAMP('26-OCT-2215:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), '1004', '1018', TO_DATE('27-10-2022', 'DD-MM-YYYY'), 'T');
INSERT INTO booking (booking_id, customer_id, car_id, booking_from_datetime, booking_return_datetime, pick_up_location_id,drop_off_location_id,booking_actual_return_datetime, booking_available) 
VALUES ('10008', '10000000003', '4OTYM41JHYT109290', TO_TIMESTAMP('09-DEC-2209:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), TO_TIMESTAMP('11-DEC-2215:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), '1018', '1002', TO_DATE('11-12-2022', 'DD-MM-YYYY'), 'F');
INSERT INTO booking (booking_id, customer_id, car_id, booking_from_datetime, booking_return_datetime, pick_up_location_id,drop_off_location_id,booking_actual_return_datetime, booking_available) 
VALUES ('10009', '10000000018', '1HGBH41JXMN109186', TO_TIMESTAMP('17-JUN-2209:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), TO_TIMESTAMP('19-JUN-2215:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), '1001', '1017', TO_DATE('19-06-2022', 'DD-MM-YYYY'), 'T');
INSERT INTO booking (booking_id, customer_id, car_id, booking_from_datetime, booking_return_datetime, pick_up_location_id,drop_off_location_id,booking_actual_return_datetime, booking_available) 
VALUES ('10010', '10000000012', '4PCVY98SFRT131176', TO_TIMESTAMP('21-NOV-2209:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), TO_TIMESTAMP('19-DEC-2215:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), '1017', '1011', TO_DATE('19-12-2022', 'DD-MM-YYYY'), 'T');
INSERT INTO booking (booking_id, customer_id, car_id, booking_from_datetime, booking_return_datetime, pick_up_location_id,drop_off_location_id,booking_actual_return_datetime, booking_available) 
VALUES ('10011', '10000000014', '3TYTT89ZYTR189876', TO_TIMESTAMP('10-MAY-2209:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), TO_TIMESTAMP('14-MAY-2215:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), '1016', '1013', TO_DATE('15-05-2022', 'DD-MM-YYYY'), 'T');
INSERT INTO booking (booking_id, customer_id, car_id, booking_from_datetime, booking_return_datetime, pick_up_location_id,drop_off_location_id,booking_actual_return_datetime, booking_available) 
VALUES ('10012', '10000000002', '1HGBH41JXMN109186', TO_TIMESTAMP('18-JUL-2209:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), TO_TIMESTAMP('29-JUL-2215:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), '1002', '1001', TO_DATE('30-07-2022', 'DD-MM-YYYY'), 'T');
INSERT INTO booking (booking_id, customer_id, car_id, booking_from_datetime, booking_return_datetime, pick_up_location_id,drop_off_location_id,booking_actual_return_datetime, booking_available) 
VALUES ('10013', '10000000008', '9TYRQ31SLMY907805', TO_TIMESTAMP('12-OCT-2209:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), TO_TIMESTAMP('26-OCT-2215:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), '1013', '1007', TO_DATE('29-10-2022', 'DD-MM-YYYY'), 'F');
INSERT INTO booking (booking_id, customer_id, car_id, booking_from_datetime, booking_return_datetime, pick_up_location_id,drop_off_location_id,booking_actual_return_datetime, booking_available) 
VALUES ('10014', '10000000011', '2PYTR98KHGR987156', TO_TIMESTAMP('29-NOV-2209:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), TO_TIMESTAMP('16-DEC-2215:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), '1000', '1010', TO_DATE('16-12-2022', 'DD-MM-YYYY'), 'T');
INSERT INTO booking (booking_id, customer_id, car_id, booking_from_datetime, booking_return_datetime, pick_up_location_id,drop_off_location_id,booking_actual_return_datetime, booking_available) 
VALUES ('10015', '10000000005', '7YOTR32PRTY110156', TO_TIMESTAMP('22-APR-2209:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), TO_TIMESTAMP('30-APR-2215:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), '1009', '1004', TO_DATE('30-04-2022', 'DD-MM-YYYY'), 'T');
INSERT INTO booking (booking_id, customer_id, car_id, booking_from_datetime, booking_return_datetime, pick_up_location_id,drop_off_location_id,booking_actual_return_datetime, booking_available) 
VALUES ('10016', '10000000004', '5KLSH41TYRW321946', TO_TIMESTAMP('10-JUN-2209:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), TO_TIMESTAMP('11-JUN-2215:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), '1005', '1003', TO_DATE('12-06-2022', 'DD-MM-YYYY'), 'T');
INSERT INTO booking (booking_id, customer_id, car_id, booking_from_datetime, booking_return_datetime, pick_up_location_id,drop_off_location_id,booking_actual_return_datetime, booking_available) 
VALUES ('10017', '10000000017', '2HHTY98YPMN110196', TO_TIMESTAMP('23-DEC-2209:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), TO_TIMESTAMP('27-DEC-2215:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), '1008', '1016', TO_DATE('26-12-2022', 'DD-MM-YYYY'), 'F');
INSERT INTO booking (booking_id, customer_id, car_id, booking_from_datetime, booking_return_datetime, pick_up_location_id,drop_off_location_id,booking_actual_return_datetime, booking_available) 
VALUES ('10018', '10000000016', '9UYRT11PLKR999156', TO_TIMESTAMP('16-NOV-2209:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), TO_TIMESTAMP('20-NOV-2215:00:00.123000', 'DD-MON-RRHH24:MI:SS.FF'), '1003', '1015', TO_DATE('23-11-2022', 'DD-MM-YYYY'), 'T');

-----------------------------------------------
-- Booking update payment type 20 tuple once
-----------------------------------------------

UPDATE billing SET bill_payment_id = '0000' where bill_id = 1000;
UPDATE billing SET bill_payment_id = '0000' where bill_id = 1001;
UPDATE billing SET bill_payment_id = '0000' where bill_id = 1002;
UPDATE billing SET bill_payment_id = '0000' where bill_id = 1003;
UPDATE billing SET bill_payment_id = '0000' where bill_id = 1004;
UPDATE billing SET bill_payment_id = '0001' where bill_id = 1005;
UPDATE billing SET bill_payment_id = '0001' where bill_id = 1006;
UPDATE billing SET bill_payment_id = '0001' where bill_id = 1007;
UPDATE billing SET bill_payment_id = '0001' where bill_id = 1008;
UPDATE billing SET bill_payment_id = '0001' where bill_id = 1009;
UPDATE billing SET bill_payment_id = '0002' where bill_id = 1010;
UPDATE billing SET bill_payment_id = '0002' where bill_id = 1011;
UPDATE billing SET bill_payment_id = '0002' where bill_id = 1012;
UPDATE billing SET bill_payment_id = '0002' where bill_id = 1013;
UPDATE billing SET bill_payment_id = '0002' where bill_id = 1014;
UPDATE billing SET bill_payment_id = '0003' where bill_id = 1015;
UPDATE billing SET bill_payment_id = '0003' where bill_id = 1016;
UPDATE billing SET bill_payment_id = '0003' where bill_id = 1017;


----------------------------------------
-- Customer updated trigger
----------------------------------------

CREATE OR REPLACE TRIGGER customer_updated_trg
BEFORE INSERT OR UPDATE ON customer
FOR EACH ROW
BEGIN
  :new.customer_updated_datetime := CURRENT_TIMESTAMP;
END;

/
----------------------------------------
-- Booking updated trigger
----------------------------------------

CREATE OR REPLACE TRIGGER booking_updated_trg
BEFORE INSERT OR UPDATE ON booking
FOR EACH ROW
BEGIN
  :new.booking_updated_datetime := CURRENT_TIMESTAMP;
END;

/
----------------------------------------
-- Car Service updated trigger
----------------------------------------

CREATE OR REPLACE TRIGGER car_service_updated_trg
BEFORE INSERT OR UPDATE ON car_service
FOR EACH ROW
BEGIN
  :new.car_service_updated_datetime := CURRENT_TIMESTAMP;
END;

/
----------------------------------------
-- Contact updated trigger
----------------------------------------

CREATE OR REPLACE TRIGGER contact_updated_trg
BEFORE INSERT OR UPDATE ON contact
FOR EACH ROW
BEGIN
  :new.contact_updated_datetime := CURRENT_TIMESTAMP;
END;

/
----------------------------------------
-- fixes updated trigger
----------------------------------------

CREATE OR REPLACE TRIGGER fixes_updated_trg
BEFORE INSERT OR UPDATE ON fixes
FOR EACH ROW
BEGIN
  :new.fixes_updated_datetime := CURRENT_TIMESTAMP;
END;

/
----------------------------------------
-- inform updated trigger
----------------------------------------

CREATE OR REPLACE TRIGGER inform_updated_trg
BEFORE INSERT OR UPDATE ON inform
FOR EACH ROW
BEGIN
  :new.inform_updated_datetime := CURRENT_TIMESTAMP;
END;

/
----------------------------------------
-- insurance_company updated trigger
----------------------------------------

CREATE OR REPLACE TRIGGER insurance_company_updated_trg
BEFORE INSERT OR UPDATE ON insurance_company
FOR EACH ROW
BEGIN
  :new.company_updated_datetime := CURRENT_TIMESTAMP;
END;

/
