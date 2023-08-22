<?php
session_start();

require_once "config.php";

if($_SERVER['REQUEST_METHOD'] == 'POST'){

$username=$_POST["username"];

$password=$_POST["psw"];
$sql="SELECT * FROM lOGIN_INFO WHERE (username='$username') AND (psw='$password')";
$result=$conn->query($sql);


if ($result->num_rows==1) {
    $_SESSION["LOGGED_IN"]=TRUE;

    echo "LOGIN sucessful";

}else{
    echo "LOGIN FALIED";
}
}
$conn->close();	
?>