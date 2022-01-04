// Wybierz wszystkich pacjentów z grupą krwi ab
//Select all patients with blood type AB
Select * from blooddb.patients where patients."bloodTypeId" IN (Select id from blooddb.blood where blood.type='AB');


//Wybierz wszystkich pacjentów i dawców z grupa krwi a- i 0+
//Select all patients and donors with blood gropup A- and 0+
SELECT blooddb.donors.id ,blooddb.donors.name, blooddb.donors.surname, blooddb.donors."bloodTypeId" FROM blooddb.donors where donors."bloodTypeId" IN (Select id from blooddb.blood where blood."fullName"='A-' or  blood."fullName"='0+' )
UNION
Select blooddb.patients.id ,blooddb.patients.name , blooddb.patients.surname, blooddb.patients."bloodTypeId" from blooddb.patients where patients."bloodTypeId" IN (Select id from blooddb.blood where blood."fullName"='A-' or  blood."fullName"='0+' );

//wybierz wszystkie pacjenów zaczynajcych się na litere a 
// Select all patients that begins with 'a'
Select * from  blooddb.patients   where blooddb.patients.name like '%a';  

//Wybierz wszystkich pacjentow z bazy ze szpitala o id 2 ktorym przetransfuzjowano mniej niż X ml
//select all patients from hospital of id 2 that theri blood was transfused less than X ml

//Wybierz adresy szpitali w ktorym dokonano transfuzji w okresie dat od X do X
//Select adresses of hospitals where transfusions had been done between date X to date X  

//Wybierz wszystkie transfuzje ze wszystkich szpitali oprocz szpitala o id 3 
//Select all transfusions of all hospitals excluding hospital of id 3


//Select patient name and patient id and hospital address of patient assigned hospital in descenting order by amount of blood transfered in each (group by) hospital  
//(inner join)

//Select hospital address and patient name of patient of id 23 //(propably inner join)

//select transfusion date, patient name of all patients(propably left join)

//select transfusion date, patient name of all patients(propably left join)

//count how many patients are in hospital 

//count how many patients and donors are assigned to hospital of id 3 

//count how many patients and donors are assigned to hospital of id 3 with blood type AB+


