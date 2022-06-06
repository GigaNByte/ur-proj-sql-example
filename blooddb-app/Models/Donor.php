<?php


require_once 'core.php';
//create database model of donors table from the postgres database
class Donor
{
    private $id;
    private $name;
    private $surname;
    private $address;
    private $postcode;
    private $telephone;
    private $bloodType;

    private $hospital;
    private $hospital_id;
    private $blood_type_id;
    private $transfered_blood_ml;

    public function __construct($id, $name, $surname, $address, $telephone, $transfered_blood_ml, $hospital_name, $blood_full_name, $hospital_id, $blood_type_id)
    {
        $this->id = $id;
        $this->name = $name;
        $this->surname = $surname;
        $this->address = $address;
        $this->telephone = $telephone;
        $this->bloodType = $blood_full_name;
        $this->hospital = $hospital_name;
        $this->transfered_blood_ml = $transfered_blood_ml;
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
    public function getTransferedBloodMl()
    {
        return $this->transfered_blood_ml;
    }




    //generate route to delete donor
    public function getDeleteLink()
    {
        return "deleteDonor.php?id=" . $this->id;
    }
    //generate route to edit donor
    public function getEditLink()
    {
        return "donor.php?id=" . $this->id;
    }

    public static function create($name, $surname, $address, $postcode, $telephone, $blood_type_id, $hospital_id)
    {
        //escape all function arguments to prevent sql injection
        $name = pg_escape_string($name);
        $surname = pg_escape_string($surname);
        $address = pg_escape_string($address);
        $postcode = pg_escape_string($postcode);
        $telephone = pg_escape_string($telephone);
        $blood_type_id = pg_escape_string($blood_type_id);
        $hospital_id = pg_escape_string($hospital_id);


        $sql =  "Insert into donors (id, name,surname,address,postcode,telephone_number,blood_type_id,hospital_id) values ( DEFAULT, '$name','$surname','$address','$postcode','$telephone','$blood_type_id','$hospital_id')";
        $result = pg_query(DatabaseConnection::getInstance()->getConnection(), $sql);
        return $result;
    }

    //create static method witch updates the donor in the database using the all args
    public static function update($id, $name, $surname, $address, $telephone, $hospital_id)
    {
        //escape all function arguments to prevent sql injection
        $id = pg_escape_string($id);
        $name = pg_escape_string($name);
        $surname = pg_escape_string($surname);
        $address = pg_escape_string($address);
        $telephone = pg_escape_string($telephone);
        $hospital_id = pg_escape_string($hospital_id);

        $sql = "UPDATE donors SET name = '$name', surname = '$surname', address = '$address', telephone_number = '$telephone', hospital_id = '$hospital_id' WHERE id = $id";
        $result = pg_query(DatabaseConnection::getInstance()->getConnection(), $sql);
        return $result;
    }
    //create static method witch deletes the donor in the database using id as arg similar as above
    public static function delete($id)
    {
        $id = pg_escape_string($id);
        $sql = "DELETE FROM donors WHERE id = $id";
        $result = pg_query(DatabaseConnection::getInstance()->getConnection(), $sql);
        return $result;
    }

    //fetches all donors from the database and paginates them
    public static function fetchAll($limit, $page, $orderBy, $order)
    {
        //escape all function arguments to prevent sql injection
        $limit = pg_escape_string($limit);
        $page = pg_escape_string($page);
        $orderBy = pg_escape_string($orderBy);
        $order = pg_escape_string($order);
        $conn = DatabaseConnection::getInstance()->getConnection();
        $offset = ($page - 1) * $limit;

        $sql = "SELECT * FROM donors_view ORDER BY $orderBy $order, id $order LIMIT $limit OFFSET $offset ";
        $result = pg_query($conn, $sql);
        $donors = array();

        while ($row = pg_fetch_assoc($result)) {

            $donors[] = new Donor($row['id'], $row['name'], $row['surname'], $row['address'], $row['telephone_number'], $row['blood_transfered_ml'], $row['hospital_name'], $row['full_name'], $row['hospital_id'], $row['blood_id']);
        }
        return $donors;
    }

    //fetches donor by id from the database
    public static function fetchById($id)
    {
        //escape all function arguments to prevent sql injection
        $id = pg_escape_string($id);

        $conn = DatabaseConnection::getInstance()->getConnection();
        $sql = "SELECT * FROM donors_view WHERE id = $id";
        $result = pg_query($conn, $sql);

        $row = pg_fetch_assoc($result);
        return new Donor($row['id'], $row['name'], $row['surname'], $row['address'], $row['telephone_number'], $row['blood_transfered_ml'], $row['hospital_name'], $row['full_name'], $row['hospital_id'], $row['blood_id']);
    }


    //returns paginated donors html links
    public static function getPaginationLinks($limit, $page)
    {
        //escape all function arguments to prevent sql injection
        $limit = pg_escape_string($limit);
        $page = pg_escape_string($page);

        $conn = DatabaseConnection::getInstance()->getConnection();
        $sql = "SELECT COUNT(*) FROM donors_view";
        $result = pg_query($conn, $sql);
        $row = pg_fetch_row($result);
        $total_records = $row[0];
        $total_pages = ceil($total_records / $limit);
        $paginationLinks = "";

        for ($i = 1; $i <= $total_pages; $i++) {
            if ($page == $i) {
                $paginationLinks .= "<a class='py-2 bg-white font-bold text-pink hover:bg-pink hover:text-white px-3 leading-tight ' href='donors.php?page=" . $i . "'>" . $i . "</a>";
            } else {
                $paginationLinks .= "<a class='py-2 bg-white text-pink hover:bg-pink hover:text-white px-3 leading-tight ' href='donors.php?page=" . $i . "'>" . $i . "</a>";
            }
        }
        return $paginationLinks;
    }

    public function getConn()
    {
        return $this->conn;
    }
}