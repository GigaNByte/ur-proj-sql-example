<?php
require_once 'core.php';
//update patient by id using Patient static method
if (isset($_POST['id'])) {
    $id = (int)$_POST['id'];
    $name = $_POST['name'];
    $surname = $_POST['surname'];
    $address = $_POST['address'];
    $telephone = $_POST['telephone_number'];
    $hospital = $_POST['hospital_id'];
    $status = Donor::update($id, $name, $surname, $address, $telephone, $hospital);
    if ($status) {
        $_SESSION['status'] = "Operation Successfull: Donor of id = " . $id . " has been updated " . DatabaseConnection::getInstance()->getNoticeMessage();
    } else {
        $_SESSION['status'] = DatabaseConnection::getInstance()->getErrorMessage();
    }
}
//redirect to patient.php with id variable
header('Location: donor.php?id=' . $id);