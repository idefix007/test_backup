<?php
include 'conn.php';

$id=$_POST['id'];

$sql="SELECT client.nom,user_client.prixVente,user_client.prixAchat from user_client join client on user_client.fk_clients=client.client_id join users on user_client.fk_users=users.Id where users.id = '".$id."'";


try {

   $result = $conn->query($sql);
$resultArray = array();

    while($fetchdata = $result->fetchAll(PDO::FETCH_ASSOC)){
        $resultArray = $fetchdata;

    }

} catch (Exception $e) {
    die ($e->getMessage() );
}

echo json_encode($resultArray);

?>