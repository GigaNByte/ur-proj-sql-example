<?php

require_once 'core.php';
//create html markup for header 
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Blooddb App</title>


    <script src="https://cdn.tailwindcss.com"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Font awesome cdn-->
    <script>
    tailwind.config = {
        theme: {
            extend: {
                colors: {
                    'pink': '#c9007d',
                    'lightpink': '#FFD6EF',
                    'darky': '#520035'
                },
                zIndex: {
                    '-1': '-1',
                },
                flexGrow: {
                    '5': '5'
                }
            }
        }
    }
    </script>

    <style type="text/tailwindcss">
        @layer components {
            .icon {
  @apply inline-flex justify-center items-center w-6 h-6;
}

.icon.widget-icon {
  @apply w-20 h-20;
}

.icon.large {
  @apply w-12 h-12;
}

.icon i {
  @apply inline-flex;
}

    .navbar, .navbar-menu, .navbar-start, .navbar-end {
        @apply flex items-stretch;
    }

    .navbar {
        @apply top-0 left-0 right-0 fixed flex bg-white h-14 border-b border-gray-100 z-30 w-screen transition-all
      w-auto;
    }

    .navbar-brand {
        @apply  items-stretch flex h-14;
    }


    .navbar-brand .navbar-item {
        @apply items-center flex;
    }

    .navbar-item, .navbar-link {
        @apply block py-2 px-3;
    }

    .navbar-item {
        @apply flex-grow-0 flex-shrink-0 relative flex items-center;
    }

    .navbar-item.mobile-aside-button {
        @apply lg:hidden;
    }

    .navbar-item.has-divider {
        @apply lg:border-r lg:border-gray-100;
    }

    .navbar-item > .navbar-link {
        @apply bg-gray-100 lg:bg-transparent;
    }

    .navbar-item .icon + span {
        @apply ml-2;
    }

    .navbar-item.has-user-avatar > .navbar-link {
        @apply flex items-center;
    }

    .navbar-item.has-user-avatar .user-avatar {
        @apply w-6 h-6 mr-3 inline-flex;
    }

    .navbar-item.dropdown {
        @apply p-0 lg:py-2 lg:px-3;
    }

    .navbar-item.dropdown > .navbar-link .icon:last-child {
        @apply inline-flex;
    }


    .navbar-item .input {
        @apply border-0;
    }

    .navbar-menu {
        max-height: calc(100vh - 3.5rem);
        @apply  w-screen top-14 left-0 bg-white  
        flex flex-grow static border-b-0 overflow-visible shadow-none;
    }

    .navbar-menu.active {
        @apply block;
    }

    .navbar-end {
        @apply justify-end ml-auto;
    }

    .navbar-item .navbar-dropdown {
        @apply text-sm lg:border-gray-200 lg:border-t-2
        lg:bg-white lg:absolute lg:top-full lg:left-0 lg:min-w-full lg:z-20 lg:shadow-md lg:rounded-b;
    }

    .navbar-item:not(.active) .navbar-dropdown {
        @apply lg:hidden;
    }

    .navbar-item.active:not(.dropdown), .navbar-item.active.dropdown > .navbar-link {
        @apply text-blue-500;
    }
    footer {
    @apply bg-white py-2 px-6;
    }
    .card {
    @apply bg-white border border-gray-100 rounded;
    }

    .card.has-table .card-content {
    @apply p-0;
    }

    .card-content {
    @apply p-6;
    }

    .card-content hr {
    @apply my-6 -mx-6;
    }

    .card.empty .card-content {
    @apply text-center py-12 text-gray-500;
    }

    .card-header {
    @apply flex items-stretch border-b border-gray-100;
    }

    .card-header-title, .card-header-icon {
    @apply flex items-center py-3 px-4;
    }

    .card-header-title {
    @apply flex-grow font-bold ;
    }

    .card-header-icon {
    @apply justify-center;
    }

    .widget-label h3 {
    @apply text-lg leading-tight text-gray-500;
    }

    .widget-label h1 {
    @apply text-3xl leading-tight font-semibold;
    }

    .form-screen .card {
    @apply w-11/12 lg:w-5/12 shadow-2xl rounded-lg;
    }
    .aside {
    @apply w-60 -left-60 fixed top-0 z-40 h-screen bg-darky transition-all lg:left-0;
    }

    .aside-tools {
    @apply flex flex-row w-full bg-gray-900 text-white flex-1 px-3 h-14 items-center;
    }

    .aside-mobile-expanded .aside {
    @apply left-0;
    }

    .aside-mobile-expanded .navbar {
    @apply ml-60;
    }

    .aside-mobile-expanded #app {
    @apply ml-60;
    }

    .aside-mobile-expanded, .aside-mobile-expanded body {
    @apply overflow-hidden lg:overflow-visible;
    }

    .menu-label {
    @apply p-3 text-xs uppercase text-gray-400;
    }

    .menu-list li a {
    @apply py-2 flex text-white;
    }

    .menu-list li > a {
    @apply hover:bg-white hover:text-pink;
    }

    .menu-list li a .menu-item-label {
    @apply flex-grow;
    }

    .menu-list li a .icon {
    @apply w-12 flex-none;
    }

    .menu-list li.active > a {
    @apply bg-white text-pink;
    }

    .menu-list li ul {
    @apply hidden;
    }

    .menu-list li ul a {
    @apply p-3 text-sm;
    }

    .menu-list li.active ul {
    @apply block bg-gray-600;
    }
    .button {
  @apply inline-flex rounded-md hover:bg-pink bg-white text-black border-pink border cursor-pointer justify-center px-4 py-2 text-center
    whitespace-nowrap rounded
    hover:border-gray-500
    focus:outline-none;
}

.button.addon-right {
  @apply rounded-r-none;
}

.button.addon-left {
  @apply rounded-l-none;
}

.button.small {
  @apply text-xs p-1;
}

.button.small.textual {
  @apply px-3;
}

.button.active {
  @apply border-pink hover:border-gray-500;
}

.button.green {
  @apply bg-green-500 border-green-500 text-white hover:bg-green-600;
}

.button.red {
  @apply bg-red-500 border-red-500 text-white hover:bg-red-600;
}

.button.blue {
  @apply bg-blue-500 border-blue-500 text-white hover:bg-blue-600;
}

.button.light {
  @apply bg-gray-100 border-gray-100 hover:bg-gray-200;
}

.buttons {
  @apply flex items-center flex-wrap justify-start;
}

.buttons.nowrap {
  @apply flex-nowrap;
}

.buttons.right {
  @apply justify-end;
}

.buttons .button {
  @apply mx-1;
}
.notification {
  @apply px-3 py-6 rounded;
}

.notification:not(:last-child) {
  @apply mb-6;
}

.notification.blue {
  @apply bg-blue-500 text-white;
}

.notification.green {
  @apply bg-green-500 text-white;
}

.notification.red {
  @apply bg-red-500 text-white;
}
.is-title-bar {
  @apply p-6 border-b border-gray-100;
}

.is-title-bar li {
  @apply inline-block pr-3 text-2xl text-gray-500;
}

.is-title-bar li:not(:last-child):after {
  content: '/';
  @apply inline-block pl-3;
}

.is-title-bar li:last-child {
  @apply pr-0 text-pink;
}
.modal {
  @apply hidden items-center flex-col justify-center overflow-hidden fixed inset-0 z-40;
}

.modal.active {
  @apply flex;
}

.modal-background {
  @apply absolute inset-0 bg-gray-900 bg-opacity-80;
}

.modal-card {
  max-height: calc(100vh - 160px);
  @apply w-full flex flex-col overflow-hidden relative
    lg:mx-auto lg:w-2/5;
}

.modal-card-body {
  @apply bg-white flex-grow flex-shrink overflow-auto p-6 space-y-2;
}

.modal-card-head, .modal-card-foot {
  @apply flex items-center flex-shrink-0 justify-start px-6 py-4 relative bg-gray-100 border-gray-200;
}

.modal-card-head {
  @apply border-b rounded-t;
}

.modal-card-foot {
  @apply border-t rounded-b;
}

.modal-card-foot .button:not(:last-child) {
  @apply mr-2;
}
body {
  @apply bg-gray-50 text-base pt-14 lg:pl-60;
}

#app {
  @apply w-screen transition-all lg:w-auto;
}

.main-section {
  @apply p-6;
}

.dropdown {
  @apply cursor-pointer;
}

.clipped, .clipped body {
  @apply overflow-hidden;
}

.m-clipped, .m-clipped body {
  @apply overflow-hidden lg:overflow-visible;
}

.form-screen body {
  @apply p-0;
}

.form-screen .main-section {
  @apply flex h-screen items-center justify-center;
}
}
table {
  @apply w-full;
}

thead {
  @apply hidden lg:table-header-group;
}

tr {
  @apply max-w-full block relative border-b-4 border-gray-100
    lg:table-row lg:border-b-0;
}

tr:last-child {
  @apply border-b-0;
}

th {
  @apply lg:text-left lg:py-2 lg:px-3;
}

td {
  @apply flex justify-between text-right py-3 px-4 align-top border-b border-gray-100
    lg:table-cell lg:text-left lg:py-2 lg:px-3 lg:align-middle lg:border-b-0;
}

tr:nth-child(odd) td {
  @apply lg:bg-gray-50;
}

td:last-child {
  @apply border-b-0;
}

tbody tr:hover td {
  @apply lg:bg-gray-100;
}

td:before {
  content: attr(data-label);
  @apply font-semibold pr-3 text-left lg:hidden;
}

td.checkbox-cell, th.checkbox-cell {
  @apply lg:w-5;
}

td.progress-cell progress {
  @apply flex w-2/5 self-center
    lg:w-full;
}

td.image-cell {
  @apply border-b-0 lg:w-6;
}

td.image-cell:before, td.actions-cell:before {
  @apply hidden;
}

td.image-cell .image {
  @apply w-24 h-auto mx-auto lg:w-12 ;
}

.table-pagination {
  @apply px-6 py-3;
}


    </style>

</head>

<body class="font-sans antialiased">
    <div id="app" class="min-h-screen bg-gray-100">
        <?php require_once('header.php') ?>
        <aside class="aside is-placed-left is-expanded">
            <div class="flex justify-center p-10 flex-col">
                <i class="fa-solid fa-droplet  text-2xl text-white m-auto"></i>
                <span class="text-2xl text-white font-bold block">BloodDb App</span>
            </div>
            <div class="menu is-menu-main">
                <p class="menu-label">General</p>
                <ul class="menu-list">
                    <li class="active">
                        <a href="./index.php">
                            <span class="icon"><i class="fa-solid fa-chart-line"></i></span>
                            <span class="menu-item-label">Dashboard</span>
                        </a>
                    </li>
                </ul>
                <p class="menu-label">Overview</p>
                <ul class="menu-list">
                    <li class="--set-active-tables-html">
                        <a href="./hospitals.php">
                            <span class="icon"><i class="fa-solid fa-hospital"></i></span>
                            <span class="menu-item-label">Hospitals</span>
                        </a>
                    </li>
                    <li class="--set-active-forms-html">
                        <a href="./patients.php">
                            <span class="icon"><i class="fa-solid fa-bed"></i></span>
                            <span class="menu-item-label">Patients</span>
                        </a>
                    </li>
                    <li class="--set-active-forms-html">
                        <a href="./donors.php">
                            <span class="icon"><i class="fa-solid fa-hospital-user"></i></span>
                            <span class="menu-item-label">Donors</span>
                        </a>
                    </li>
                    <li class="--set-active-forms-html">
                        <a href="./transfusions.php">
                            <span class="icon"><i class="fa-solid fa-file-medical"></i></span>
                            <span class="menu-item-label">Transfusions</span>
                        </a>
                    </li>
                </ul>
                <p class="menu-label">About</p>
                <ul class="menu-list">
                    <li>
                        <a href="https://justboil.me/tailwind-admin-templates/free-dashboard/" class="has-icon">
                            <span class="icon"><i class="fa-solid fa-circle-question"></i></span>
                            <span class="menu-item-label">About Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="https://github.com/GigaNByte/ur-proj-sql-example" class="has-icon">
                            <span class="icon"><i class="fa-brands fa-github"></i></span>
                            <span class="menu-item-label">BloodDb on GitHub</span>
                        </a>
                    </li>
                </ul>
            </div>
        </aside>