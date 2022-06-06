CREATE OR REPLACE PROCEDURE blooddb_schema()
language plpgsql    
as $$
begin

	CREATE TABLE IF NOT EXISTS donors (
		id SERIAL PRIMARY KEY ,
		name character varying(25) NOT NULL,
		surname character varying(25) NOT NULL,
		blood_type_id integer NOT NULL ,
		telephone_number character varying(25) NOT NULL,
		hospital_id integer NOT NULL,
		address character varying(100) NOT NULL
	);

	CREATE TABLE IF NOT EXISTS patients (
		id SERIAL PRIMARY KEY ,
		name character varying(25) NOT NULL,
		address character varying(100) NOT NULL,
		blood_type_id INT NOT NULL,
		hospital_id INT NOT NULL,
		postcode character varying(20) NOT NULL,
		surname character varying(25) NOT NULL,
		telephone_number character varying(25) NOT NULL,
		needed_blood_ml float NOT NULL DEFAULT 0.0
	);

	CREATE TABLE IF NOT EXISTS hospitals (
		id SERIAL PRIMARY KEY ,
		name character varying(25) NOT NULL,
		address character varying(100) NOT NULL,
		postcode character varying(20) NOT NULL,
		district character varying(25) NOT NULL
	);

	CREATE TABLE IF NOT EXISTS blood (
		id SERIAL PRIMARY KEY ,
		type character varying(2) NOT NULL,
		is_rhesus boolean NOT NULL,
		full_name character varying(4) NOT NULL
	);

	CREATE TABLE IF NOT EXISTS transfusions (
		id SERIAL PRIMARY KEY ,
		patient_id integer NOT NULL,
		donor_id integer NOT NULL,
		date date NOT NULL,
		hospital_id integer NOT NULL,
		blood_transfered_ml float NOT NULL DEFAULT 0.0
	);

	CREATE TABLE IF NOT EXISTS blood_blood (
		id SERIAL PRIMARY KEY ,
		donor_blood_id integer,
		patient_blood_id integer,
		is_transferable boolean NOT NULL
	);

	ALTER TABLE donors
	ADD FOREIGN KEY (hospital_id) REFERENCES hospitals (id) ON DELETE CASCADE;
	ALTER TABLE donors
	ADD FOREIGN KEY (blood_type_id) REFERENCES blood (id)  ON DELETE CASCADE;
	ALTER TABLE blood_blood
	ADD FOREIGN KEY (donor_blood_id) REFERENCES blood(id) ON DELETE CASCADE;
	ALTER TABLE blood_blood
	ADD FOREIGN KEY (patient_blood_id) REFERENCES blood(id)  ON DELETE CASCADE;
	ALTER TABLE patients
	ADD FOREIGN KEY (hospital_id) REFERENCES hospitals (id)  ON DELETE CASCADE;
	ALTER TABLE patients
	ADD FOREIGN KEY (blood_type_id) REFERENCES blood (id)  ON DELETE CASCADE;
	ALTER TABLE transfusions
	ADD FOREIGN KEY (patient_id) REFERENCES patients (id)  ON DELETE CASCADE;
	ALTER TABLE transfusions
	ADD FOREIGN KEY (donor_id) REFERENCES donors (id)  ON DELETE CASCADE;
	ALTER TABLE transfusions
	ADD FOREIGN KEY (hospital_id) REFERENCES hospitals (id) ON DELETE CASCADE;


	INSERT INTO blood (type, is_rhesus, id, full_name) VALUES ('AB',true,1,'AB+');
	INSERT INTO blood (type, is_rhesus, id, full_name) VALUES ('AB',false,2,'AB-');
	INSERT INTO blood (type, is_rhesus, id, full_name) VALUES ('A',true,3,'A+');
	INSERT INTO blood (type, is_rhesus, id, full_name) VALUES ('A',false,4,'A-');
	INSERT INTO blood (type, is_rhesus, id, full_name) VALUES ('B',true,5,'B+');
	INSERT INTO blood (type, is_rhesus, id, full_name) VALUES ('B',false,6,'B-');
	INSERT INTO blood (type, is_rhesus, id, full_name) VALUES ('0',true,7,'0+');
	INSERT INTO blood (type, is_rhesus, id, full_name) VALUES ('0',false,8,'0-');


	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (1,2,1,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (2,1,1,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (3,3,1,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (4,4,1,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (5,5,1,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (6,6,1,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (7,7,1,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (8,8,1,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (9,1,2,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (10,2,2,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (11,3,2,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (12,4,2,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (13,5,2,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (14,6,2,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (15,7,2,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (16,8,2,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (17,1,3,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (18,2,3,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (19,3,3,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (20,4,3,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (21,5,3,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (22,6,3,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (23,7,3,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (24,8,3,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (25,1,4,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (26,2,4,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (27,3,4,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (28,4,4,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (29,5,4,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (30,6,4,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (31,7,4,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (32,8,4,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (33,1,5,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (34,2,5,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (35,3,5,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (36,4,5,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (37,5,5,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (38,6,5,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (39,7,5,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (40,8,5,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (41,1,6,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (42,2,6,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (43,3,6,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (44,4,6,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (45,5,6,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (46,6,6,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (47,7,6,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (48,8,6,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (49,1,7,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (50,2,7,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (51,3,7,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (52,4,7,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (53,5,7,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (54,6,7,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (55,7,7,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (56,8,7,true);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (57,1,8,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (58,2,8,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (59,3,8,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (60,4,8,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (61,5,8,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (62,6,8,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (63,7,8,false);
	INSERT INTO blood_blood (id, donor_blood_id, patient_blood_id, is_transferable) VALUES (64,8,8,true);

	INSERT INTO hospitals (id, address, postcode, name, district) VALUES (1,'4960 Macpherson Circle','33-115','St. Mary Hospital','West');
	INSERT INTO hospitals (id, address, postcode, name, district) VALUES (2,'2 Fairview Drive','33-115','Main West Hospital','West');
	INSERT INTO hospitals (id, address, postcode, name, district) VALUES (3,'93 Ryan Plaza','33-115','Giga Hospital','East');
	INSERT INTO hospitals (id, address, postcode, name, district) VALUES (4,'73567 Grim Junction','503-1305','St. John Hospital','East');

	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (1,'Margalo','Vaskin',8,'+7 (830) 277-4012',3,'658 Forest Center');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (2,'Kordula','McAlindon',7,'+1 (941) 846-8640',3,'0531 Chinook Center');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (3,'Goldina','Tesimon',7,'+54 (103) 401-2327',1,'9772 Menomonie Plaza');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (4,'Lindon','Mathys',7,'+33 (200) 228-3321',2,'86 Dawn Pass');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (5,'Eric','Ickovits',7,'+1 (414) 422-0805',1,'6746 Loftsgordon Court');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (6,'Urbanus','Gidney',1,'+86 (148) 208-4087',1,'80 Marquette Junction');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (7,'Darla','Gors',6,'+86 (841) 691-2186',3,'45 Lotheville Plaza');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (8,'Lauritz','Dinnage',3,'+60 (445) 479-4532',1,'19209 Anthes Point');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (9,'Harriot','Sitford',4,'+30 (684) 716-3053',3,'82 Farmco Pass');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (10,'Adrienne','Becket',2,'+86 (818) 745-7308',3,'7 Caliangt Terrace');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (11,'Nora','Worcester',1,'+86 (773) 733-0386',2,'28 Morningstar Center');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (12,'Anthe','Ponde',3,'+86 (803) 782-1104',2,'58686 Fairfield Center');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (13,'Kipp','Ruffler',3,'+57 (643) 637-5896',3,'196 Birchwood Park');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (14,'Alix','Davidman',4,'+387 (653) 462-2787',1,'7 Lakewood Park');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (15,'Constanta','Cote',8,'+46 (326) 724-8810',2,'4 Macpherson Park');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (16,'Glennie','Reame',3,'+63 (708) 593-0755',1,'681 Lien Plaza');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (17,'Trumann','Gresch',6,'+54 (732) 206-5880',1,'2 High Crossing Terrace');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (18,'Ariadne','Vynarde',7,'+7 (750) 714-3175',3,'9419 Hanover Alley');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (19,'Lydon','Grelka',3,'+55 (542) 812-3187',1,'857 Thompson Lane');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (20,'Tova','Carrett',7,'+62 (155) 335-5110',2,'293 Rieder Lane');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (21,'Elinor','Mowle',2,'+229 (284) 290-8278',1,'6 Granby Crossing');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (22,'Lynett','MacFie',2,'+351 (792) 583-7966',1,'8 Fairfield Alley');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (23,'Mimi','Starkings',6,'+228 (387) 112-9666',1,'9240 Debs Place');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (24,'Clemente','Fitzsimon',4,'+31 (563) 698-2269',1,'7699 Amoth Way');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (25,'Phineas','Chasteney',7,'+86 (265) 992-5638',1,'20768 Red Cloud Lane');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (26,'Chrissie','Willimot',7,'+20 (222) 601-6621',1,'87333 Harper Drive');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (27,'Joline','Bessell',2,'+62 (358) 497-4304',3,'4 Alpine Crossing');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (28,'Regina','Treleven',1,'+62 (169) 840-4865',1,'76026 Vahlen Street');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (29,'Sherwynd','Berthel',5,'+1 (490) 332-3808',1,'357 Roxbury Avenue');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (30,'Dinny','Southwell',5,'+86 (491) 100-6384',3,'3 Porter Drive');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (31,'Shaylynn','Beecker',6,'+380 (160) 790-4280',3,'69856 Kropf Point');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (32,'Dasya','Cressor',3,'+62 (884) 920-1755',1,'6 Bultman Point');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (33,'Stewart','Rablan',3,'+63 (201) 589-7620',2,'8 Bartelt Trail');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (34,'Tab','Bourrel',2,'+86 (410) 739-7665',2,'17 Goodland Plaza');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (35,'Faustine','Quene',5,'+86 (725) 308-7622',3,'4 Westport Crossing');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (36,'Fancy','Slaight',2,'+33 (663) 770-7900',1,'2511 Brown Court');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (37,'Cathrine','Narraway',8,'+86 (149) 370-0877',2,'68 New Castle Road');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (38,'Aurelia','Kellaway',1,'+234 (472) 996-0806',3,'88 Graedel Way');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (39,'Harwilll','Asser',1,'+62 (762) 808-1240',1,'397 Sauthoff Street');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (40,'Maxi','Benech',2,'+94 (911) 665-7048',1,'8216 Hallows Park');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (41,'Margery','Covert',8,'+996 (789) 442-0049',3,'4781 Delladonna Alley');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (42,'Filippo','Hucke',1,'+86 (620) 736-5967',2,'144 Sugar Avenue');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (43,'Merridie','Millthorpe',8,'+81 (199) 155-9688',2,'81 Marquette Lane');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (44,'Joane','Hanvey',4,'+57 (100) 123-8208',2,'8 Redwing Lane');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (45,'Alan','Regan',3,'+385 (370) 556-0228',2,'83425 Russell Lane');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (46,'Bernhard','Adolthine',7,'+62 (645) 711-8897',1,'4653 Talmadge Road');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (47,'Gan','Goullee',2,'+86 (765) 102-4783',2,'58020 Summit Park');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (48,'Clemmie','Astling',3,'+55 (514) 298-8824',1,'60822 Glacier Hill Circle');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (49,'Red','Kittiman',4,'+63 (489) 818-0371',2,'916 Mifflin Parkway');
	INSERT INTO donors (id, name, surname, blood_type_id, telephone_number, hospital_id, address) VALUES (50,'Dare','Blincko',3,'+420 (672) 708-7626',1,'10 Lindbergh Court');

	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (1,'959 Grasskamp Way',4,4,'Maren','76152','Benford','406-732-1702',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (2,'15 Hooker Trail',3,3,'Beverley','76152','Dudgeon','297-933-2937',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (3,'65690 Orin Plaza',3,1,'Veronika','76152','Bosanko','845-547-1203',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (4,'9 Green Ridge Way',4,1,'Antonino','6344','Murrum','778-518-1019',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (5,'38789 Linden Junction',8,1,'Lynelle','6344','Fitchet','503-444-4863',342);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (6,'9805 Homewood Hill',3,1,'Katha','06-413','Tierney','903-222-7909',1450);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (7,'0789 Annamark Plaza',1,4,'Cathlene','4700-837','Mathon','530-252-2150',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (8,'268 Norway Maple Circle',5,1,'Cristobal','4700-838','Yoseloff','917-701-0053',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (9,'718 Shopko Terrace',5,3,'Julienne','4700-839','Pascoe','128-518-0762',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (10,'181 Anhalt Court',8,1,'Mina','4700-840','Snead','865-412-3372',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (11,'1 Grim Pass',5,3,'Joete','4700-841','Wenzel','381-748-6768',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (12,'30 Gale Drive',1,3,'Jake','1400','Ginnell','652-762-4311',445);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (13,'57734 Morningstar Hill',4,1,'Grantley','05-080','Petrosian','692-875-7804',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (14,'425 Jackson Avenue',7,3,'Traver','10240','MacMichael','933-952-2492',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (15,'2641 Lindbergh Parkway',5,4,'Cherin','10240','Clapton','721-298-2268',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (16,'49 Clove Place',7,4,'Gigi','10240','Kaes','735-404-4304',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (17,'517 Westridge Drive',2,4,'Janifer','462409','Twelftree','485-820-2482',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (18,'47 Twin Pines Road',1,4,'Patty','462409','Glowinski','290-971-1290',3004);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (19,'1 Calypso Center',1,1,'Jammie','462409','Gadie','705-579-0811',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (20,'5221 Norway Maple Hill',3,2,'Lindy','2000-357','MacMeekan','579-487-5890',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (21,'28 Fairfield Lane',2,3,'Pavlov','561 64','Duester','648-124-6452',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (22,'89277 Transport Pass',3,2,'Keane','562 64','Le Count','304-305-3439',324);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (23,'7 Kinsman Plaza',5,1,'Nari','563 64','Grimwad','754-545-0094',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (24,'05 Cardinal Point',1,4,'Minetta','564 64','Rickell','839-829-0959',456);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (25,'857 Pawling Pass',5,4,'Shauna','565 64','Minihan','998-750-8602',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (26,'6 Delaware Alley',6,3,'Frankie','566 64','Blowen','384-397-6831',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (27,'55 Buell Lane',3,2,'Billi','567 64','Butting','915-661-3200',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (28,'3 8th Park',8,2,'Mattie','568 64','Snepp','576-790-4180',324);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (29,'0156 Crowley Park',6,1,'Miles','186000','Valintine','543-603-3714',546);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (30,'88704 Bowman Pass',5,4,'Jenna','186000','Ellse','850-435-2210',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (31,'6622 Northview Lane',8,4,'Moselle','581 81','Thornton','115-502-2469',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (32,'8642 Commercial Court',2,1,'Winfred','582 81','Font','366-246-9310',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (33,'1 Burning Wood Alley',8,1,'Juana','583 81','Antusch','347-145-9671',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (34,'8 Gateway Lane',8,4,'Hans','584 81','Annice','915-343-7960',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (35,'6 Katie Way',5,4,'Danila','585 81','Pacheco','262-542-6266',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (36,'2645 Melody Park',1,3,'Crosby','586 81','Brayford','989-224-9824',435);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (37,'471 Onsgard Terrace',5,3,'Melly','587 81','Grandham','561-223-6284',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (38,'97 Esker Street',1,1,'Oswell','588 81','England','712-186-6799',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (39,'11 Manley Crossing',1,3,'Orbadiah','37-127','Axford','680-615-4966',1654);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (40,'805 Thierer Street',6,3,'Hestia','37-128','Mor','412-126-5216',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (41,'57757 Spenser Trail',4,2,'Othella','9800','Munnery','347-303-9047',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (42,'8665 Talmadge Avenue',2,1,'Prissie','431373','Haacker','626-190-5545',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (43,'999 Monterey Terrace',8,1,'Jenn','20210','Harmes','202-806-6672',1234);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (44,'87215 Garrison Crossing',7,2,'Karola','20210','Zini','543-727-2776',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (45,'96 Hauk Park',4,4,'Dreddy','20210','Curley','923-107-7819',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (46,'09319 Norway Maple Court',8,4,'Amalea','18004','Corssen','331-381-6609',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (47,'797 Helena Trail',7,4,'Dorie','18004','Craister','874-568-6303',0);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (48,'3422 Lakeland Parkway',8,1,'Beau','70120','Cookney','816-285-6579',3455);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (49,'0 Shoshone Crossing',5,2,'Ardeen','9505','Pengelly','953-993-3870',333);
	INSERT INTO patients (id, address, blood_type_id, hospital_id, name, postcode, surname, telephone_number, needed_blood_ml) VALUES (50,'26228 Schurz Pass',2,1,'Mariette','9505','Carlon','577-194-8119',896);

	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (2,30,26,'2021-08-02',3,424);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (4,2,19,'2021-10-13',4,1076);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (6,35,1,'2021-08-28',1,58);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (8,4,24,'2021-09-22',2,580);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (9,27,15,'2021-07-28',3,1066);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (13,50,43,'2021-09-21',2,751);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (18,35,41,'2021-07-18',2,3794);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (22,14,18,'2021-12-21',3,2022);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (23,50,40,'2021-07-26',1,3680);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (25,16,46,'2021-11-04',1,3137);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (32,17,9,'2022-01-05',2,1596);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (34,24,26,'2021-07-30',2,2027);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (36,6,43,'2021-08-08',3,85);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (40,32,24,'2021-07-18',1,1460);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (41,16,4,'2021-12-31',3,946);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (44,6,41,'2021-08-11',1,1140);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (45,29,17,'2021-10-09',4,1473);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (46,21,15,'2021-07-20',4,1108);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (49,30,3,'2021-07-27',3,3413);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (50,39,47,'2022-01-05',3,2140);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (51,6,18,'2021-12-02',2,3853);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (55,47,43,'2021-07-13',3,217);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (57,25,25,'2021-10-28',4,1941);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (59,40,15,'2021-12-08',1,3262);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (60,36,38,'2021-07-26',4,3792);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (64,40,31,'2021-09-29',3,2832);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (68,49,37,'2021-12-07',3,1488);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (69,18,19,'2021-12-10',4,982);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (71,47,41,'2021-12-02',3,3534);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (72,19,7,'2021-08-05',2,2028);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (73,12,48,'2022-01-15',4,158);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (79,24,33,'2021-11-04',2,780);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (83,24,4,'2021-10-12',1,2755);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (85,24,32,'2021-07-22',3,3824);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (87,12,13,'2021-11-18',3,1281);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (88,39,24,'2021-08-12',2,495);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (90,39,35,'2021-10-14',1,842);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (92,37,5,'2021-10-03',1,95);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (95,7,9,'2021-10-20',2,1152);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (97,19,35,'2021-07-15',4,1454);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (102,12,5,'2021-10-26',4,2419);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (104,19,17,'2021-07-17',3,2602);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (109,5,43,'2021-10-27',1,942);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (111,13,37,'2021-11-20',1,531);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (112,42,22,'2021-12-12',1,717);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (114,41,24,'2021-12-22',1,1249);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (115,42,7,'2022-01-15',3,3800);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (116,11,31,'2021-09-30',3,156);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (118,3,1,'2022-01-13',2,612);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (121,39,48,'2021-07-19',2,3436);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (122,38,34,'2021-11-25',3,2703);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (124,45,43,'2021-12-26',1,1102);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (125,36,25,'2021-11-08',3,492);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (129,33,15,'2021-08-16',1,2139);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (131,36,20,'2021-07-22',1,2790);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (132,26,37,'2021-11-06',1,3641);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (134,30,37,'2021-10-06',3,1894);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (136,19,18,'2021-11-09',4,1288);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (138,3,12,'2021-12-16',2,160);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (139,18,44,'2021-12-27',2,1932);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (142,31,37,'2021-07-21',3,1492);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (143,23,23,'2021-12-17',3,418);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (148,25,18,'2022-01-03',1,2487);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (150,36,4,'2021-12-12',1,989);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (152,45,9,'2021-07-04',3,2873);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (155,7,48,'2021-07-06',4,1164);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (156,50,10,'2021-12-23',2,3400);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (157,49,26,'2021-11-06',2,2685);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (160,8,26,'2021-12-01',3,3006);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (161,22,50,'2021-11-06',4,1482);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (162,45,37,'2021-10-23',4,2065);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (164,38,45,'2021-09-08',2,211);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (165,24,30,'2021-12-30',2,3060);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (166,37,41,'2022-01-05',3,3009);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (168,18,9,'2021-11-18',1,2080);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (177,36,4,'2021-07-14',3,2191);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (181,36,30,'2021-11-14',1,3579);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (185,48,1,'2021-09-30',2,2075);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (189,15,35,'2021-07-04',4,2301);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (191,22,43,'2021-08-07',4,2545);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (192,19,36,'2021-09-06',4,3300);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (195,15,2,'2021-10-07',4,2353);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (196,25,35,'2021-12-30',4,3136);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (198,38,27,'2021-08-30',2,262);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (205,3,25,'2021-10-11',2,3061);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (211,18,30,'2021-10-06',1,501);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (212,49,15,'2021-08-16',1,190);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (213,35,4,'2021-12-23',2,1944);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (214,44,5,'2021-08-15',2,785);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (216,5,43,'2022-01-08',3,3067);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (221,39,23,'2021-12-16',1,2564);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (222,37,43,'2021-10-15',4,471);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (229,21,49,'2021-10-14',1,2709);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (231,39,40,'2021-08-07',2,3136);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (234,18,2,'2021-10-08',4,2953);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (236,3,41,'2021-11-17',3,3671);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (238,12,22,'2022-01-02',2,2515);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (239,7,44,'2021-10-15',1,1126);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (240,41,37,'2022-01-05',4,515);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (245,14,2,'2021-07-09',1,1941);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (253,11,7,'2021-12-15',3,530);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (255,17,23,'2021-11-02',1,661);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (256,42,10,'2021-09-16',3,2660);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (257,36,44,'2021-08-12',3,2913);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (259,9,46,'2021-08-30',2,1014);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (260,19,29,'2021-12-19',3,2593);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (263,10,41,'2021-09-15',4,218);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (264,36,30,'2021-11-05',3,681);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (270,49,41,'2021-07-22',2,3103);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (271,6,45,'2021-12-31',2,1056);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (277,2,41,'2021-09-26',1,2923);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (278,19,20,'2021-08-31',4,2163);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (282,2,32,'2021-12-02',2,2331);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (287,18,1,'2021-10-12',4,2865);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (288,20,33,'2021-11-23',3,3261);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (291,7,9,'2021-11-23',4,1440);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (293,7,14,'2021-09-14',3,3937);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (295,50,34,'2021-11-04',3,3927);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (296,6,43,'2021-07-17',2,2569);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (298,12,20,'2022-01-07',1,3100);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (299,38,2,'2022-01-14',3,1252);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (304,1,15,'2021-11-23',3,3979);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (306,38,26,'2021-11-10',3,2918);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (309,18,6,'2022-01-08',2,2071);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (310,39,9,'2022-01-11',3,1053);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (311,16,3,'2021-11-19',2,2835);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (321,23,31,'2021-11-01',3,142);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (322,18,16,'2021-08-27',3,2247);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (323,39,7,'2021-08-10',2,1602);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (325,44,1,'2021-09-22',2,3250);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (326,25,15,'2022-01-12',1,1833);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (329,36,46,'2021-07-06',2,3144);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (330,35,43,'2021-08-29',4,1538);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (331,6,3,'2021-07-29',1,3886);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (333,12,40,'2021-12-23',3,2244);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (334,3,4,'2021-08-26',3,2049);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (337,11,4,'2021-07-28',4,3660);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (338,7,22,'2021-09-02',4,2266);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (339,13,49,'2021-10-16',2,300);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (341,21,21,'2021-07-09',3,3414);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (342,38,6,'2021-10-01',3,2096);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (352,30,18,'2022-01-08',3,2204);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (355,18,37,'2021-11-08',3,2225);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (356,35,43,'2021-07-28',3,926);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (357,25,20,'2021-09-11',1,2183);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (359,36,26,'2021-12-11',3,1352);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (364,41,37,'2021-07-16',1,486);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (367,10,1,'2022-01-11',4,2939);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (371,47,3,'2021-12-15',3,2137);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (373,38,41,'2022-01-15',3,3620);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (377,7,34,'2021-12-02',1,1213);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (378,36,44,'2021-09-23',2,2307);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (379,18,8,'2021-09-08',3,1344);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (384,21,31,'2021-11-03',2,1364);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (385,6,16,'2021-11-28',4,841);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (386,7,49,'2021-11-07',2,1947);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (388,7,28,'2021-12-12',1,886);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (389,14,18,'2021-10-16',3,2842);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (390,18,42,'2021-11-05',2,543);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (391,49,1,'2021-10-01',4,1783);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (392,44,20,'2021-07-05',4,70);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (393,38,33,'2021-10-16',3,2773);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (396,38,16,'2021-07-09',2,3034);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (406,24,8,'2021-07-05',1,3178);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (407,32,47,'2021-11-21',4,2772);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (408,47,1,'2021-11-29',3,176);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (409,6,16,'2021-09-23',4,2010);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (410,49,1,'2021-11-01',4,2812);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (412,8,1,'2021-11-10',4,3208);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (413,46,37,'2021-08-19',1,2668);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (414,42,1,'2022-01-02',1,1267);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (415,9,5,'2021-09-09',4,659);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (417,24,18,'2021-07-18',1,2265);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (418,19,3,'2021-10-04',3,2937);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (420,22,14,'2021-09-25',4,187);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (421,42,9,'2022-01-07',3,2681);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (423,16,26,'2021-11-05',1,1274);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (425,20,19,'2021-09-15',2,3515);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (426,39,18,'2021-09-25',1,3016);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (427,36,12,'2021-07-27',3,2147);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (428,30,23,'2021-07-24',4,1393);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (432,6,12,'2021-11-15',2,535);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (440,3,25,'2021-12-20',4,1851);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (446,7,34,'2021-10-09',4,2047);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (448,19,39,'2022-01-07',1,771);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (449,50,41,'2021-10-26',1,2467);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (453,8,15,'2021-08-03',4,2081);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (454,8,30,'2021-08-07',2,2701);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (457,23,15,'2021-09-24',1,2680);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (458,21,17,'2021-09-25',3,2924);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (459,6,32,'2021-10-02',2,1101);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (460,7,36,'2021-12-24',3,741);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (461,50,21,'2021-07-27',3,1632);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (466,5,37,'2021-11-27',1,1982);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (467,35,18,'2021-07-11',1,3765);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (471,12,29,'2021-12-31',1,1979);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (473,49,2,'2022-01-05',4,3476);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (474,50,34,'2021-11-10',4,303);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (478,38,34,'2021-10-23',2,2275);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (480,17,44,'2021-09-10',3,3919);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (481,30,43,'2021-12-26',2,940);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (482,11,5,'2021-08-19',4,1631);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (484,20,2,'2021-08-18',3,3796);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (489,8,30,'2021-12-18',2,1390);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (491,22,46,'2021-10-30',1,2132);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (492,6,49,'2021-09-21',4,2712);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (493,7,39,'2021-12-17',3,1421);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (494,50,1,'2021-10-31',4,305);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (495,27,9,'2021-12-06',2,1936);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (497,29,41,'2021-09-02',2,125);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (504,43,1,'2021-07-15',1,2978);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (505,42,17,'2021-07-08',2,3117);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (511,28,43,'2021-10-29',1,879);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (513,7,2,'2021-09-22',1,2619);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (514,15,29,'2021-10-25',4,444);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (516,6,19,'2021-10-10',4,3784);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (517,19,37,'2021-07-18',3,3985);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (519,24,38,'2021-07-27',2,1920);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (522,12,10,'2021-11-24',1,3706);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (523,32,22,'2022-01-15',3,3135);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (524,2,4,'2021-07-01',3,519);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (525,39,25,'2021-07-18',1,1073);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (526,5,41,'2021-08-04',1,1677);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (529,3,37,'2021-12-21',3,2794);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (533,41,24,'2021-09-02',1,1289);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (535,39,10,'2022-01-11',3,830);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (537,24,31,'2021-10-04',2,3429);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (540,26,1,'2021-09-23',4,2983);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (541,22,12,'2021-07-13',4,775);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (542,26,31,'2021-07-08',3,2467);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (544,15,46,'2021-12-21',3,828);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (547,39,12,'2021-12-09',3,142);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (548,11,20,'2021-07-12',4,1850);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (550,25,37,'2021-12-28',2,761);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (553,11,29,'2021-07-10',4,1645);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (554,5,1,'2021-12-10',4,2025);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (558,3,44,'2021-11-20',2,1187);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (563,39,49,'2021-10-30',2,3516);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (564,6,12,'2021-11-02',4,2097);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (567,22,41,'2022-01-01',4,3387);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (569,38,43,'2021-09-02',3,1644);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (570,39,3,'2021-09-10',4,1113);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (573,31,41,'2021-09-18',3,1057);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (574,1,1,'2021-12-29',3,1519);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (575,24,48,'2022-01-02',4,221);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (577,12,14,'2021-07-04',1,1757);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (578,19,18,'2021-09-09',2,733);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (581,22,20,'2021-12-18',4,2144);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (582,11,15,'2021-08-28',2,791);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (586,19,19,'2021-11-22',2,2329);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (587,32,36,'2021-09-15',4,1021);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (588,7,3,'2022-01-14',1,764);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (590,20,19,'2021-09-07',3,3338);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (592,42,27,'2021-07-03',2,1018);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (594,36,40,'2021-12-24',2,976);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (595,24,36,'2021-11-20',4,3664);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (596,41,43,'2021-11-12',4,712);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (597,39,27,'2021-10-23',4,3408);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (598,11,3,'2021-12-25',3,889);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (599,24,36,'2021-10-02',1,3403);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (601,39,7,'2021-11-16',1,1108);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (604,7,43,'2021-07-24',1,450);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (605,50,44,'2021-12-31',2,1634);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (608,27,13,'2021-07-20',1,3731);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (609,7,33,'2021-10-31',2,727);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (613,21,22,'2021-12-21',4,3267);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (614,7,42,'2021-10-18',4,587);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (616,18,10,'2021-09-20',3,3480);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (617,6,12,'2021-12-19',2,2722);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (620,12,2,'2021-10-07',3,3568);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (622,27,12,'2021-08-02',3,831);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (632,5,37,'2021-07-21',3,164);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (633,6,12,'2021-11-08',4,1606);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (634,22,25,'2021-09-04',2,370);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (637,19,13,'2022-01-11',2,287);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (638,7,14,'2022-01-10',1,3461);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (640,36,27,'2022-01-06',1,3515);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (645,23,30,'2021-07-25',1,3934);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (647,35,7,'2021-10-02',3,2140);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (648,39,14,'2021-12-14',3,3127);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (652,47,3,'2021-10-27',4,1255);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (654,47,37,'2021-08-28',3,2501);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (656,31,15,'2021-10-25',3,3979);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (657,14,46,'2021-11-30',4,1158);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (658,39,17,'2021-09-24',3,3154);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (659,23,41,'2021-07-31',1,714);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (661,2,15,'2022-01-15',4,1849);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (662,21,17,'2021-08-31',4,246);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (663,24,3,'2021-10-19',1,2610);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (666,24,47,'2021-07-17',1,2698);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (674,6,15,'2021-12-10',3,453);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (675,11,23,'2021-09-16',2,670);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (677,6,1,'2021-07-25',4,101);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (685,37,5,'2022-01-09',2,3173);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (688,50,10,'2021-10-29',3,2615);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (689,27,46,'2021-10-21',4,3435);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (690,48,41,'2021-11-14',3,350);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (691,45,49,'2021-10-04',3,3044);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (695,3,18,'2021-09-13',4,3906);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (696,18,2,'2021-08-25',3,2105);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (698,27,45,'2021-11-07',4,2118);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (701,12,49,'2021-08-28',2,3205);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (703,25,3,'2021-10-24',3,68);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (704,50,9,'2021-11-28',4,2502);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (705,7,3,'2021-12-21',2,620);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (707,49,7,'2021-08-05',1,1363);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (708,19,15,'2021-08-22',4,889);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (711,38,15,'2021-09-11',2,2613);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (712,19,22,'2021-09-28',4,618);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (714,33,41,'2021-07-13',1,579);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (715,7,12,'2022-01-11',1,1247);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (716,31,43,'2021-11-29',1,1506);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (717,7,42,'2021-07-11',1,1349);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (721,13,9,'2022-01-09',3,1089);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (724,3,16,'2021-11-09',1,2881);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (725,2,14,'2022-01-09',1,793);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (728,19,2,'2021-07-18',3,2157);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (729,19,46,'2022-01-12',3,3548);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (731,3,25,'2021-07-25',1,1134);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (733,49,37,'2021-09-20',4,1078);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (735,25,15,'2021-12-22',1,3867);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (736,42,47,'2022-01-15',1,530);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (739,18,7,'2021-11-21',4,1278);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (741,27,5,'2021-09-10',4,3085);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (755,2,26,'2022-01-01',1,2609);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (756,36,39,'2021-10-26',4,3474);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (758,46,41,'2021-09-24',3,2918);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (760,43,1,'2021-09-28',4,1268);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (763,49,26,'2021-08-31',3,3600);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (765,36,19,'2021-11-08',1,2466);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (769,38,32,'2021-07-17',4,78);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (771,42,10,'2021-10-17',4,3850);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (772,22,12,'2021-08-14',1,1585);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (776,18,34,'2021-08-29',2,549);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (777,18,1,'2021-11-18',1,488);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (778,19,28,'2021-12-18',1,1003);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (779,20,33,'2021-09-26',4,2455);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (780,19,38,'2021-07-19',2,3927);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (781,5,15,'2021-07-25',4,1502);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (785,50,41,'2021-07-05',4,232);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (788,49,1,'2021-08-08',4,659);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (789,24,12,'2022-01-08',4,2308);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (793,42,9,'2021-10-15',3,2444);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (794,12,6,'2021-11-06',3,3702);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (797,23,4,'2021-07-08',4,2511);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (798,19,36,'2021-08-02',1,461);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (799,45,37,'2021-11-09',2,3596);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (803,12,19,'2021-09-21',4,1402);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (804,9,7,'2021-12-06',2,3052);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (813,6,9,'2021-12-16',3,1166);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (814,3,46,'2021-10-20',3,137);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (816,44,4,'2021-08-25',2,1166);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (817,41,43,'2021-09-24',2,2831);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (819,11,17,'2021-07-13',3,1593);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (822,23,17,'2021-08-16',1,1928);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (825,19,20,'2021-09-16',2,526);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (829,21,21,'2022-01-04',4,178);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (832,19,1,'2021-11-07',3,2022);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (833,46,37,'2021-09-19',3,3067);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (835,12,8,'2021-07-15',1,1447);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (836,22,16,'2021-11-30',4,2814);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (842,16,46,'2022-01-11',3,2208);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (843,49,4,'2021-11-27',4,119);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (844,12,40,'2021-08-15',4,1370);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (849,49,37,'2021-08-01',3,3935);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (850,18,40,'2021-09-05',4,384);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (851,24,15,'2021-07-13',3,944);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (852,8,2,'2021-11-10',3,868);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (854,38,27,'2021-07-22',4,2164);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (856,21,14,'2021-07-21',3,1852);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (857,14,1,'2021-11-19',3,3783);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (858,16,3,'2021-07-25',1,3785);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (859,18,48,'2021-09-08',3,771);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (862,27,25,'2021-11-30',3,2042);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (863,12,25,'2021-09-02',4,3777);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (865,27,44,'2021-07-23',4,999);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (867,22,8,'2021-12-28',4,2973);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (869,4,49,'2021-10-20',3,3580);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (870,18,41,'2021-10-17',4,2892);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (871,27,45,'2021-10-17',4,637);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (872,3,14,'2022-01-10',3,370);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (876,14,43,'2021-07-09',4,356);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (878,38,13,'2021-09-05',2,3955);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (881,44,41,'2021-09-02',4,1631);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (883,39,8,'2021-10-23',4,300);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (884,9,43,'2021-08-08',2,2209);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (890,19,38,'2021-07-30',4,644);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (894,6,20,'2021-10-11',2,3708);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (895,2,5,'2021-09-12',2,1763);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (900,22,50,'2021-12-31',1,1989);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (901,7,4,'2021-12-18',3,486);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (903,7,34,'2022-01-08',4,2367);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (905,12,20,'2021-10-30',2,1158);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (906,42,9,'2021-08-25',3,1508);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (907,7,11,'2021-11-30',4,1224);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (908,41,15,'2021-12-20',3,2009);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (909,49,46,'2021-12-27',1,1495);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (910,18,16,'2021-08-03',2,2323);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (916,27,48,'2021-10-21',2,2620);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (917,48,15,'2021-07-05',1,1346);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (918,7,12,'2021-07-12',2,2311);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (921,30,18,'2021-10-20',3,1072);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (922,12,9,'2021-12-28',1,565);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (924,36,3,'2021-11-28',3,2548);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (925,12,41,'2021-10-22',4,3918);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (929,6,18,'2021-11-25',1,2774);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (930,46,15,'2021-11-17',2,1484);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (931,17,15,'2021-07-19',1,265);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (932,13,37,'2021-12-25',3,3643);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (933,31,37,'2021-07-02',4,716);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (935,23,43,'2021-09-01',4,3205);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (937,50,40,'2021-07-03',4,2516);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (938,39,5,'2021-11-03',3,3005);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (943,42,1,'2021-08-01',3,3139);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (947,7,5,'2022-01-10',3,882);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (953,25,4,'2022-01-04',4,1925);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (957,42,36,'2021-10-23',4,1114);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (962,7,30,'2022-01-14',4,220);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (963,17,9,'2022-01-03',4,3307);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (967,38,47,'2021-08-23',3,495);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (968,24,14,'2021-09-25',1,3593);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (970,29,17,'2021-07-09',3,1041);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (971,36,48,'2021-11-29',2,2388);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (972,39,21,'2021-08-02',4,1062);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (973,40,15,'2021-09-14',2,3479);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (975,20,44,'2021-10-08',4,2585);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (978,27,9,'2021-08-18',1,3614);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (982,41,14,'2021-07-14',3,1196);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (983,19,1,'2021-08-18',4,3377);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (985,12,7,'2021-10-08',1,2019);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (988,19,22,'2021-09-01',3,155);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (989,18,11,'2022-01-02',3,985);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (990,20,24,'2021-08-19',4,3074);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (992,17,9,'2021-10-26',3,336);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (996,20,16,'2021-09-20',3,622);
	INSERT INTO transfusions (id, patient_id, donor_id, date, hospital_id, blood_transfered_ml) VALUES (998,23,29,'2021-08-28',4,3746);
 
    
    create  MATERIALIZED view patients_view as
    select p.id,p.name,p.surname,p.address,p.postcode,p.telephone_number,
	p.needed_blood_ml ,sum(t.blood_transfered_ml) as blood_transfered_ml, 
	h.name as hospital_name, b.full_name ,h.id as hospital_id,b.id as blood_id
	from patients as p 
    inner join hospitals as h on h.id = p.hospital_id
    left join transfusions as t on t.patient_id = p.id --Count the transfusions for each patient even if they are have zero blod_transfered_ml 
    inner join blood as b on b.id = p.blood_type_id 
    group by p.id,h.name ,b.full_name,p.name,p.surname,p.address,p.postcode,p.telephone_number,p.needed_blood_ml,h.id,b.id;

    create MATERIALIZED view donors_view as
    select d.id,d.name,d.surname,d.address,d.telephone_number ,
	sum(t.blood_transfered_ml) as blood_transfered_ml, h.name as hospital_name,
	 b.full_name ,h.id as hospital_id,b.id as blood_id
	from donors as d 
    inner join hospitals as h on h.id = d.hospital_id
    left join transfusions as t on t.donor_id = d.id --Count the transfusions for each patient even if they are have zero blod_transfered_ml 
    inner join blood as b on b.id = d.blood_type_id
    group by d.id,h.name ,b.full_name,d.name,d.surname,d.address,d.telephone_number,h.id,b.id; --every group by possible due to the sum function (agregate function)

    create  MATERIALIZED view hospitals_view as
    select h.id , h.name, h.address,h.postcode, h.district ,sum(t.blood_transfered_ml) as blood_transfered_ml, 
	count(distinct p.id) as patients_count, count(distinct d.id) as donors_count
	from hospitals as h 
    left join transfusions as t on t.hospital_id = h.id 
    left join patients as p on p.hospital_id = h.id
    left join donors as d on d.hospital_id = h.id
    group by h.id,h.name, h.address,h.postcode, h.district; 
	--every group by possible due to the sum function (agregate function)

    create  MATERIALIZED view transfusions_view as
    select t.id, CONCAT  (p.name, ' ', p.surname) AS "patient_fullname" , 
	bp.full_name as "patient_blood_type_name", CONCAT  (d.name, ' ', d.surname) AS "donor_fullname",
	bp.full_name as "donor_blood_type_name" ,t.blood_transfered_ml,t.date,p.id as patient_id,d.id as donor_id,h.id as hospital_id
	from transfusions as t 
    inner join hospitals as h on t.hospital_id = h.id 
    inner join patients as p on t.patient_id = p.id
    inner join donors as d on t.donor_id = d.id
    inner join blood as bp on bp.id = p.blood_type_id
    inner join blood as bd on bd.id = d.blood_type_id
    group by t.id,p.name, p.surname,bp.full_name,d.name, d.surname,bp.full_name,t.blood_transfered_ml,t.date,p.id,d.id,h.id;


    create  MATERIALIZED view blood_view as
    select b.id, b.full_name, b.type, b.is_rhesus
    from blood as b;

    create  MATERIALIZED view blood_blood_view as
    select bb.id, bb.donor_blood_id, bb.patient_blood_id, bb.is_transferable
    from blood_blood as bb;




    PERFORM setval('blood_id_seq', (SELECT MAX(id) from "blood"));
    PERFORM setval('blood_blood_id_seq', (SELECT MAX(id) from "blood_blood"));
    PERFORM setval('patients_id_seq', (SELECT MAX(id) from "patients"));
    PERFORM setval('donors_id_seq', (SELECT MAX(id) from "donors"));
    PERFORM setval('hospitals_id_seq', (SELECT MAX(id) from "hospitals"));
    PERFORM setval('transfusions_id_seq', (SELECT MAX(id) from "transfusions"));

    CREATE UNIQUE INDEX ON patients_view (id); 
    CREATE UNIQUE INDEX ON transfusions_view (id); 
    CREATE UNIQUE INDEX ON hospitals_view (id); 
    CREATE UNIQUE INDEX ON donors_view (id); 
    CREATE UNIQUE INDEX ON blood_view (id); 
    CREATE UNIQUE INDEX ON blood_blood_view (id); 
    
END;$$;
CALL blooddb_schema();

CREATE  FUNCTION tg_refresh_patients_view()
    RETURNS trigger LANGUAGE plpgsql 
    AS $$
    BEGIN
        REFRESH MATERIALIZED VIEW CONCURRENTLY patients_view;
        REFRESH MATERIALIZED VIEW CONCURRENTLY transfusions_view;
        REFRESH MATERIALIZED VIEW CONCURRENTLY hospitals_view;
        REFRESH MATERIALIZED VIEW CONCURRENTLY donors_view;

        RETURN NULL;
    END;$$;
        
    CREATE  FUNCTION tg_refresh_donors_view()
    RETURNS trigger LANGUAGE plpgsql AS $$
    BEGIN
        REFRESH MATERIALIZED VIEW CONCURRENTLY donors_view;
        REFRESH MATERIALIZED VIEW CONCURRENTLY transfusions_view;
        REFRESH MATERIALIZED VIEW CONCURRENTLY hospitals_view;
        REFRESH MATERIALIZED VIEW CONCURRENTLY patients_view;
        RETURN NULL;
    END;$$;
    
    CREATE FUNCTION tg_refresh_hospitals_view()
    RETURNS trigger LANGUAGE plpgsql AS $$
    BEGIN
        REFRESH MATERIALIZED VIEW CONCURRENTLY hospitals_view;
        REFRESH MATERIALIZED VIEW CONCURRENTLY transfusions_view;
        REFRESH MATERIALIZED VIEW CONCURRENTLY donors_view;
        REFRESH MATERIALIZED VIEW CONCURRENTLY patients_view;
        RETURN NULL;
    END;$$;
    
    CREATE FUNCTION tg_refresh_transfusions_view()
    RETURNS trigger LANGUAGE plpgsql AS $$
    BEGIN
        REFRESH MATERIALIZED VIEW CONCURRENTLY transfusions_view;
        REFRESH MATERIALIZED VIEW CONCURRENTLY donors_view;
        REFRESH MATERIALIZED VIEW CONCURRENTLY patients_view;
        REFRESH MATERIALIZED VIEW CONCURRENTLY hospitals_view;
        RETURN NULL;
    END;$$;

    CREATE TRIGGER tg_refresh_patients_view AFTER INSERT OR UPDATE OR DELETE
    ON patients
    FOR EACH STATEMENT EXECUTE FUNCTION tg_refresh_patients_view();

    CREATE TRIGGER tg_refresh_hospitals_view AFTER INSERT OR UPDATE OR DELETE
    ON hospitals
    FOR EACH STATEMENT EXECUTE FUNCTION tg_refresh_hospitals_view();

    CREATE TRIGGER tg_refresh_transfusions_view AFTER INSERT OR UPDATE OR DELETE
    ON transfusions
    FOR EACH STATEMENT EXECUTE FUNCTION tg_refresh_transfusions_view();
    
    CREATE TRIGGER tg_refresh_donors_view AFTER INSERT OR UPDATE OR DELETE
    ON donors
    FOR EACH STATEMENT EXECUTE FUNCTION tg_refresh_donors_view();
