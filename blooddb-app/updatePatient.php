<?php
require_once 'core.php';
//update patient by id using Patient static method
if (isset($_POST['id'])) {
    $id = (int)$_POST['id'];
    $name = $_POST['name'];
    $surname = $_POST['surname'];
    $address = $_POST['address'];
    $postcode = $_POST['postcode'];
    $telephone = $_POST['telephone_number'];
    $hospital = $_POST['hospital_id'];
    $needed_blood_ml = $_POST['needed_blood_ml'];
    $status = Patient::update($id, $name, $surname, $address, $postcode, $telephone, $hospital, $needed_blood_ml);
    if ($status) {
        $_SESSION['status'] = "Operation Successfull: Patient of id = " . $id . " has been updated " . DatabaseConnection::getInstance()->getNoticeMessage();
    } else {
        $_SESSION['status'] = DatabaseConnection::getInstance()->getErrorMessage();
    }
}
//redirect to patient.php with id variable
header('Location: patient.php?id=' . $id);