<?php
require_once 'core.php';
class Blood
{
    private $id;
    private $type;
    private $is_rhesus;
    private $full_name;
    //create constructor
    public function __construct($id, $type, $is_rhesus, $full_name)
    {
        $this->id = $id;
        $this->type = $type;
        $this->is_rhesus = $is_rhesus;
        $this->full_name = $full_name;
    }
    //create get functions for each attribute
    public function getId()
    {
        return $this->id;
    }
    public function getType()
    {
        return $this->type;
    }
    public function getIsRhesus()
    {
        return $this->is_rhesus;
    }
    public function getFullName()
    {
        return $this->full_name;
    }

    public static function fetchAll()
    {
        $sql = "SELECT * FROM blood_view";
        $result = pg_query(DatabaseConnection::getInstance()->getConnection(), $sql);
        //create new Blood object from result using pg_fetch_assoc
        $bloods = array();
        while ($row = pg_fetch_assoc($result)) {
            $bloods[] = new Blood($row['id'], $row['type'], $row['is_rhesus'], $row['full_name']);
        }
        return $bloods;
    }
    //fetches bloods by id from the database
    public static function fetchById($id)
    {
        //escape all function arguments to prevent sql injection
        $id = pg_escape_string($id);

        $conn = DatabaseConnection::getInstance()->getConnection();
        $sql = "SELECT * FROM blood_view WHERE id = $id";
        $result = pg_query($conn, $sql);
        $row = pg_fetch_assoc($result);
        return new Blood($row['id'], $row['type'], $row['is_rhesus'], $row['full_name']);
    }
}