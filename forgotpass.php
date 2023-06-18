<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;

require 'vendor/autoload.php';

// Function to generate a random password
function generateRandomPassword($length = 8) {
    $characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    $password = '';
    for ($i = 0; $i < $length; $i++) {
        $index = random_int(0, strlen($characters) - 1);
        $password .= $characters[$index];
    }
    return $password;
}

// Function to encrypt the password using MD5
function encryptPassword($password) {
    return md5($password);
}

session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];

    // Generate a random password
    $newPassword = generateRandomPassword();

    // Encrypt the password
    $encryptedPassword = encryptPassword($newPassword);

    // Update the encrypted password in the signup table for the given email
    // Replace the following code with your database update logic
    // Example using MySQLi:
    $conn = mysqli_connect("localhost", "root", "", "profile_builder");
    // Check connection
    if (mysqli_connect_errno()){
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }

    // Check the connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Prepare and execute the update query
    $sql = "UPDATE signup SET pass = '$encryptedPassword' WHERE email = '$email'";
    if ($conn->query($sql) === true) {
        // Password updated successfully

        // Send the new password via email
        $mail = new PHPMailer();
        $mail->isSMTP();
        $mail->SMTPDebug = SMTP::DEBUG_OFF;
        $mail->Host = 'smtp.gmail.com';
        $mail->Port = 465;
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
        $mail->SMTPAuth = true;
        $mail->Username ='ww.workwise@gmail.com'; // Replace with your Gmail address
        $mail->Password ='gpkarkqihksninqu'; // Replace with your Gmail password
        $mail->setFrom('ww.workwise@gmail.com','workwise'); // Replace with your name and Gmail address
        $mail->addAddress($email);
        $mail->isHTML(true);
        $mail->Subject = 'New Password';
        $mail->Body = 'Your new password is: ' . $newPassword;

        if ($mail->send()) {
            echo 'Message sent! Check your email for the new password.';
        } else {
            echo 'Failed to send email.';
        }
    } else {
        echo 'Failed to update password.';
    }

    // Close the database connection
    $conn->close();
}
?>

<!DOCTYPE html>

<html>
<head>
    <title>Forgot Password</title>
    <head>
    <meta charset="utf-8"/>
    <title>Login</title>
    <style>

        *{
            margin: 0;
            padding: 0;
            
        }
        body{
            background-image: linear-gradient(rgba(0, 0, 0, 0.1),rgba(0, 0, 0, 0.1)),url("https://media.licdn.com/dms/image/C5612AQEZGZ_ccnoedw/article-cover_image-shrink_600_2000/0/1520079527994?e=2147483647&v=beta&t=dPGPfcZoAzgIuN8CYMnbCT3vXKzacevAa4izGzEX6sI");
            background-position: center;
            background-size: cover;
            height: 100vh;
            position: relative;
            font-family: sans-serif;
            font-size: 20PX;
        }
        .login-box{
            width: 500px;
            height: 500px;
            background: rgb(0, 0, 0);
            color: #fff;
            top: 40%;
            left: 25%;
            position: absolute;
            transform: translate(-50%,-50%);
            box-sizing: border-box;
            padding: 70px 30px;
        }
        .dp{
            width: 100px;
            height: 100px;
            border-radius: 50%;
            position: absolute;
            top: -50px;
            left: 125px;
        }
        h1{
            margin: 0;
            padding: 0 0 20px;
            text-align: center;
            font-size: 22px;
        }
        .login-box p{
            margin: 0;
            padding: 0;
            font-weight: bold;
        }
        .login-box input{
            width:100%;
            margin-bottom:20px;    
        }
        .login-box input[type="text"], input[type="email"]
        {
            border:none;
            border-bottom: 1px solid #fff;
            background:white;
            outline: none;
            height: 40px;
            color: #fff;
            font-size: 14px;
        }
        .login-box input[type="submit"]
        {
            border: none;
            outline: none;
            height: 40px;
            background:#0066b2;
            color:#fff;
            font-size: 18PX;
            border-radius: 20px;    
        }
        .login-box input[type="submit"]:hover
        {
            cursor: pointer;
            background: #ffffff;
            color: #000;
        }
        .login-box a{
            font-size: 13px;
            line-height: 20px;
            color: darkgrey;
        }
        .login-box a:hover{
            color : #07c5ff;
        }

    </style>
</head>
</head>
<body>
    
    <div class=login-box>
    <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Forgot Password</h2><br>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <label for="email">Enter Your Email:</label><br><br>
        <input type="email" name="email" id="email" required>
        <br><br>
        <input type="submit" value="Submit">
    </form>
    </div>
</body>
</html>