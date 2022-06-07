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
?>
<div class="card has-table">
    <div class="card-header">
        <p class="card-header-title">
            <span class="icon"><i class="fa-solid fa-bed"></i></span>
            Transfusions
        </p>
        <form method="POST" action="transfusions.php" class="card-header-icon  flex flex-row  mx-5">
            <button class="mx-5  is-link">
                <span class="icon"><i class="fa-solid fa-filter"></i></span>
                <span>Order By:</span>
            </button>
            <select name="orderBy" class="bg-white mx-5" onchange="this.form.submit()">
                <option value="id" <?php if ($orderBy == 'id') echo 'selected'; ?>>ID</option>
                <option value="patient_id" <?php if ($orderBy == 'patient_id') echo 'selected'; ?>>Patient ID</option>
                <option value="hospital_id" <?php if ($orderBy == 'hospital_id') echo 'selected'; ?>>Hospital ID
                </option>
                <option value="donor_id" <?php if ($orderBy == 'donor_id') echo 'selected'; ?>>Donor ID</option>
                <option value="donor_blood_type_fullname" <?php if ($orderBy == 'donor_blood_type_fullname') echo 'selected'; ?>>Donor Blood Type</option>
                <option value="patient_blood_type_fullname" <?php if ($orderBy == 'patient_blood_type_fullname') echo 'selected'; ?>>Patient Blood Type</option>
                <option value="blood_transfered_ml" <?php if ($orderBy == 'blood_transfered_ml') echo 'selected'; ?>>
                    Blood Transfered (ml)</option>
                <option value="date" <?php if ($orderBy == 'date') echo 'selected'; ?>>Date</option>
                <option value="patient_fullname" <?php if ($orderBy == 'patient_fullname') echo 'selected'; ?>>Patient
                    Fullname</option>
                <option value="donor_fullname" <?php if ($orderBy == 'donor_fullname') echo 'selected'; ?>>Donor
                    Fullname</option>
            </select>
            <select name="order" class="bg-white mx-5" onchange="this.form.submit()">
                <option value="DESC" <?php if ($order == 'DESC') echo 'selected'; ?>>Descending</option>
                <option value="ASC" <?php if ($order == 'ASC') echo 'selected'; ?>>Ascending</option>
            </select>
        </form>
        <a href="./transfusions.php" class="card-header-icon">
            <span class="icon pr-10"><i class="fa-solid fa-arrows-rotate"></i></span>
        </a>
    </div>
    <div class="card-content">
        <?php

        //get page variable from URL
        $page = (isset($_GET['page'])) ? (int)$_GET['page'] : 1;
        $transfusions = Transfusion::fetchAll(10, $page, $orderBy, $order);

        //create crud html table from the data
        ?>
        <table>
            <thead>
                <tr>
                    <th>ID</th>

                    <th>Patient ID</th>
                    <th>Patient Fullname</th>
                    <th>Donor ID</th>
                    <th>Donor Fullname</th>
                    <th>Hospital Name</th>
                    <th>Donor Blood Type</th>
                    <th>Patient Blood Type</th>
                    <th>Blood Transfered (ml)</th>
                    <th>Date</th>

                    <th>Actions</th>

                </tr>
            </thead>
            <tbody>
                <?php

                foreach ($transfusions as $transfusion) {
                    echo "<tr>";
                    echo "<td>" . $transfusion->getId() . "</td>";
                    echo "<td>" . $transfusion->getPatientId() . "</td>";
                    echo "<td>" . $transfusion->getPatientFullname() . "</td>";
                    echo "<td>" . $transfusion->getDonorId() . "</td>";
                    echo "<td>" . $transfusion->getDonorFullname() . "</td>";
                    echo "<td>" . $transfusion->getHospitalName() . "</td>";
                    echo "<td>" . $transfusion->getDonorBloodTypeFullname() . "</td>";
                    echo "<td>" . $transfusion->getPatientBloodTypeFullname() . "</td>";
                    echo "<td>" . $transfusion->getBloodTransferedMl() . "</td>";
                    echo "<td>" . $transfusion->getDate() . "</td>";
                    echo "<td>";
                ?>
                    <td class="actions-cell">

                    </td>
                    </tr>
                <?php
                    echo "</tr>";
                }
                echo "</tbody>";
                echo "</table>";
                echo '<div class="table-pagination flex justify-center">';
                echo  '<div class="border-4 border-pink border-solid">';
                echo Transfusion::getPaginationLinks(25, $page);
                echo '</div>';
                echo '</div>';
                ?>
    </div>
</div>

<?php
require_once "./partials/footer.php"; ?>