Select * from blooddb.patients where patients."bloodTypeId" IN (Select id from blooddb.blood where blood.type='AB');