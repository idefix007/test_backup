<?php

include 'conn.php';

$username = $_POST['username'];
$password = $_POST['password'];

$queryResult=$connect->query(
    "SELECT * FROM users WHERE username=' ".$username."' AND password='".$password."' "
);

$result=array();

while($fecthData=$queryResult->fetch_assoc()){
    $result[]=$fecthData;
}

echo json_encode($result);

?>