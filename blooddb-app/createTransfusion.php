<?php
require_once 'core.php';


$name = $_POST['name'];
$address = $_POST['address'];
$postcode = $_POST['postcode'];
$district = $_POST['district'];

$status = Hospital::create($name, $address, $postcode, $district);
if ($status) {
    $_SESSION['status'] = "Operation Successfull:  Hospital "  . $name . " " . $surname . " has been Created " . DatabaseConnection::getInstance()->getNoticeMessage();
} else {
    $_SESSION['status'] = DatabaseConnection::getInstance()->getErrorMessage();
}

header('Location: hospitals.php');