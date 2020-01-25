<?php
include 'conn.php';

$nom=$_POST['nom'];
$prenom=$_POST['prenom'];
$societe=$_POST['societe'];

$sql ="INSERT INTO client (nom,prenom,societe) VALUES (?,?,?)";
$stmt=$conn->prepare($sql);
$stmt->execute([$nom,$prenom,$societe]);
$last_id = $conn->lastInsertId();

$fk_users=$_POST['fkuser'];
$prixVente=$_POST['prixVente'];
$prixAchat=$_POST['prixAchat'];

$sql="INSERT INTO user_client (fk_users, fk_clients, prixVente, prixAchat) VALUES (?,?,?,?)";
$stmt=$conn->prepare($sql);
$stmt->execute([$fk_users,$last_id,$prixVente,$prixAchat]);


?>