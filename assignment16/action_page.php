<?php
require_once "./config.php";

if($_SERVER['REQUEST_METHOD'] == 'POST'){
$firstname=$_POST["firstname"];
$lastname=$_POST["lastname"];
$username=$_POST["username"];
$phone=$_POST["phone"];
$password=$_POST["password"];
$sql="INSERT INTO lOGIN_INFO (firstname ,lastname ,username , phone, password) VALUES ('$firstname','$lastname','$username','$phone','$password')";

if ($conn->query($sql) === TRUE) {
    echo "Registeration sucessful";

}else{
    echo "error: " . $sql . "<br>" . $conn->error;
}
}
$conn->close();	
?>