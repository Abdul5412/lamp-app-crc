<?php
echo "<h1>LAMP App on CRC OpenShift</h1>";
echo "<p>PHP Version: " . phpversion() . "</p>";
echo "<p>Deployed via Jenkins CI/CD</p>";
echo "<p>Time: " . date('Y-m-d H:i:s') . "</p>";
echo "<h2>Version 3.0 - Auto Build Test</h2>";
echo "<p>Today: " . date('l, F j, Y') . "</p>";
echo "<p>Status: Testing Jenkins auto-trigger</p>";
?>
