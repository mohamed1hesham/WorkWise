<?php
$servername = "localhost";
$username = "id21923587_users";
$password = "123Mm@#8";
$dbname = "id21923587_user_database";
$table = "post"; // Create a table named posts

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check Connection
if($conn->connect_error){
    die("Connection Failed: " . $conn->connect_error);
}

if(isset($_POST["action"]) && $_POST["action"] == "CREATE_TABLE_LOGIN"){
    $sql = "CREATE TABLE IF NOT EXISTS $table 
        ( id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(255) NOT NULL,
        password VARCHAR(255) NOT NULL
        )";
    
    if ($conn->query($sql) === TRUE) {
        echo "Table created successfully";
    } else {
        echo "Error creating table: " . $conn->error;
    }
}

if(isset($_POST["action"]) && $_POST["action"] == "INSERT_USER_CREDENTIALS"){
    $username = $_POST["username"];
    $password = $_POST["password"];
    $sql = "INSERT INTO $table (username, password) VALUES ('$username', '$password')";
    
    if ($conn->query($sql) === TRUE) {
        echo "User credentials inserted successfully";
    } else {
        echo "Error inserting user credentials: " . $conn->error;
    }
}

// Close Connection
$conn->close();
?>
