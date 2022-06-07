<?php
require_once 'core.php';

class Transfusion
{


    private $id;
    //create private properties
    private $patient_id;
    private $hospital_id;
    private $donor_id;
    private $donor_blood_type_fullname;
    private $patient_blood_type_fullname;
    private $blood_transfered_ml;
    private $patient_fullname;
    private $donor_fullname;
    private $hospital_name;
    private $date;

    //create constructor for the class
    public function __construct($id, $patient_fullname,  $patient_blood_type_fullname, $donor_fullname, $donor_blood_type_fullname, $blood_transfered_ml, $date, $patient_id, $donor_id, $hospital_id, $hospital_name)
    {
        //contructor for transfusion class
        $this->id = $id;
        $this->patient_fullname = $patient_fullname;
        $this->patient_blood_type_fullname = $patient_blood_type_fullname;
        $this->donor_fullname = $donor_fullname;
        $this->donor_blood_type_fullname = $donor_blood_type_fullname;
        $this->blood_transfered_ml = $blood_transfered_ml;
        $this->date = $date;
        $this->patient_id = $patient_id;
        $this->donor_id = $donor_id;
        $this->hospital_id = $hospital_id;
        $this->hospital_name = $hospital_name;
    }
    //create getters for the class
    public function getId()
    {
        return $this->id;
    }
    public function getPatientId()
    {
        return $this->patient_id;
    }
    public function getHospitalId()
    {
        return $this->hospital_id;
    }
    public function getDonorId()
    {
        return $this->donor_id;
    }
    public function getBloodTransferedMl()
    {
        return $this->blood_transfered_ml;
    }
    public function getDate()
    {
        return $this->date;
    }
    public function getPatientFullname()
    {
        return $this->patient_fullname;
    }
    public function getDonorFullname()
    {
        return $this->donor_fullname;
    }
    public function getDonorBloodTypeFullname()
    {
        return $this->donor_blood_type_fullname;
    }
    public function getPatientBloodTypeFullname()
    {
        return $this->patient_blood_type_fullname;
    }
    public function getHospitalName()
    {
        return $this->hospital_name;
    }

    //fetches all transfusions from the database
    public static function fetchAll($limit, $page, $orderBy, $order)
    {
        $limit = pg_escape_string($limit);
        $page = pg_escape_string($page);
        $orderBy = pg_escape_string($orderBy);
        $order = pg_escape_string($order);
        $offset = ($page - 1) * $limit;
        $conn = DatabaseConnection::getInstance()->getConnection();
        $query = "SELECT * FROM transfusions_view ORDER BY $orderBy $order, id $order LIMIT $limit OFFSET $offset ";
        $result = pg_query($conn, $query);
        $transfusions = array();
        while ($transfusion = pg_fetch_assoc($result)) {
            $transfusions[] = new Transfusion($transfusion['id'], $transfusion['patient_fullname'], $transfusion['patient_blood_type_name'], $transfusion['donor_fullname'], $transfusion['donor_blood_type_name'], $transfusion['blood_transfered_ml'], $transfusion['date'], $transfusion['patient_id'], $transfusion['donor_id'], $transfusion['hospital_id'], $transfusion['hospital_name']);
        }
        return $transfusions;
    }

    //fetches transfusion by id from the database
    public static function fetchById($id)
    {
        $conn = DatabaseConnection::getInstance()->getConnection();
        $query = "SELECT * FROM transfusions_view WHERE id = $id ";
        $result = pg_query($conn, $query);
        $transfusion = pg_fetch_assoc($result);
        return  new Transfusion($transfusion['id'], $transfusion['patient_fullname'], $transfusion['patient_blood_type_name'], $transfusion['patient_fullname'], $transfusion['donor_blood_type_name'], $transfusion['blood_transfered_ml'], $transfusion['date'], $transfusion['patient_id'], $transfusion['donor_id'], $transfusion['hospital_id'], $transfusion['hospital_name']);
    }
    //generate route to delete donor
    public function getDeleteLink()
    {
        return "deleteTransfusion.php?id=" . $this->id;
    }
    //generate route to edit donor
    public function getEditLink()
    {
        return "transfusion.php?id=" . $this->id;
    }

    public static function create($patient_id, $donor_id, $hospital_id, $blood_transfered_ml)
    {
        $patient_id = pg_escape_string($patient_id);
        $donor_id = pg_escape_string($donor_id);
        $blood_transfered_ml = pg_escape_string($blood_transfered_ml);
        $sql = "call createTransfusion ($patient_id, $donor_id,$hospital_id, $blood_transfered_ml)";

        $result = pg_query(DatabaseConnection::getInstance()->getConnection(), $sql);
        return $result;
    }

    public static function update($id, $patient_id, $donor_id, $hospital_id, $blood_transfered_ml)
    {
        $id = pg_escape_string($id);
        $patient_id = pg_escape_string($patient_id);
        $donor_id = pg_escape_string($donor_id);
        $hospital_id = pg_escape_string($hospital_id);
        $blood_transfered_ml = pg_escape_string($blood_transfered_ml);

        //update query  
        $sql = "UPDATE transfusions SET patient_id = $patient_id, donor_id = $donor_id, hospital_id = $hospital_id, blood_transfered_ml = $blood_transfered_ml WHERE id = $id";
        $result = pg_query(DatabaseConnection::getInstance()->getConnection(), $sql);
        return $result;
    }

    public static function delete($id)
    {
        $id = pg_escape_string($id);
        $sql = "DELETE FROM transfusions WHERE id = $id";
        $result = pg_query(DatabaseConnection::getInstance()->getConnection(), $sql);
        return $result;
    }

    public static function getPaginationLinks($limit, $page)
    {

        //escape all function arguments to prevent sql injection
        $limit = pg_escape_string($limit);
        $page = pg_escape_string($page);

        $conn = DatabaseConnection::getInstance()->getConnection();
        $sql = "SELECT COUNT(*) FROM transfusions_view";

        $result = pg_query($conn, $sql);

        $row = pg_fetch_row($result);
        $total_records = $row[0];
        $total_pages = ceil($total_records / $limit);
        $paginationLinks = "";

        for ($i = 1; $i <= $total_pages; $i++) {
            if ($page == $i) {
                $paginationLinks .= "<a class='py-2 bg-white font-bold text-pink hover:bg-pink hover:text-white px-3 leading-tight ' href='transfusions.php?page=" . $i . "'>" . $i . "</a>";
            } else {
                $paginationLinks .= "<a class='py-2 bg-white text-pink hover:bg-pink hover:text-white px-3 leading-tight ' href='transfusions.php?page=" . $i . "'>" . $i . "</a>";
            }
        }
        return $paginationLinks;
    }
}