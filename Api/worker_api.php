<?php
$servername = "localhost";
$username = "id21923587_users";
$password = "123Mm@#8";
$dbname = "id21923587_user_database";
$table = "worker";

// إنشاء اتصال
$conn = new mysqli($servername, $username, $password, $dbname);

// التحقق من الاتصال
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// إذا كانت الفعل هو إنشاء الجدول
if (isset($_POST["action"]) && $_POST["action"] == "CREATE_TABLE_LOGIN") {
    $sql = "CREATE TABLE IF NOT EXISTS $table (
        first_name VARCHAR(30) NOT NULL,
        last_name VARCHAR(30) NOT NULL,
        country VARCHAR(50) NOT NULL,
        city VARCHAR(50) NOT NULL,
        id_number VARCHAR(11) NOT NULL,
        national_id VARCHAR(14) NOT NULL PRIMARY KEY, -- تعريف الـ National ID كمفتاح أساسي
        jop_worker VARCHAR(50) NOT NULL,
        password VARCHAR(255) NOT NULL
    )";

    if ($conn->query($sql) === TRUE) {
        echo "Table created successfully";
    } else {
        echo "Error creating table: " . $conn->error;
    }
}

// إذا كانت الفعل هو إدراج بيانات مستخدم جديد
if (isset($_POST["action"]) && $_POST["action"] == "INSERT_USER") {
    $firstName = $_POST["first_name"];
    $lastName = $_POST["last_name"];
    $country = $_POST["country"];
    $city = $_POST["city"];
    $idNumber = $_POST["id_number"];
    $nationalId = $_POST["national_id"]; // تخزين قيمة الـ National ID
    $jop = $_POST["jop_worker"];
    $password = $_POST["password"];
    
    $sql = "INSERT INTO $table (first_name, last_name, country, city, id_number, national_id, jop_worker, password)
            VALUES ('$firstName', '$lastName', '$country', '$city', '$idNumber', '$nationalId', '$jop', '$password')";

    if ($conn->query($sql) === TRUE) {
        echo "User inserted successfully";
    } else {
        echo "Error inserting user: " . $conn->error;
    }
}

// إغلاق الاتصال
$conn->close();
?>
