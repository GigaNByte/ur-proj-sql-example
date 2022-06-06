<?php
require_once 'core.php';
//create Hospital class from the postgres database
class Hospital
{
    private $id;
    private $name;
    private $address;
    private $postcode;
    private $district;
    private $blood_transfered_ml;
    private $patients_count;
    private $donors_count;
    //create constructor for the class
    public function __construct($id, $name, $address, $postcode, $district, $blood_transfered_ml, $patients_count, $donors_count)
    {
        $this->id = $id;
        $this->name = $name;
        $this->address = $address;
        $this->postcode = $postcode;
        $this->district = $district;
        $this->blood_transfered_ml = $blood_transfered_ml;
        $this->patients_count = $patients_count;
        $this->donors_count = $donors_count;
    }
    //create getters for the class
    public function getId()
    {
        return $this->id;
    }
    public function getName()
    {
        return $this->name;
    }
    public function getAddress()
    {
        return $this->address;
    }
    public function getPostcode()
    {
        return $this->postcode;
    }
    public function getDistrict()
    {
        return $this->district;
    }
    public function getBloodTransferedMl()
    {
        return $this->blood_transfered_ml;
    }
    public function getPatientsCount()
    {
        return $this->patients_count;
    }
    public function getDonorsCount()
    {
        return $this->donors_count;
    }

    //fetches all hospitals from the database
    public static function fetchAll()
    {
        $conn = DatabaseConnection::getInstance()->getConnection();
        $query = "SELECT * FROM hospitals_view";
        $result = pg_query($conn, $query);
        $hospitals = array();
        while ($hospital = pg_fetch_assoc($result)) {
            $hospitals[] = new Hospital($hospital['id'], $hospital['name'], $hospital['address'], $hospital['postcode'], $hospital['district'], $hospital['blood_transfered_ml'], $hospital['patients_count'], $hospital['donors_count']);
        }
        return $hospitals;
    }

    //fetches hospital by id from the database
    public static function fetchById($id)
    {
        $conn = DatabaseConnection::getInstance()->getConnection();
        $query = "SELECT * FROM hospitals_view WHERE id = $id";
        $result = pg_query($conn, $query);
        $hospital = pg_fetch_assoc($result);
        return new Hospital($hospital['id'], $hospital['name'], $hospital['address'], $hospital['postcode'], $hospital['district'], $hospital['blood_transfered_ml'], $hospital['patients_count'], $hospital['donors_count']);
    }
    //generate route to delete donor
    public function getDeleteLink()
    {
        return "deleteHospital.php?id=" . $this->id;
    }
    //generate route to edit donor
    public function getEditLink()
    {
        return "hospital.php?id=" . $this->id;
    }

    public static function create($name, $address, $postcode, $district)
    {
        $name = pg_escape_string($name);
        $address = pg_escape_string($address);
        $postcode = pg_escape_string($postcode);
        $district = pg_escape_string($district);

        $sql =  "Insert into hospitals (id, name,address,postcode,district) values ( DEFAULT, '$name','$address','$postcode','$district')";
        $result = pg_query(DatabaseConnection::getInstance()->getConnection(), $sql);
        return $result;
    }

    public static function update($id, $name, $address, $postcode, $district)
    {
        $id = pg_escape_string($id);
        $name = pg_escape_string($name);
        $address = pg_escape_string($address);
        $postcode = pg_escape_string($postcode);
        $district = pg_escape_string($district);

        //update query 
        $sql = "UPDATE hospitals SET name = '$name', address = '$address', postcode = '$postcode', district = '$district' WHERE id = $id";
        $result = pg_query(DatabaseConnection::getInstance()->getConnection(), $sql);
        return $result;
    }

    public static function delete($id)
    {
        $id = pg_escape_string($id);
        $sql = "DELETE FROM hospitals WHERE id = $id";
        $result = pg_query(DatabaseConnection::getInstance()->getConnection(), $sql);
        return $result;
    }
}