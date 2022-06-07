<?php


require_once 'core.php';
//create database model of patients table from the postgres database
class Patient
{
    private $id;
    private $name;
    private $surname;
    private $address;
    private $postcode;
    private $telephone;
    private $bloodType;
    private $neededBloodMl;
    private $hospital;
    private $hospital_id;
    private $blood_type_id;
    private $recievedbloodml;

    public function __construct($id, $name, $surname, $address, $postcode, $telephone, $neededBloodMl, $recievedbloodml, $hospital_name, $blood_full_name, $hospital_id, $blood_type_id)
    {
        $this->id = $id;
        $this->name = $name;
        $this->surname = $surname;
        $this->address = $address;
        $this->postcode = $postcode;
        $this->telephone = $telephone;
        $this->bloodType = $blood_full_name;
        $this->hospital = $hospital_name;
        $this->neededBloodMl = $neededBloodMl;
        $this->recievedbloodml = $recievedbloodml;
        $this->hospital_id = $hospital_id;
        $this->blood_type_id = $blood_type_id;
    }

    public function getId()
    {
        return $this->id;
    }
    public function getBloodTypeId()
    {
        return $this->blood_type_id;
    }
    public function getHospitalId()
    {
        return $this->hospital_id;
    }
    public function getName()
    {
        return $this->name;
    }
    public function getSurname()
    {
        return $this->surname;
    }
    public function getAddress()
    {
        return $this->address;
    }
    public function getPostcode()
    {
        return $this->postcode;
    }
    public function getTelephone()
    {
        return $this->telephone;
    }
    public function getBloodType()
    {
        return $this->bloodType;
    }

    public function getHospital()
    {
        return $this->hospital;
    }
    public function getRecievedBloodMl()
    {
        return $this->recievedbloodml;
    }
    public function getNeededBloodMl()
    {
        return $this->neededBloodMl;
    }



    //generate route to delete patient
    public function getDeleteLink()
    {
        return "deletePatient.php?id=" . $this->id;
    }
    //generate route to edit patient
    public function getEditLink()
    {
        return "patient.php?id=" . $this->id;
    }

    public static function create($name, $surname, $address, $postcode, $telephone, $blood_type_id, $hospital_id, $needed_blood_ml)
    {
        //escape all function arguments to prevent sql injection
        $name = pg_escape_string($name);
        $surname = pg_escape_string($surname);
        $address = pg_escape_string($address);
        $postcode = pg_escape_string($postcode);
        $telephone = pg_escape_string($telephone);
        $blood_type_id = pg_escape_string($blood_type_id);
        $hospital_id = pg_escape_string($hospital_id);
        $needed_blood_ml = pg_escape_string($needed_blood_ml);

        $sql =  "Insert into patients (id, name,surname,address,postcode,telephone_number,blood_type_id,hospital_id, needed_blood_ml) values ( DEFAULT, '$name','$surname','$address','$postcode','$telephone','$blood_type_id','$hospital_id','$needed_blood_ml')";
        $result = pg_query(DatabaseConnection::getInstance()->getConnection(), $sql);
        return $result;
    }

    //create static method witch updates the patient in the database using the all args
    public static function update($id, $name, $surname, $address, $postcode, $telephone, $hospital_id, $needed_blood_ml)
    {
        //escape all function arguments to prevent sql injection
        $id = pg_escape_string($id);
        $name = pg_escape_string($name);
        $surname = pg_escape_string($surname);
        $address = pg_escape_string($address);
        $postcode = pg_escape_string($postcode);
        $telephone = pg_escape_string($telephone);
        $hospital_id = pg_escape_string($hospital_id);
        $needed_blood_ml = pg_escape_string($needed_blood_ml);

        $sql = "UPDATE patients SET name = '$name', surname = '$surname', address = '$address', postcode = '$postcode', telephone_number = '$telephone', hospital_id = '$hospital_id', needed_blood_ml = '$needed_blood_ml' WHERE id = $id";
        $result = pg_query(DatabaseConnection::getInstance()->getConnection(), $sql);
        return $result;
    }
    //create static method witch deletes the patient in the database using id as arg similar as above
    public static function delete($id)
    {
        $id = pg_escape_string($id);
        $sql = "DELETE FROM patients WHERE id = $id";
        $result = pg_query(DatabaseConnection::getInstance()->getConnection(), $sql);
        return $result;
    }

    //fetches all patients from the database and paginates them
    public static function fetchAll($limit, $page, $orderBy, $order)
    {
        //escape all function arguments to prevent sql injection
        $limit = pg_escape_string($limit);
        $page = pg_escape_string($page);
        $orderBy = pg_escape_string($orderBy);
        $order = pg_escape_string($order);

        $conn = DatabaseConnection::getInstance()->getConnection();
        $offset = ($page - 1) * $limit;

        $sql = "SELECT * FROM patients_view ORDER BY $orderBy $order, id $order LIMIT $limit OFFSET $offset ";
        $result = pg_query($conn, $sql);
        $patients = array();

        while ($row = pg_fetch_assoc($result)) {

            $patients[] = new Patient($row['id'], $row['name'], $row['surname'], $row['address'], $row['postcode'], $row['telephone_number'], $row['needed_blood_ml'], $row['blood_transfered_ml'], $row['hospital_name'], $row['full_name'], $row['hospital_id'], $row['blood_id']);
        }
        return $patients;
    }

    //fetches patient by id from the database
    public static function fetchById($id)
    {
        //escape all function arguments to prevent sql injection
        $id = pg_escape_string($id);

        $conn = DatabaseConnection::getInstance()->getConnection();
        $sql = "SELECT * FROM patients_view WHERE id = $id";
        $result = pg_query($conn, $sql);

        $row = pg_fetch_assoc($result);
        return new Patient($row['id'], $row['name'], $row['surname'], $row['address'], $row['postcode'], $row['telephone_number'], $row['needed_blood_ml'], $row['blood_transfered_ml'], $row['hospital_name'], $row['full_name'], $row['hospital_id'], $row['blood_id']);
    }


    //returns paginated patients html links
    public static function getPaginationLinks($limit, $page)
    {
        //escape all function arguments to prevent sql injection
        $limit = pg_escape_string($limit);
        $page = pg_escape_string($page);

        $conn = DatabaseConnection::getInstance()->getConnection();
        $sql = "SELECT COUNT(*) FROM patients_view";
        $result = pg_query($conn, $sql);
        $row = pg_fetch_row($result);
        $total_records = $row[0];
        $total_pages = ceil($total_records / $limit);
        $paginationLinks = "";

        for ($i = 1; $i <= $total_pages; $i++) {
            if ($page == $i) {
                $paginationLinks .= "<a class='py-2 bg-white font-bold text-pink hover:bg-pink hover:text-white px-3 leading-tight ' href='patients.php?page=" . $i . "'>" . $i . "</a>";
            } else {
                $paginationLinks .= "<a class='py-2 bg-white text-pink hover:bg-pink hover:text-white px-3 leading-tight ' href='patients.php?page=" . $i . "'>" . $i . "</a>";
            }
        }
        return $paginationLinks;
    }

    public function getConn()
    {
        return $this->conn;
    }
}