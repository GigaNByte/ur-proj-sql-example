<?php
require_once 'core.php';
//update patient by id using Patient static method
if (isset($_POST['id'])) {
    $id = (int)$_POST['id'];
    $name = $_POST['name'];
    $address = $_POST['address'];
    $postcode = $_POST['postcode'];
    $district = $_POST['district'];
    $status = Hospital::update($id, $name, $address, $postcode, $district);
    if ($status) {
        $_SESSION['status'] = "Operation Successfull: Hospital of id = " . $id . " has been updated " . DatabaseConnection::getInstance()->getNoticeMessage();
    } else {
        $_SESSION['status'] = DatabaseConnection::getInstance()->getErrorMessage();
    }
}
//redirect to patient.php with id variable
header('Location: hospital.php?id=' . $id);