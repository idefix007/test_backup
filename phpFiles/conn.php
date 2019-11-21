<?php
$connect = new mysqli("localhost","root","root","testdb");

if($connect){

}else{
    echo "La connexion a échoué";
    exit();
}