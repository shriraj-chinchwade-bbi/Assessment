<?php 

//$hostname="localhost";
//$username="root";
//$password="root";
//$database="registered";

//$conn=new mysqli($hostname,$username,$password,$database);
//if($conn->connect_error){
//    die("connection failed: " . $conn->connect_error);
//}


// define("DB_SERVER", "localhost:8850");

// define("DB_USERNAME", "root");

// define("DB_PASSWORD", "root");
// define("DB_NAME", "registered");


// # Connection
// $link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
// echo $link;
// # Check connection
// if (!$link) {
//   die("Connection failed: " . mysqli_connect_error());
// }


  $db_host = 'localhost:8850';
  $db_user = 'root';
  $db_password = 'root';
  $db_db = 'registered';
 
  $mysqli = @new mysqli(
    $db_host,
    $db_user,
    $db_password,
    $db_db
  );
	
  if ($mysqli->connect_error) {
    echo 'Errno: '.$mysqli->connect_errno;
    echo '<br>';
    echo 'Error: '.$mysqli->connect_error;
    exit();
  }

  echo 'Success: A proper connection to MySQL was made.';
  echo '<br>';
  echo 'Host information: '.$mysqli->host_info;
  echo '<br>';
  echo 'Protocol version: '.$mysqli->protocol_version;

  $mysqli->close();

 
?>