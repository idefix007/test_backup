<?php
<?php
$servername = 'localhost';
$serverUsername = 'root';
$serverPassword = '';
$databasename = 'testdb';

$username = $_POST['username'];
$password = $_POST['password']

try
{
    $conn = new PDO("mysql:host=".$servername.";port=3308;dbname=".$databasename, $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully";
}
catch(PDOException $e)
{
    echo "Connection failed: " . $e->getMessage();
}

?>