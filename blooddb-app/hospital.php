<?php



require_once 'core.php';
require_once "./partials/head.php";

//fetch hospital by id using Hospital static method and assign to $hospital
$hospital = Hospital::fetchById($_GET['id']);
//create edit form of hospital and wrap every label and input in div
?>
<div class="card has-table my-5">
    <header class="card-header">
        <p class="card-header-title">
            <span class="icon"><i class="fa-solid fa-user"></i></span>
            Edit Hospital
        </p>
    </header>
    <div class="card-content">
        <table>
            <thead>
            </thead>
            <tbody>

                <form action="updateHospital.php" method="POST">
                    <tr>

                        <input type="hidden" name="id" class="input" value="<?php echo $hospital->getId() ?>">
                        <td>
                            <label for="name" class="pr-5">Name: </label>
                            <input type="text" name="name" class="input" value="<?php echo $hospital->getName() ?>">
                        </td>
                        <td>
                            <label for="district" class="pr-5">District: </label>
                            <input type="text" name="district" class="input"
                                value="<?php echo $hospital->getDistrict() ?>">
                        </td>
                        <td>
                            <label for="address" class="pr-5">Address: </label>
                            <input type="text" name="address" class="input"
                                value="<?php echo $hospital->getAddress() ?>">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="postcode" class="pr-5">Postcode: </label>
                            <input type="text" name="postcode" class="input"
                                value="<?php echo $hospital->getPostcode() ?>">
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