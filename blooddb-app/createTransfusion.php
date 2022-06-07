<?php
require_once 'core.php';
require_once './partials/head.php';
if (isset($_POST['orderBy'])) {
    $orderBy = $_POST['orderBy'];
} else {
    $orderBy = 'id';
}
if (isset($_POST['order'])) {
    $order = $_POST['order'];
} else {
    $order = 'DESC';
}

$id = (int)$_POST['id'];
$patient = Patient::fetchById($id);

?>
<div class="card has-table">
    <div class="card-header">
        <p class="card-header-title">
            <span class="icon"><i class="fa-solid fa-bed pr-5"></i></span>
            <?php echo "Donors Candidates for" . $patient->getName() . ' ' . $patient->getSurname() . ' ' . $patient->getBloodType() . '  <br> In hospital: ' . $patient->getHospital() . '</br>Blood amount to be transfered: ' . $_POST['blood_transfered_ml'] . ' ml' ?>
        </p>

    </div>
    <div class="card-content">
        <?php

        //get page variable from URL
        $page = (isset($_GET['page'])) ? (int)$_GET['page'] : 1;
        $donors = Donor::getCandidates($_POST['id'], 10, $page);

        //create crud html table from the data
        ?>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Surname</th>
                    <th>Blood Type</th>
                    <th>Address</th>
                    <th>Telephone Number</th>
                    <th>Hospital</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php

                foreach ($donors as $donor) {

                    echo "<tr>";
                    echo "<td>" . $donor->getId() . "</td>";
                    echo "<td>" . $donor->getName() . "</td>";
                    echo "<td>" . $donor->getSurname() . "</td>";
                    echo "<td>" . $donor->getBloodType() . "</td>";
                    echo "<td>" . $donor->getAddress() . "</td>";
                    echo "<td>" . $donor->getTelephone() . "</td>";
                    echo "<td>" . $donor->getHospital() . "</td>";
                ?>
                <td class="actions-cell">
                    <div class="buttons right nowrap">

                        <form action="createTransfusion2.php" method="POST">
                            <input type="hidden" name="donor_id" value="<?php echo $donor->getId() ?>">
                            <input type="hidden" name="blood_transfered_ml"
                                value="<?php echo $_POST['blood_transfered_ml'] ?>">
                            <input type="hidden" name="patient_id" value="<?php echo $id ?>">
                            <input type="hidden" name="hospital_id" value="<?php echo $patient->getHospitalId() ?>">

                            <button class=" button small red --jb-modal " data-target=" sample-modal" type="submit">
                                <span class="icon"><i class="fa-solid fa-droplet"></i> </span>
                            </button>
                        </form>
                    </div>
                </td>
                </tr>
                <?php
                    echo "</tr>";
                }
                echo "</tbody>";
                echo "</table>";
                ?>
    </div>
</div>

<?php
require_once "./partials/footer.php"; ?>