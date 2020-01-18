<?php

include 'conn.php';

$username = $_POST['username'];
$password = $_POST['password'];



$sql = "SELECT * FROM users WHERE username = '".$username."' && Password = '".$password."'";

try {
    $result = $conn->query($sql);

    $rows = $result->rowCount();

    $resultArray = array();
    if($rows>0){
        while($row = $result->fetch()) {
            for($i=0; $i<3; $i++)
                {
                    array_push($resultArray, $row[$i]);
                }
        }

    }else {
        echo "0 results";
    }
} catch (Exception $e) {
    die ($e->getMessage() );
}

?>