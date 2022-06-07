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
            Donors
        </p>
        <form method="POST" action="donors.php" class="card-header-icon  flex flex-row  mx-5">
            <button class="mx-5  is-link">
                <span class="icon"><i class="fa-solid fa-filter"></i></span>
                <span>Order By:</span>
            </button>
            <select name="orderBy" class="bg-white mx-5" onchange="this.form.submit()">
                <option value="id" <?php if ($orderBy == 'id') echo 'selected'; ?>>ID</option>
                <option value="name" <?php if ($orderBy == 'name') echo 'selected'; ?>>Name</option>
                <option value="surname" <?php if ($orderBy == 'surname') echo 'selected'; ?>>Surname</option>
                <option value="address" <?php if ($orderBy == 'address') echo 'selected'; ?>>Address</option>
                <option value="telephone_number" <?php if ($orderBy == 'telephone_number') echo 'selected'; ?>>Telephone
                </option>
                <option value="full_name" <?php if ($orderBy == 'full_name') echo 'selected'; ?>>Blood Type
                </option>
                <option value="hospital" <?php if ($orderBy == 'hospital') echo 'selected'; ?>>Hospital</option>
                <option value="blood_transfered_ml" <?php if ($orderBy == 'blood_transfered_ml') echo 'selected'; ?>>
                    Donated Blood Ml</option>
            </select>
            <select name="order" class="bg-white mx-5" onchange="this.form.submit()">
                <option value="DESC" <?php if ($order == 'DESC') echo 'selected'; ?>>Descending</option>
                <option value="ASC" <?php if ($order == 'ASC') echo 'selected'; ?>>Ascending</option>
            </select>

        </form>

        <a href="./donors.php" class="card-header-icon">
            <span class="icon pr-10"><i class="fa-solid fa-arrows-rotate"></i></span>
        </a>
    </div>
    <div class="card-content">
        <?php

        //get page variable from URL
        $page = (isset($_GET['page'])) ? (int)$_GET['page'] : 1;
        $donors = Donor::fetchAll(10, $page, $orderBy, $order);

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
                    <th>Donated Blood Ml</th>
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
                    echo "<td>" . $donor->getTransferedBloodMl() . "</td>";
                ?>
                <td class="actions-cell">
                    <div class="buttons right nowrap">
                        <button class="button small blue --jb-modal" data-target="sample-modal-2" type="button">
                            <a href="<?php echo $donor->getEditLink() ?>">
                                <span class="icon"><i class="fa-solid fa-pen"></i></span>
                            </a>
                        </button>
                        <button class="button small red --jb-modal" data-target="sample-modal" type="button">
                            <a href="<?php echo $donor->getDeleteLink() ?>">
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
                echo '<div class="table-pagination flex justify-center">';
                echo  '<div class="border-4 border-pink border-solid">';
                echo Donor::getPaginationLinks(10, $page);
                echo '</div>';
                echo '</div>';
                ?>
    </div>
</div>
<div class="card has-table my-5">
    <header class="card-header">
        <p class="card-header-title">
            <span class="icon"><i class="fa-solid fa-pen"></i></span>
            Add Donor
        </p>
    </header>
    <div class="card-content">
        <table>
            <thead>

            </thead>
            <tbody>

                <form action="createDonor.php" method="POST">
                    <tr>
                        <td>

                            <label for="name" class="pr-5">Name</label>
                            <input type="text" name="name" class="input" placeholder="Name">
                        </td>
                        <td>
                            <label for="surname" class="pr-5">Surname</label>
                            <input type="text" name="surname" class="input" placeholder="Surname">
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

                            <label for="Telephone Number" class="pr-5">Telephone Number</label>
                            <input type="text" name="telephone_number" class="input" placeholder="Telephone Number">
                        </td>
                        <td>
                            <label for="blood_type" class="pr-5">Blood Type</label>
                            <select name="blood_type_id" class="input">
                                <?php
                                foreach (Blood::fetchAll() as $bloodType) {
                                    if ($bloodType->getId() == $donor->getBloodTypeId()) {
                                        echo "<option value='" . $bloodType->getId() . "' selected>" . $bloodType->getFullName() . "</option>";
                                    } else {
                                        echo "<option value='" . $bloodType->getId() . "'>" . $bloodType->getFullName() . "</option>";
                                    }
                                }
                                ?>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>


                            <label for="hospital" class="pr-5">Hospital</label>
                            <select name="hospital_id" class="input">
                                <?php
                                foreach (Hospital::fetchAll() as $hospital) {
                                    echo "<option value='" . $hospital->getId() . "'>" . $hospital->getName() . "</option>";
                                }
                                ?>
                            </select>
                        </td>
                        <td></td>
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