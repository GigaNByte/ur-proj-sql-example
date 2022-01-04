CREATE SCHEMA blooddb ;

CREATE TABLE blooddb.donors (
    id int NOT NULL UNIQUE PRIMARY KEY auto_increment,
    name character varying(25) NOT NULL,
    surname character varying(25) NOT NULL,
    bloodTypeId integer NOT NULL,
    donatedBloodMl float,
    telephoneNumber character varying(25) NOT NULL,
    hospitalId integer NOT NULL,
    address character varying(60) NOT NULL,
    isHonoraryDonor bit NOT NULL
);

CREATE TABLE blooddb.patients (
    id INT UNIQUE NOT NULL PRIMARY KEY auto_increment,
    address character varying(100) NOT NULL,
    bloodTypeId INT NOT NULL,
    hospitalId INT NOT NULL,
    name character varying(25) NOT NULL,
    postcode character varying(20) NOT NULL,
    recieviedBloodMl float,
    surname character varying(25) NOT NULL,
    telephoneNumber character varying(25) NOT NULL,
    neededBloodMl float
);

CREATE TABLE blooddb.hospitals (
    id INT UNIQUE NOT NULL PRIMARY KEY auto_increment,
    address character varying(60) NOT NULL,
    postcode character varying(20) NOT NULL,
    name character varying(25) NOT NULL,
    district character varying(25) NOT NULL
);

CREATE TABLE blooddb.blood (
    type character varying(2) NOT NULL,
    isRhesus bit NOT NULL,
    id integer UNIQUE NOT NULL PRIMARY KEY auto_increment,
    fullName character varying(4) NOT NULL
);

CREATE TABLE blooddb.transfusions (
    id integer UNIQUE NOT NULL PRIMARY KEY auto_increment,
    patientId integer NOT NULL,
    donorId integer NOT NULL,
    date date NOT NULL,
    hospitalId integer NOT NULL,
    donorBloodTypeId integer NOT NULL,
    patientBloodTypeId integer NOT NULL,
    bloodTransferedMl float NOT NULL
);

CREATE TABLE blooddb.blood_blood (
    id INT UNIQUE NOT NULL PRIMARY KEY auto_increment,
    donorBloodId integer,
    patientBloodId integer,
    isTransferable bit NOT NULL
);

ALTER TABLE blooddb.donors
ADD FOREIGN KEY (hospitalId) REFERENCES blooddb.hospitals (id);
ALTER TABLE blooddb.donors
ADD FOREIGN KEY (bloodTypeId) REFERENCES blooddb.blood (id);
ALTER TABLE blooddb.blood_blood
ADD FOREIGN KEY (donorBloodId) REFERENCES blooddb.blood(id);
ALTER TABLE blooddb.blood_blood
ADD FOREIGN KEY (patientBloodId) REFERENCES blooddb.blood(id);
ALTER TABLE blooddb.patients
ADD FOREIGN KEY (hospitalId) REFERENCES blooddb.hospitals (id);
ALTER TABLE blooddb.transfusions
ADD FOREIGN KEY (patientId) REFERENCES blooddb.patients (id);
ALTER TABLE blooddb.transfusions
ADD FOREIGN KEY (donorId) REFERENCES blooddb.donors (id);
ALTER TABLE blooddb.transfusions
ADD FOREIGN KEY (hospitalId) REFERENCES blooddb.hospitals (id);

INSERT INTO blooddb.blood(type,isRhesus,fullName) VALUES ('AB',true,'AB+');
INSERT INTO blooddb.blood(type,isRhesus,fullName) VALUES ('AB',false,'AB+');
INSERT INTO blooddb.blood(type,isRhesus,fullName) VALUES ('A',true,'A+');
INSERT INTO blooddb.blood(type,isRhesus,fullName) VALUES ('A',false,'A-');
INSERT INTO blooddb.blood(type,isRhesus,fullName) VALUES ('B',true,'B+');
INSERT INTO blooddb.blood(type,isRhesus,fullName) VALUES ('B',false,'B-');
INSERT INTO blooddb.blood(type,isRhesus,fullName) VALUES ('0',true,'0+');
INSERT INTO blooddb.blood(type,isRhesus,fullName) VALUES ('0',false,'0-');

INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (1,2,true);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (1,1,true);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (1,3,true);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (1,4,true);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (1,5,true);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (1,6,true);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (1,7,true);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (1,8,true);

INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (2,1,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (2,2,true);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (2,3,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (2,4,true);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (2,5,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (2,6,true);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (2,7,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (2,8,true);

INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (3,1,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (3,2,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (3,3,true);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (3,4,true);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (3,5,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (3,6,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (3,7,true);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (3,8,true);

INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (4,1,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (4,2,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (4,3,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (4,4,true);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (4,5,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (4,6,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (4,7,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (4,8,true);

INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (5,1,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (5,2,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (5,3,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (5,4,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (5,5,true);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (5,6,true);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (5,7,true);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (5,8,true);

INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (6,1,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (6,2,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (6,3,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (6,4,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (6,5,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (6,6,true);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (6,7,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (6,8,true);

INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (7,1,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (7,2,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (7,3,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (7,4,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (7,5,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (7,6,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (7,7,true);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (7,8,true);

INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (8,1,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (8,2,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (8,3,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (8,4,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (8,5,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (8,6,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (8,7,false);
INSERT INTO blooddb.blood_blood(patientBloodId,donorBloodId,isTransferable) VALUES (8,8,true);

INSERT INTO blooddb.hospitals(address,postcode,district,name) VALUES ('4960 Macpherson Circle','33-115','West','St. Mary Hospital');
INSERT INTO blooddb.hospitals(address,postcode,district,name) VALUES ('2 Fairview Drive','33-115','West','Main West Hospital');
INSERT INTO blooddb.hospitals(address,postcode,district,name) VALUES ('93 Ryan Plaza','33-115','East','Giga Hospital');
INSERT INTO blooddb.hospitals(address,postcode,district,name) VALUES ('73567 Grim Junction','503-1305','East','St. John Hospital');

INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Margalo','Vaskin','658 Forest Center','+7 (830) 277-4012',450,8,3,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Kordula','McAlindon','0531 Chinook Center','+1 (941) 846-8640',1995,7,3,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Goldina','Tesimon','9772 Menomonie Plaza','+54 (103) 401-2327',39,7,1,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Lindon','Mathys','86 Dawn Pass','+33 (200) 228-3321',1998,7,2,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Eric','Ickovits','6746 Loftsgordon Court','+1 (414) 422-0805',791,7,1,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Urbanus','Gidney','80 Marquette Junction','+86 (148) 208-4087',1412,1,1,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Darla','Gors','45 Lotheville Plaza','+86 (841) 691-2186',2611,6,3,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Lauritz','Dinnage','19209 Anthes Point','+60 (445) 479-4532',2206,3,1,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Harriot','Sitford','82 Farmco Pass','+30 (684) 716-3053',522,4,3,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Adrienne','Becket','7 Caliangt Terrace','+86 (818) 745-7308',3669,2,3,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Nora','Worcester','28 Morningstar Center','+86 (773) 733-0386',3494,1,2,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Anthe','Ponde','58686 Fairfield Center','+86 (803) 782-1104',1500,3,2,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Kipp','Ruffler','196 Birchwood Park','+57 (643) 637-5896',1059,3,3,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Alix','Davidman','7 Lakewood Park','+387 (653) 462-2787',393,4,1,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Constanta','Cote','4 Macpherson Park','+46 (326) 724-8810',2726,8,2,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Glennie','Reame','681 Lien Plaza','+63 (708) 593-0755',401,3,1,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Trumann','Gresch','2 High Crossing Terrace','+54 (732) 206-5880',2791,6,1,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Ariadne','Vynarde','9419 Hanover Alley','+7 (750) 714-3175',2605,7,3,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Lydon','Grelka','857 Thompson Lane','+55 (542) 812-3187',1176,3,1,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Tova','Carrett','293 Rieder Lane','+62 (155) 335-5110',1938,7,2,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Elinor','Mowle','6 Granby Crossing','+229 (284) 290-8278',1794,2,1,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Lynett','MacFie','8 Fairfield Alley','+351 (792) 583-7966',3026,2,1,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Mimi','Starkings','9240 Debs Place','+228 (387) 112-9666',1916,6,1,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Clemente','Fitzsimon','7699 Amoth Way','+31 (563) 698-2269',3213,4,1,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Phineas','Chasteney','20768 Red Cloud Lane','+86 (265) 992-5638',378,7,1,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Chrissie','Willimot','87333 Harper Drive','+20 (222) 601-6621',3575,7,1,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Joline','Bessell','4 Alpine Crossing','+62 (358) 497-4304',1628,2,3,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Regina','Treleven','76026 Vahlen Street','+62 (169) 840-4865',449,1,1,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Sherwynd','Berthel','357 Roxbury Avenue','+1 (490) 332-3808',1211,5,1,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Dinny','Southwell','3 Porter Drive','+86 (491) 100-6384',3807,5,3,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Shaylynn','Beecker','69856 Kropf Point','+380 (160) 790-4280',3905,6,3,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Dasya','Cressor','6 Bultman Point','+62 (884) 920-1755',874,3,1,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Stewart','Rablan','8 Bartelt Trail','+63 (201) 589-7620',2346,3,2,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Tab','Bourrel','17 Goodland Plaza','+86 (410) 739-7665',1197,2,2,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Faustine','Quene','4 Westport Crossing','+86 (725) 308-7622',2042,5,3,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Fancy','Slaight','2511 Brown Court','+33 (663) 770-7900',1391,2,1,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Cathrine','Narraway','68 New Castle Road','+86 (149) 370-0877',3699,8,2,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Aurelia','Kellaway','88 Graedel Way','+234 (472) 996-0806',2383,1,3,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Harwilll','Asser','397 Sauthoff Street','+62 (762) 808-1240',2521,1,1,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Maxi','Benech','8216 Hallows Park','+94 (911) 665-7048',2588,2,1,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Margery','Covert','4781 Delladonna Alley','+996 (789) 442-0049',2308,8,3,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Filippo','Hucke','144 Sugar Avenue','+86 (620) 736-5967',3898,1,2,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Merridie','Millthorpe','81 Marquette Lane','+81 (199) 155-9688',1344,8,2,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Joane','Hanvey','8 Redwing Lane','+57 (100) 123-8208',2664,4,2,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Alan','O''Regan','83425 Russell Lane','+385 (370) 556-0228',1595,3,2,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Bernhard','Adolthine','4653 Talmadge Road','+62 (645) 711-8897',1050,7,1,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Gan','Goullee','58020 Summit Park','+86 (765) 102-4783',597,2,2,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Clemmie','Astling','60822 Glacier Hill Circle','+55 (514) 298-8824',783,3,1,true);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Red','Kittiman','916 Mifflin Parkway','+63 (489) 818-0371',1611,4,2,false);
INSERT INTO blooddb.donors(name,surname,address,telephoneNumber,donatedBloodMl,bloodTypeId,hospitalId,isHonoraryDonor) VALUES ('Dare','Blincko','10 Lindbergh Court','+420 (672) 708-7626',1412,3,1,false);



INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Maren','Benford','76152','406-732-1702',635,4,4,'959 Grasskamp Way');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Beverley','Dudgeon','76152','297-933-2937',725,3,3,'15 Hooker Trail');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Veronika','Bosanko','76152','845-547-1203',3340,3,1,'65690 Orin Plaza');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Antonino','Murrum','6344','778-518-1019',3268,4,1,'9 Green Ridge Way');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Lynelle','Fitchet','6344','503-444-4863',3657,8,1,'38789 Linden Junction');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Katha','Tierney','06-413','903-222-7909',1834,3,1,'9805 Homewood Hill');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Cathlene','Mathon','4700-837','530-252-2150',1748,1,4,'0789 Annamark Plaza');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Cristobal','Yoseloff','4700-838','917-701-0053',2736,5,1,'268 Norway Maple Circle');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Julienne','Pascoe','4700-839','128-518-0762',2341,5,3,'718 Shopko Terrace');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Mina','Snead','4700-840','865-412-3372',2303,8,1,'181 Anhalt Court');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Joete','Wenzel','4700-841','381-748-6768',504,5,3,'1 Grim Pass');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Jake','Ginnell','1400','652-762-4311',886,1,3,'30 Gale Drive');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Grantley','Petrosian','05-080','692-875-7804',2331,4,1,'57734 Morningstar Hill');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Traver','MacMichael','10240','933-952-2492',264,7,3,'425 Jackson Avenue');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Cherin','Clapton','10240','721-298-2268',461,5,4,'2641 Lindbergh Parkway');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Gigi','Kaes','10240','735-404-4304',477,7,4,'49 Clove Place');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Janifer','Twelftree','462409','485-820-2482',3967,2,4,'517 Westridge Drive');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Patty','Glowinski','462409','290-971-1290',1608,1,4,'47 Twin Pines Road');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Jammie','Gadie','462409','705-579-0811',432,1,1,'1 Calypso Center');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Lindy','MacMeekan','2000-357','579-487-5890',1667,3,2,'5221 Norway Maple Hill');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Pavlov','Duester','561 64','648-124-6452',396,2,3,'28 Fairfield Lane');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Keane','Le Count','562 64','304-305-3439',1924,3,2,'89277 Transport Pass');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Nari','Grimwad','563 64','754-545-0094',2998,5,1,'7 Kinsman Plaza');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Minetta','Rickell','564 64','839-829-0959',2243,1,4,'05 Cardinal Point');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Shauna','Minihan','565 64','998-750-8602',3810,5,4,'857 Pawling Pass');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Frankie','Blowen','566 64','384-397-6831',2654,6,3,'6 Delaware Alley');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Billi','Butting','567 64','915-661-3200',3473,3,2,'55 Buell Lane');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Mattie','Snepp','568 64','576-790-4180',1558,8,2,'3 8th Park');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Miles','Valintine','186000','543-603-3714',197,6,1,'0156 Crowley Park');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Jenna','Ellse','186000','850-435-2210',3040,5,4,'88704 Bowman Pass');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Moselle','Thornton','581 81','115-502-2469',359,8,4,'6622 Northview Lane');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Winfred','Font','582 81','366-246-9310',882,2,1,'8642 Commercial Court');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Juana','Antusch','583 81','347-145-9671',1047,8,1,'1 Burning Wood Alley');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Hans','Annice','584 81','915-343-7960',467,8,4,'8 Gateway Lane');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Danila','Pacheco','585 81','262-542-6266',2273,5,4,'6 Katie Way');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Crosby','Brayford','586 81','989-224-9824',399,1,3,'2645 Melody Park');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Melly','Grandham','587 81','561-223-6284',2538,5,3,'471 Onsgard Terrace');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Oswell','England','588 81','712-186-6799',849,1,1,'97 Esker Street');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Orbadiah','Axford','37-127','680-615-4966',1633,1,3,'11 Manley Crossing');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Hestia','Mor','37-128','412-126-5216',1861,6,3,'805 Thierer Street');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Othella','Munnery','9800','347-303-9047',515,4,2,'57757 Spenser Trail');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Prissie','Haacker','431373','626-190-5545',3593,2,1,'8665 Talmadge Avenue');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Jenn','Harmes','20210','202-806-6672',3507,8,1,'999 Monterey Terrace');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Karola','Zini','20210','543-727-2776',1018,7,2,'87215 Garrison Crossing');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Dreddy','Curley','20210','923-107-7819',1560,4,4,'96 Hauk Park');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Amalea','Corssen','18004','331-381-6609',2537,8,4,'09319 Norway Maple Court');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Dorie','Craister','18004','874-568-6303',855,7,4,'797 Helena Trail');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Beau','Cookney','70120','816-285-6579',1320,8,1,'3422 Lakeland Parkway');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Ardeen','Pengelly','9505','953-993-3870',3974,5,2,'0 Shoshone Crossing');
INSERT INTO blooddb.patients(name,surname,postcode,telephoneNumber,recieviedBloodMl,bloodTypeId,hospitalId,address) VALUES ('Mariette','Carlon','9505','577-194-8119',3457,2,1,'26228 Schurz Pass');






