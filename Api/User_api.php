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
        case 'CHECK_PHONE_NUMBER':
            checkPhoneNumber(); // هنا نقوم بتضمين الدالة الجديدة
            break;
        case 'GET_USER_INFO': // إضافة العملية للحصول على معلومات المستخدم
            getUserInfo();
            break;
        default:
            echo json_encode(array("status" => "failure", "error" => "Invalid action"));
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
    $createTableQuery = "CREATE TABLE IF NOT EXISTS $table (
        national_id VARCHAR(30) PRIMARY KEY NOT NULL,
        first_name VARCHAR(30) NOT NULL,
        last_name VARCHAR(30) NOT NULL,
        country VARCHAR(50) NOT NULL,
        city VARCHAR(50),
        id_number VARCHAR(30),
        password VARCHAR(255) NOT NULL,
        job VARCHAR(100),
        user_type VARCHAR(50) NOT NULL
    )";

    if ($conn->query($createTableQuery) !== TRUE) {
        echo "Error creating table: " . $conn->error;
    }

    // Check if phone number already exists
    $phoneNumber = $_POST["phone_number"];
    $existingNationalId = checkPhoneNumber($phoneNumber); // تم استدعاء الدالة مع رقم الهاتف

    if ($existingNationalId !== null) {
        echo json_encode(array("status" => "failure", "error" => "Phone number already exists for user with national ID: $existingNationalId"));
    } else {
        echo json_encode(array("status" => "success", "message" => "Phone number is available for registration"));
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

// هنا نقوم بنقل الدالة المستدعاة checkPhoneNumber من الصفحة الجديدة ووضعها هنا
function checkPhoneNumber() {
    $servername = "localhost";
    $username = "id21923587_users";
    $password = "123Mm@#8";
    $dbname = "id21923587_user_database";
    $table = "users";

    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $idNumber = $_POST["id_number"]; 
    $nationalId = $_POST["national_id"];
    $newPassword = $_POST["new_password"]; // استقبال المعامل newPassword

    $sql = "SELECT * FROM $table WHERE id_number='$idNumber' AND national_id='$nationalId' "; 
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // رقم الهاتف موجود
        // تحديث حقل كلمة المرور
        $updateSql = "UPDATE $table SET password='$newPassword' WHERE id_number='$idNumber' AND national_id='$nationalId'";
        if ($conn->query($updateSql) === TRUE) {
            echo json_encode(array("status" => "success", "message" => "Password updated successfully"));
        } else {
            echo json_encode(array("status" => "failure", "error" => "Error updating password: " . $conn->error));
        }
    } else {
        // رقم الهاتف غير موجود
        echo json_encode(array("status" => "failure", "error" => "Phone number not found"));
    }

    $conn->close();
}

function getUserInfo() {
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
    $idNumber = $_POST["id_number"];
    $sql = "SELECT * FROM $table WHERE national_id='$nationalId' AND id_number='$idNumber'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // المستخدم موجود في نفس الصف
        $row = $result->fetch_assoc();
        // إرجاع بيانات المستخدم كـ JSON
        echo json_encode(array(
            "status" => "success",
            "user_info" => $row
        ));
    } else {
        // المستخدم غير موجود أو كلمة المرور غير صحيحة
        echo json_encode(array(
            "status" => "failure",
            "error" => "User not found or invalid credentials"
        ));
    }

    $conn->close();
}



?>

