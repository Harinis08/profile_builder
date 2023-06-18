<?php
    // Retrieve the OTP entered by the user
    $enteredOTP = $_POST['otp'];

    // Retrieve the stored OTP from the session
    session_start();
    $storedOTP = $_SESSION['otp'];

    // Compare the entered OTP with the stored OTP
    if ($enteredOTP == $storedOTP) {
        // OTP is valid, retrieve the user's email from the session
        $email = $_SESSION['email'];

        // Update the password in the database
        $newPassword = $_POST['new_password'];
        // Perform the database update query here

        // Password reset successful, redirect the user to the login page
        header("Location: login.php");
        exit();
    } else {
        // Invalid OTP, display an error message or redirect the user back to the OTP verification page
        echo "Invalid OTP. Please try again.";
    }
?>
