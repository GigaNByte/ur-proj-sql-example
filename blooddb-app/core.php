<?php
//start session if not already started
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
require_once 'DatabaseConnection.php';
require_once './Models/Patient.php';
require_once './Models/Blood.php';
require_once './Models/Hospital.php';
require_once './Models/Donor.php';