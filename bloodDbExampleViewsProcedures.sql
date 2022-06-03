/*
Select all patients and donors with blood gropup A- and 0+
*/
create view patientsWithAB as
Select patients.* from patients where patients.bloodTypeId IN (Select id from blood where blood.type='AB');

/*
Select all patients and donors with blood gropup A- and 0+
*/
create view patientsAndDonorsWithANegAndOPos as
SELECT donors.id ,donors.name, donors.surname, donors.bloodTypeId FROM donors
where donors.bloodTypeId IN (Select id from blood where blood.fullName='A-' or  blood.fullName='0+' )
UNION
Select patients.id ,patients.name , patients.surname, patients.bloodTypeId from patients
where patients.bloodTypeId IN (Select id from blood where blood.fullName='A-' or  blood.fullName='0+' );

/*
Select all patients that begins with 'a'
*/
create view patientsFemale as
Select * from  patients   where patients.name like '%a';


/*
select all patients from hospital of id 2 that their blood was transfused less than X ml
*/

create view patientsLessThan1500RecieviedBloodFromHospital2 as
Select patients.* from patients
inner join hospitals on patients.hospitalId = hospitals.id
where  hospitals.id = 2 and patients.recieviedBloodMl <= 1500

/*
Select adresses of hospitals where transfusions had been done between date X to date X
*/
create view transfusionsBetween20210808And20210809 as
Select transfusions.*,hospitals.address from hospitals
inner join transfusions on transfusions.HospitalId = hospitals.id
where transfusions.date between "2021-08-08" and "2021-08-09"

/*
Select all transfusions of all hospitals excluding hospital of id 3
*/
create view transfusionsFromHospital3 as
select transfusions.* from transfusions
inner join hospitals on transfusions.hospitalId = hospitals.id
where hospitals.id != 3;

/*
Select patient name and patient id and hospital address, hospital id of patients assigned hospital in descending order by amount of blood transfered in each (group by) hospital
(inner join)
*/
create view hospitalsAndPatientsOrderedbyBloodRanking as
select patients.id,patients.name,patients.surname,hospitals.address from patients
inner join hospitals on hospitals.id = patients.hospitalId
order by (Select count(transfusions.bloodTransferedMl) from transfusions
inner join hospitals on hospitals.id = transfusions.hospitalId ) desc


/*
Select hospital address, patient name associated with patient of id 23
 */
create view patient23 as
select hospitals.address, patients.name from patients inner join hospitals on patients.hospitalId = hospitals.id where   patients.id = 23

/*
select transfusion date, patient name of all patients even if patients didnt had a transfusion (left join)
 */
create view patientsTransfusionsLeftJoinDemo as
select transfusions.date, patients.name,patients.surname from patients
left join transfusions on transfusions.patientId = patients.id

/*
select transfusion date, patient name of all patients that had a transfusion
 */
create view patientsTransfusionsInnerJoinDemo as
select transfusions.date, patients.name,patients.surname from patients
inner join transfusions on transfusions.patientId = patients.id

/*
select transfusion date, patient name of all patients that didnt had a transfusion
 */
create view patientsTransfusionsNullJoinDemo as
select transfusions.date, patients.name,patients.surname from patients
left join transfusions on transfusions.patientId = patients.id where transfusions.patientId= null

/*
count how many patients are in every hospital
 */
create view hospitalsStats as
Select hospitals.*,count(*) as "sum of patients" from patients inner join hospitals on hospitals.id = patients.hospitalId group by hospitals.id

/*
count how many patients and donors are assigned to hospital of id 3
inner join will also work
 */
create view countPatientsAndDonorsOfHospital3 as
Select  count( distinct donors.id ) + count( distinct patients.id ) as "sum of patients and donors" from hospitals
left join patients on  patients.hospitalId = hospitals.id
left join donors on  donors.hospitalId = hospitals.id
where hospitals.id = 3

/*
count how many patients and donors are assigned to hospital of id 3 with blood type AB+
 */
create view countPatientsAndDonorsOfHospital3ABPositive as
Select   count( distinct donors.id ) + count( distinct patients.id ) as "sum of patients and donors" from hospitals
left join patients on  patients.hospitalId = hospitals.id
left join donors on  donors.hospitalId = hospitals.id
where  donors.bloodTypeId = (Select id from blood where blood.fullName='AB+')  and patients.bloodTypeId = (Select id from blood where blood.fullName='AB+')

/*
(Utility Query)
*/
create view patientsTransferedBloodSummary as
Select patients.id ,transfusions.bloodTransferedMl from patients
inner join transfusions on patients.id = transfusions.patientId
group by patients.id


/*Create procedure to move transfusions records older than one month to historical table*/
CREATE  PROCEDURE `MoveToOldtransfusions`()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    CREATE TABLE IF NOT EXISTS oldTransfusions (
       id eger UNIQUE NOT NULL PRIMARY KEY serial,
       patientid eger NOT NULL,
       donorid eger NOT NULL,
       date date NOT NULL,
       hospitalid eger NOT NULL,
       bloodTransferedMl float NOT NULL
    );
    START TRANSACTION;
    insert into oldTransfusions
    Select transfusions.*  from transfusions
    where transfusions.date < DATE("2022-01-15" - INTERVAL 1 MONTH);
    delete from transfusions where transfusions.date < DATE("2022-01-15" - INTERVAL 1 MONTH);
    COMMIT;
END