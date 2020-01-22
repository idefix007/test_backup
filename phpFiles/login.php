<?php

include 'conn.php';

$username = $_POST['username'];
$password = $_POST['password'];

$sql = "SELECT * FROM users WHERE username = BINARY '".$username."' && Password = BINARY '".$password."'";

try {

    $result = $conn->query($sql);

    $resultArray = array();

    while($fetchdata = $result->fetch(PDO::FETCH_ASSOC)){
        $resultArray = $fetchdata;
    }

} catch (Exception $e) {
    die ($e->getMessage() );
}

echo json_encode($resultArray);

?>