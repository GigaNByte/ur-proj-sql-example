create or replace view patients_view as
    select p.id,p.name,p.surname,p.address,p.postcode,p.telephone_number,p.needed_blood_ml ,sum(t.blood_transfered_ml) as blood_transfered_ml, h.name as hospital_name, b.full_name 
	from patients as p 
    inner join hospitals as h on h.id = p.hospital_id
    inner join transfusions as t on t.patient_id = p.id 
    inner join blood as b on b.id = p.blood_type_id
    group by p.id,h.name ,b.full_name,p.name,p.surname,p.address,p.postcode,p.telephone_number,p.needed_blood_ml;

create or replace view donors_view as
select d.id,d.name,d.surname,d.address,d.telephone_number ,sum(t.blood_transfered_ml) as blood_transfered_ml, h.name as hospital_name, b.full_name 
	from donors as d 
    inner join hospitals as h on h.id = d.hospital_id
    inner join transfusions as t on t.donor_id = d.id 
    inner join blood as b on b.id = d.blood_type_id
    group by d.id,h.name ,b.full_name,d.name,d.surname,d.address,d.telephone_number;


create or replace view hospitals_view as
select h.id, h.name, h.address,h.postcode, h.district ,sum(t.blood_transfered_ml) as blood_transfered_ml, count(distinct p.id) as patients_count, count(distinct d.id) as donors_count 
	from hospitals as h 
    inner join transfusions as t on t.hospital_id = h.id 
    inner join patients as p on p.hospital_id = h.id
    inner join donors as d on d.hospital_id = h.id
    group by h.id,h.name, h.address,h.postcode, h.district;



create or replace view transfusions_view as
select t.id, CONCAT  (p.name, ' ', p.surname) AS "patient_fullname" , bp.full_name as "patient_blood_type_name", CONCAT  (d.name, ' ', d.surname) AS "donor_fullname",bp.full_name as "donor_blood_type_name" ,t.blood_transfered_ml,t.date
	from transfusions as t 
    inner join hospitals as h on t.hospital_id = h.id 
    inner join patients as p on t.patient_id = p.id
    inner join donors as d on t.donor_id = d.id
    inner join blood as bp on bp.id = p.blood_type_id
    inner join blood as bd on bd.id = d.blood_type_id
    group by t.id,p.name, p.surname,bp.full_name,d.name, d.surname,bp.full_name,t.blood_transfered_ml,t.date;

