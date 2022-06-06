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
            Hospitals
        </p>
        <form method="POST" action="hospitals.php" class="card-header-icon  flex flex-row  mx-5">
            <button class="mx-5  is-link">
                <span class="icon"><i class="fa-solid fa-filter"></i></span>
                <span>Order By:</span>
            </button>
            <select name="orderBy" class="bg-white mx-5" onchange="this.form.submit()">
                <option value="id" <?php if ($orderBy == 'id') echo 'selected'; ?>>ID</option>

                <option value="name" <?php if ($orderBy == 'name') echo 'selected'; ?>>Name</option>
                <option value="address" <?php if ($orderBy == 'address') echo 'selected'; ?>>Address</option>
                <option value="postcode" <?php if ($orderBy == 'postcode') echo 'selected'; ?>>Postcode</option>
                <option value="telephone_number" <?php if ($orderBy == 'telephone_number') echo 'selected'; ?>>Telephone
                </option>
                <option value="patients_count" <?php if ($orderBy == 'patients_count') echo 'selected'; ?>>Patients
                </option>
                <option value="blood_types_count" <?php if ($orderBy == 'blood_types_count') echo 'selected'; ?>>Blood
                    Types </option>
                <option value="blood_transfered_ml" <?php if ($orderBy == 'blood_transfered_ml') echo 'selected'; ?>>
                    Recieved Blood Ml</option>

            </select>
            <select name="order" class="bg-white mx-5" onchange="this.form.submit()">
                <option value="DESC" <?php if ($order == 'DESC') echo 'selected'; ?>>Descending</option>
                <option value="ASC" <?php if ($order == 'ASC') echo 'selected'; ?>>Ascending</option>
            </select>

        </form>

        <a href="./hospitals.php" class="card-header-icon">
            <span class="icon pr-10"><i class="fa-solid fa-arrows-rotate"></i></span>
        </a>
    </div>
    <div class="card-content">
        <?php

        //get page variable from URL
        $page = (isset($_GET['page'])) ? (int)$_GET['page'] : 1;
        $hospitals = Hospital::fetchAll(10, $page, $orderBy, $order);

        //create crud html table from the data
        ?>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Postcode</th>
                    <th>Address</th>
                    <th>District</th>
                    <th>Action</th>
                    <th>Blood transfered</th>
                    <th>Patients</th>
                    <th>Donors</th>
                </tr>
            </thead>
            <tbody>
                <?php

                foreach ($hospitals as $hospital) {

                    echo "<tr>";
                    echo "<td>" . $hospital->getId() . "</td>";
                    echo "<td>" . $hospital->getName() . "</td>";
                    echo "<td>" . $hospital->getPostcode() . "</td>";
                    echo "<td>" . $hospital->getDistrict() . "</td>";
                    echo "<td>" . $hospital->getAddress() . "</td>";
                    echo "<td>" . $hospital->getBloodTransferedMl() . "</td>";
                    echo "<td>" . $hospital->getPatientsCount() . "</td>";
                    echo "<td>" . $hospital->getDonorsCount() . "</td>";
                ?>
                <td class="actions-cell">
                    <div class="buttons right nowrap">
                        <button class="button small blue --jb-modal" data-target="sample-modal-2" type="button">
                            <a href="<?php echo $hospital->getEditLink() ?>">
                                <span class="icon"><i class="fa-solid fa-pen"></i></span>
                            </a>
                        </button>
                        <button class="button small red --jb-modal" data-target="sample-modal" type="button">
                            <a href="<?php echo $hospital->getDeleteLink() ?>">
                                <span class="icon"><i class="fa fa-trash"></i> </span>
                            </a>
                        </button>
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
<div class="card has-table my-5">
    <header class="card-header">
        <p class="card-header-title">
            <span class="icon"><i class="fa-solid fa-pen"></i></span>
            Add Hospital
        </p>
    </header>
    <div class="card-content">
        <table>
            <thead>

            </thead>
            <tbody>

                <form action="createHospital.php" method="POST">
                    <tr>
                        <td>

                            <label for="name" class="pr-5">Name</label>
                            <input type="text" name="name" class="input" placeholder="Name">
                        </td>

                        <td>

                            <label for="address" class="pr-5">
                                Address
                            </label>
                            <input type="text" name="address" class="input" placeholder="Address">
                        </td>
                    </tr>


                    <tr>
                        <td>

                            <label for="postcode" class="pr-5">Postcode</label>
                            <input type="text" name="postcode" class="input" placeholder="Postcode">
                        </td>
                        <td>

                            <label for="district" class="pr-5">District</label>
                            <input type="text" name="district" class="input" placeholder="District">
                        </td>
                        <td>
                            <label for="submit" class="pr-5">Create: </label>
                            <button type="submit" class="button small blue --jb-modal" data-target="sample-modal-2">
                                <span class="icon"><i class="fa-solid fa-plus"></i></span>
                            </button>
                        </td>
                    </tr>



                </form>

            </tbody>
        </table>
        <?php
        require_once "./partials/footer.php"; ?>