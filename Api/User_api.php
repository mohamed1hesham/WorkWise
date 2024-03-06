<?php
$servername = "localhost";
$username = "id21923587_users";
$password = "123Mm@#8";
$dbname = "id21923587_user_database";
$table = "users"; // اسم الجدول الذي ترغب في إنشائه

// إنشاء اتصال
$conn = new mysqli($servername, $username, $password, $dbname);

// التحقق من الاتصال
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// إذا كانت الفعل هو إنشاء الجدول
if (isset($_POST["action"]) && $_POST["action"] == "CREATE_TABLE_LOGIN") {
    $sql = "CREATE TABLE IF NOT EXISTS $table (
        national_id VARCHAR(14) PRIMARY KEY, -- تعديل الحقل ليكون المفتاح الأساسي
        first_name VARCHAR(30) NOT NULL,
        last_name VARCHAR(30) NOT NULL,
        country VARCHAR(50) NOT NULL,
        city VARCHAR(50) NOT NULL,
        id_number VARCHAR(11) NOT NULL,
        password VARCHAR(255) NOT NULL,
        job VARCHAR(255) NOT NULL, -- تمت إضافة الحقل هنا
        user_type VARCHAR(20) NOT NULL -- إضافة الحقل هنا
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
    $nationalId = $_POST["national_id"]; // استقبال الرقم القومي الجديد
    $password = $_POST["password"];
    $job = $_POST["job"]; // استقبال الوظيفة الجديدة
    $userType = $_POST["user_type"]; // استقبال نوع المستخدم الجديد
    
    $sql = "INSERT INTO $table (national_id, first_name, last_name, country, city, id_number, password, job, user_type) -- تعديل الترتيب لمطابقة ترتيب الحقول في الجدول
            VALUES ('$nationalId', '$firstName', '$lastName', '$country', '$city', '$idNumber', '$password', '$job', '$userType')";

    if ($conn->query($sql) === TRUE) {
        echo "User inserted successfully";
    } else {
        echo "Error inserting user: " . $conn->error;
    }
}

// إغلاق الاتصال
$conn->close();
?>
