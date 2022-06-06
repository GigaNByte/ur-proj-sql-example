<?php
//create login form
echo "<form action='login.php' method='post'>";
echo "<label>Username:</label>";
echo "<input type='text' name='username'>";
echo "<label>Password:</label>";
echo "<input type='password' name='password'>";
echo "<input type='submit' value='Login'>";
echo "</form>";