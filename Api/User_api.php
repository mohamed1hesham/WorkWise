<?php

header("Access-Control-Allow-Origin: *");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'];

    switch ($action) {
        case 'INSERT_USER':
            insertUser();
            break;
        case 'CHECK_USER':
            checkUser();
            break;
        default:
            echo "Invalid action";
            break;
    }
}

function insertUser() {
    $servername = "localhost";
    $username = "id21923587_users";
    $password = "123Mm@#8";
    $dbname = "id21923587_user_database";
    $table = "users";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $firstName = $_POST["first_name"];
    $lastName = $_POST["last_name"];
    $country = $_POST["country"];
    $city = $_POST["city"];
    $idNumber = $_POST["id_number"];
    $nationalId = $_POST["national_id"];
    $password = $_POST["password"];
    $job = $_POST["job"];
    $userType = $_POST["user_type"];

    $sql = "INSERT INTO $table (national_id, first_name, last_name, country, city, id_number, password, job, user_type)
            VALUES ('$nationalId', '$firstName', '$lastName', '$country', '$city', '$idNumber', '$password', '$job', '$userType')";

    if ($conn->query($sql) === TRUE) {
        echo "User inserted successfully";
    } else {
        echo "Error inserting user: " . $conn->error;
    }

    $conn->close();
}

function checkUser() {
    $servername = "localhost";
    $username = "id21923587_users";
    $password = "123Mm@#8";
    $dbname = "id21923587_user_database";
    $table = "users";

    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $nationalId = $_POST["national_id"];
    $password = $_POST["password"];
    $sql = "SELECT * FROM $table WHERE national_id='$nationalId' AND password='$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // User exists, fetch user type
        $row = $result->fetch_assoc();
        $userType = $row["user_type"];

        // Return success and user type as JSON response
        echo json_encode(array("status" => "success", "user_type" => $userType));
    } else {
        // User not found or invalid credentials
        echo json_encode(array("status" => "failure"));
    }
    $conn->close();
}

?>
