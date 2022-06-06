<?php



require_once 'core.php';
require_once "./partials/head.php";





//fetch patient by id using Patient static method and assign to $patient
$patient = Patient::fetchById($_GET['id']);
//create edit form of patient and wrap every label and input in div
?>
<div class="card has-table my-5">
    <header class="card-header">
        <p class="card-header-title">
            <span class="icon"><i class="fa-solid fa-user"></i></span>
            Edit Patient
        </p>
    </header>
    <div class="card-content">
        <table>
            <thead>

            </thead>
            <tbody>

                <form action="updatePatient.php" method="POST">
                    <tr>

                        <input type="hidden" name="id" class="input" value="<?php echo $patient->getId() ?>">

                        <td>
                            <label for="name" class="pr-5">Name: </label>
                            <input type="text" name="name" class="input" placeholder="Name"
                                value="<?php echo $patient->getName() ?>">
                        </td>
                        <td>
                            <label for="surname" class="pr-5">Surname: </label>
                            <input type="text" name="surname" class="input" placeholder="Surname"
                                value="<?php echo $patient->getSurname() ?>">
                        </td>
                        <td>
                            <label for="address" class="pr-5">Address: </label>
                            <input type="text" name="address" class="input" placeholder="Address"
                                value="<?php echo $patient->getAddress() ?>">
                        </td>
                    </tr>


                    <tr>
                        <td>
                            <label for="postcode" class="pr-5">Postcode: </label>
                            <input type="text" name="postcode" class="input" placeholder="Postcode"
                                value="<?php echo $patient->getPostcode() ?>">
                        </td>
                        <td>
                            <label for="telephone_number" class="pr-5">Telephone: </label>
                            <input type="text" name="telephone_number" class="input" placeholder="Telephone Number"
                                value="<?php echo $patient->getTelephone() ?>">
                        </td>

                    </tr>

                    <tr>
                        <td>

                            <label for="hospital_id" class="pr-5">Hospital: </label>
                            <select name="hospital_id" class="input">
                                <?php
                                foreach (Hospital::fetchAll() as $hospital) {
                                    if ($hospital->getId() == $patient->getHospitalId()) {
                                        echo "<option value='" . $hospital->getId() . "' selected>" . $hospital->getName() . "</option>";
                                    } else {
                                        echo "<option value='" . $hospital->getId() . "'>" . $hospital->getName() . "</option>";
                                    }
                                }
                                ?>
                            </select>
                        </td>
                        <td>
                            <label for="needed_blood_ml" class="pr-5">Needed Blood Ml</label>
                            <input type="number" name="needed_blood_ml" class="input" placeholder="Blood Needed"
                                value="<?php echo $patient->getNeededBloodMl() ?>">
                        </td>
                        <td>
                            <button class="button large blue --jb-modal" data-target="sample-modal-2">
                                <span class="icon"><i class="fa-solid fa-pen-to-square"></i></span>
                            </button>
                        </td>
                    </tr>
                </form>

            </tbody>
        </table>
        <?php
        require_once "./partials/footer.php";