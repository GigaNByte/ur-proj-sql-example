<header>
    <nav id="navbar-main" class="navbar is-fixed-top">

        <div class="navbar-menu" id="navbar-menu">
            <div class="navbar-start">
                <a href="index.php" class="navbar-item has-divider">
                    <span class="icon"> <i class="fa-solid fa-droplet  text-2xl text-rose-700"></i></span>
                    <span class="text-2xl text-rose-700 font-bold ">BloodDb App</span>
                </a>
            </div>
            <div class="navbar-end">
                <a href="https://github.com/GigaNByte/ur-proj-sql-example" class="navbar-item has-divider">
                    <span class="icon"><i class="fa-solid fa-question-circle text-rose-700"></i></span>
                    <span>About</span>
                </a>
                <a href="https://github.com/GigaNByte/ur-proj-sql-example" class="navbar-item has-divider">
                    <span class="icon"><i class=" fab fa-github text-rose-700"></i></span>
                    <span class="">GitHub</span>
                </a>
            </div>
        </div>
    </nav>


</header>
<main class="section main-section">

    <?php
    if (isset($_SESSION['status'])) {
    ?>
    <div class="card">
        <div class="card-content">
            <div class="flex items-center justify-between">
                <div class="widget-label text-red">
                    <h3>
                        <?php echo $_SESSION['status'] ?>
                    </h3>

                </div>
                <span class="icon widget-icon text-pink"><i class="mdi mdi-account-multiple mdi-48px"></i></span>
            </div>
        </div>
    </div>
    <?php
        unset($_SESSION['status']);
    } ?>