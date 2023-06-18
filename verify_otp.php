<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Verify OTP</title>
    <style>
        /* Add your CSS styles here */
    </style>
</head>
<body>
    <h1>Verify OTP</h1>
    <form method="post" action="update_password.php">
        <label for="otp">Enter OTP:</label>
        <input type="text" name="otp" required>
        <br>
        <label for="new_password">Enter New Password:</label>
        <input type="password" name="new_password" required>
        <br>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
