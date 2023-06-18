<?php
    // Generate OTP (e.g., a random 6-digit number)
    $otp = rand(100000, 999999);

    // Store the OTP in the session for verification later
    session_start();
    $_SESSION['otp'] = $otp;

    // Send the OTP to the user's email address
    $to = $_POST['email'];
    $subject = "Password Reset OTP";
    $message = "Your OTP is: " . $otp;
    $headers = "From: your_email@example.com";

    if (mail($to, $subject, $message, $headers)) {
        // OTP sent successfully, redirect the user to the OTP verification page
        header("Location: verify_otp.php");
        exit();
    } else {
        // Failed to send OTP, display an error message or redirect the user back to the forgot password page
        echo "Failed to send OTP. Please try again.";
    }
?>
