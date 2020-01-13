<?php

include 'conn.php';

$username1 = $_POST['username'];
$password1 = $_POST['password'];



$sql1 = "SELECT * FROM users WHERE Username = '".$username1."' && Password = '".$password1."'";
try {
    $result1 = $conn->query($sql1);

    $rows = $result1->rowCount();
    if($rows>0){
        while($row = $result1->fetch()) {
            for($i=0; $i<$rows; $i++)
                {
                    $result1[] = $fetchData;
                }
        }

    }else {
        echo "0 results";
    }
} catch (Exception $e) {
    die ($e->getMessage() );
}

echo json_encode($result1);

?>