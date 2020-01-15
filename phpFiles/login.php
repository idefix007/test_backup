<?php

include 'conn.php';

$username = $_POST['username'];
$password = $_POST['password'];



$sql = "SELECT * FROM users WHERE username = '".$username."' && Password = '".$password."'";
try {
    $result = $conn->query($sql);

    $rows = $result->rowCount();
    if($rows>0){
    $resultArray = array();
        while($row = $result->fetch()) {
            for($i=0; $i<$rows; $i++)
                {
                    array_push$result1($resultArray, $row[$i]);
                }
        }

    }else {
        echo "0 results";
    }
} catch (Exception $e) {
    die ($e->getMessage() );
}

echo json_encode($resultArray);

?>