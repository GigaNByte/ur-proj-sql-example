<?php
require_once 'core.php';
//update patient by id using Patient static method

//create example postgres view 


//perform query call patient_view_test

$name = $_POST['name'];
$surname = $_POST['surname'];
$address = $_POST['address'];
$postcode = $_POST['postcode'];
$telephone = $_POST['telephone_number'];
$blood_type = $_POST['blood_type_id'];
$hospital = $_POST['hospital_id'];
$needed_blood_ml = $_POST['needed_blood_ml'];
$status = Patient::create($name, $surname, $address, $postcode, $telephone, $blood_type, $hospital, $needed_blood_ml);
if ($status) {
    $_SESSION['status'] = "Operation Successfull:  Patient "  . $name . " " . $surname . " has been Created " . DatabaseConnection::getInstance()->getNoticeMessage();
} else {
    $_SESSION['status'] = DatabaseConnection::getInstance()->getErrorMessage();
}

header('Location: patients.php');