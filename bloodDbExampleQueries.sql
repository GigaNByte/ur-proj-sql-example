/*
Wybierz wszystkich pacjentów z grupą krwi ab
Select all patients with blood type AB
*/
Select patients.* from patients where patients.bloodTypeId IN (Select id from blood where blood.type='AB');


/*
Wybierz wszystkich pacjentów i dawców z grupa krwi a- i 0+
Select all patients and donors with blood gropup A- and 0+
*/

SELECT donors.id ,donors.name, donors.surname, donors.bloodTypeId FROM donors where donors.bloodTypeId IN (Select id from blood where blood.fullName='A-' or  blood.fullName='0+' )
UNION
Select patients.id ,patients.name , patients.surname, patients.bloodTypeId from patients where patients.bloodTypeId IN (Select id from blood where blood.fullName='A-' or  blood.fullName='0+' );

/*
wybierz wszystkie pacjenów zaczynajcych się na litere a
Select all patients that begins with 'a'
*/

Select patients.* from  patients   where patients.name like '%a';

/*
Wybierz wszystkich pacjentow z bazy ze szpitala o id 2 korzy otrzymali  mniej niż X ml
select all patients from hospital of id 2 that their blood was transfused less than X ml
*/

Select patients.* from patients
inner join hospitals on patients.hospitalId = hospitals.id
where  hospitals.id = 2 and patients.recieviedBloodMl <= 1500

/*
Wybierz dane transfuzji i  adresy szpitali w ktorym dokonano transfuzji w okresie dat od X do X
Select adresses of hospitals where transfusions had been done between date X to date X
*/
Select transfusions.*,hospitals.address from hospitals
inner join transfusions on transfusions.HospitalId = hospitals.id
where transfusions.date between "2021-08-08" and "2021-08-09"

/*
Wybierz wszystkie transfuzje ze wszystkich szpitali oprocz szpitala o id 3
Select all transfusions of all hospitals excluding hospital of id 3
*/
select * from transfusions
inner join hospitals on transfusions.hospitalId = hospitals.id
where hospitals.id != 3;

/*
Select patient name and patient id and hospital address, hospital id of patients assigned hospital in descending order by amount of blood transfered in each (group by) hospital
(inner join)
*/
select patients.id,patients.name,patients.surname,hospitals.address from patients
inner join hospitals on hospitals.id = patients.hospitalId
order by (Select count(transfusions.bloodTransferedMl) from transfusions
    inner join hospitals on hospitals.id = transfusions.hospitalId ) desc


/*
Select hospital address, patient name associated with patient of id 23
 */
select hospitals.address, patients.name from patients inner join hospitals on patients.hospitalId = hospitals.id where   patients.id = 23

/*
select transfusion date, patient name of all patients even if patients didnt had a transfusion (left join)
 */
select transfusions.date, patients.name,patients.surname from patients
left join transfusions on transfusions.patientId = patients.id

/*
select transfusion date, patient name of all patients that had a transfusion
 */
select transfusions.date, patients.name,patients.surname from patients
inner join transfusions on transfusions.patientId = patients.id

/*
select transfusion date, patient name of all patients that didnt had a transfusion
 */
select transfusions.date, patients.name,patients.surname from patients
left join transfusions on transfusions.patientId = patients.id where transfusions.patientId= null

/*
count how many patients are in every hospital
 */
Select hospitals.*,count(*) as "sum of patients" from patients inner join hospitals on hospitals.id = patients.hospitalId group by hospitals.id

/*
count how many patients and donors are assigned to hospital of id 3
inner join will also work
 */
Select   count( distinct donors.id ) + count( distinct patients.id ) as "sum of patients and donors" from hospitals
left join patients on  patients.hospitalId = hospitals.id
left join donors on  donors.hospitalId = hospitals.id
where hospitals.id = 3

/*
count how many patients and donors are assigned to hospital of id 3 with blood type AB+
 */
Select   count( distinct donors.id ) + count( distinct patients.id ) as "sum of patients and donors" from hospitals
left join patients on  patients.hospitalId = hospitals.id
left join donors on  donors.hospitalId = hospitals.id
where  donors.bloodTypeId = (Select id from blood where blood.fullName='AB+')  and patients.bloodTypeId = (Select id from blood where blood.fullName='AB+')


