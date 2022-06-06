<?php



require_once 'core.php';
require_once "./partials/head.php";

//fetch donor by id using Donor static method and assign to $donor
$donor = Donor::fetchById($_GET['id']);
//create edit form of donor and wrap every label and input in div
?>
<div class="card has-table my-5">
    <header class="card-header">
        <p class="card-header-title">
            <span class="icon"><i class="fa-solid fa-user"></i></span>
            Edit Donor
        </p>
    </header>
    <div class="card-content">
        <table>
            <thead>

            </thead>
            <tbody>

                <form action="updateDonor.php" method="POST">
                    <tr>

                        <input type="hidden" name="id" class="input" value="<?php echo $donor->getId() ?>">

                        <td>
                            <label for="name" class="pr-5">Name: </label>
                            <input type="text" name="name" class="input" placeholder="Name"
                                value="<?php echo $donor->getName() ?>">
                        </td>
                        <td>
                            <label for="surname" class="pr-5">Surname: </label>
                            <input type="text" name="surname" class="input" placeholder="Surname"
                                value="<?php echo $donor->getSurname() ?>">
                        </td>
                        <td>
                            <label for="address" class="pr-5">Address: </label>
                            <input type="text" name="address" class="input" placeholder="Address"
                                value="<?php echo $donor->getAddress() ?>">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="telephone_number" class="pr-5">Telephone: </label>
                            <input type="text" name="telephone_number" class="input" placeholder="Telephone Number"
                                value="<?php echo $donor->getTelephone() ?>">
                        </td>
                        <td>

                            <label for="hospital_id" class="pr-5">Hospital: </label>
                            <select name="hospital_id" class="input">
                                <?php
                                foreach (Hospital::fetchAll() as $hospital) {
                                    if ($hospital->getId() == $donor->getHospitalId()) {
                                        echo "<option value='" . $hospital->getId() . "' selected>" . $hospital->getName() . "</option>";
                                    } else {
                                        echo "<option value='" . $hospital->getId() . "'>" . $hospital->getName() . "</option>";
                                    }
                                }
                                ?>
                            </select>
                        </td>
                        <td>
                            <label for="submit" class="pr-5">Edit: </label>
                            <button type="submit" name="submit" class="button large blue --jb-modal"
                                data-target="sample-modal-2">
                                <span class="icon"><i class="fa-solid fa-pen-to-square"></i></span>
                            </button>
                        </td>
                    </tr>
                </form>
            </tbody>
        </table>
        <?php
        require_once "./partials/footer.php";