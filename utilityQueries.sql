delete transfusions from transfusions
inner join patients on patients.id = transfusions.patientId
inner join donors on donors.id = transfusions.donorId
inner join blood_blood on donors.bloodTypeId = blood_blood.donorBloodId
and patients.bloodTypeId = blood_blood.patientBloodId
where blood_blood.isTransferable = false

select patients.id ,count(transfusions.bloodTransferedMl)  from patients
inner join transfusions on patients.id = transfusions.patientId
group by patients.id

create view "patientsTransferedBloodSummary" as
Select patients.id ,transfusions.bloodTransferedMl from patients
inner join transfusions on patients.id = transfusions.patientId
group by patients.id

create view "donorsTransferedBloodSummary" as
Select donors.id ,transfusions.bloodTransferedMl from donors
inner join transfusions on donors.id = transfusions.donorId
group by donors.id

UPDATE patients
INNER JOIN patientsTransferedBloodSummary ON patients.id = patientsTransferedBloodSummary.id
SET patients.recieviedBloodMl =  patientsTransferedBloodSummary.bloodTransferedMl

UPDATE donors
INNER JOIN donorsTransferedBloodSummary ON donors.id = donorsTransferedBloodSummary.id
SET donors.donatedBloodMl =  donorsTransferedBloodSummary.bloodTransferedMl

UPDATE donors
set donors.isHonoraryDonor = false
where donors.donatedBloodMl < 3000

UPDATE donors
set donors.isHonoraryDonor = true
where donors.donatedBloodMl >= 3000