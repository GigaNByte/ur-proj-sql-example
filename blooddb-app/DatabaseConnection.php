<?php
//create singleton class for connecting to the postgres database using pg_connect
class DatabaseConnection
{
    private static $instance = null;
    private $connection;

    private function __construct()
    {
        $this->connection = pg_connect("host=localhost port=5432 dbname=blooddb user=postgres password=1234");
    }

    public static function getInstance()
    {
        if (self::$instance == null) {
            self::$instance = new DatabaseConnection();
        }
        return self::$instance;
    }

    public function getConnection()
    {
        return $this->connection;
    }
    //close the connection
    public function closeConnection()
    {
        pg_close($this->connection);
    }
    //get error message
    public function getErrorMessage()
    {
        return pg_last_error($this->connection);
    }
    //get success message
    public function getNoticeMessage()
    {
        return pg_last_notice($this->connection);
    }
}