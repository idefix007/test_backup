<?php
$serverName = 'localhost';
$serverUsername = 'root';
$serverPassword = '';
$databaseName = 'testdb';

try
{
    $conn = new PDO("mysql:host=".$serverName.";port=3308;dbname=".$databaseName, $serverUsername, $serverPassword);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully";
}
catch(PDOException $e)
{
    echo "Connection failed: " . $e->getMessage();
}

?>
//NnkQ2x2R27mC