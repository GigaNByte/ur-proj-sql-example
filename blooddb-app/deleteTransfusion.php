<?php
require_once 'core.php';

//delete patient by id using Patient static method
if (isset($_GET['id'])) {
    $id = (int)$_GET['id'];
    $status = Transfusion::delete($id);
    if ($status) {
        $_SESSION['status'] = "Operation Successfull: Transfusion of id = " . $id . " has been deleted " . DatabaseConnection::getInstance()->getNoticeMessage();
    } else {
        $_SESSION['status'] = DatabaseConnection::getInstance()->getErrorMessage();
    }
}


//redirect to patient.php
header('Location: transfusions.php');