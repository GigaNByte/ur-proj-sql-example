// Wybierz wszystkich pacjentów z grupą krwi ab
Select * from blooddb.patients where patients."bloodTypeId" IN (Select id from blooddb.blood where blood.type='AB');


//Wybierz wszystkich pacjentów i dawców z grupa krwi a- i 0+
SELECT blooddb.donors.id ,blooddb.donors.name, blooddb.donors.surname, blooddb.donors."bloodTypeId" FROM blooddb.donors where donors."bloodTypeId" IN (Select id from blooddb.blood where blood."fullName"='A-' or  blood."fullName"='0+' )
UNION
Select blooddb.patients.id ,blooddb.patients.name , blooddb.patients.surname, blooddb.patients."bloodTypeId" from blooddb.patients where patients."bloodTypeId" IN (Select id from blooddb.blood where blood."fullName"='A-' or  blood."fullName"='0+' );
