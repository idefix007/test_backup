<?php
include 'conn.php';

$id=$_POST['clientid'];

$sql = "DELETE FROM user_client WHERE id='".$id."'";
$conn->exec($sql);




?>