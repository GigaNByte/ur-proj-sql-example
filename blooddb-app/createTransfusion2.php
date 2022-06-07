<?php
require_once 'core.php';

//delete patient by id using Patient static method

//get post values patient_id
$patient_id = $_POST['patient_id'];
$donor_id = $_POST['donor_id'];
$hospital_id = $_POST['hospital_id'];
$blood_transfered_ml = $_POST['blood_transfered_ml'];

$status = Transfusion::create($patient_id, $donor_id, $hospital_id, $blood_transfered_ml);

if ($status) {
    $_SESSION['status'] = "Operation Successfull: Transfusion has been added " . DatabaseConnection::getInstance()->getNoticeMessage();
} else {
    $_SESSION['status'] = DatabaseConnection::getInstance()->getErrorMessage();
}


//redirect to patient.php
header('Location: transfusions.php');