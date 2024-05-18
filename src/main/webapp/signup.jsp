<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f1f1f1;
    }
    .container {
        width: 50%;
        margin: 100px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    h2 {
        text-align: center;
    }
    label {
        display: block;
        margin-bottom: 5px;
    }
    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="submit"] {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        box-sizing: border-box;
    }
    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
    .error {
            color: red;
        }
</style>
<script src="signup.js"></script>
</head>
<body>
    <div class="container">
        <h2>Sign Up</h2>
        <form action="signupServlet" method="post" autocomplete="off" enctype="multipart/form-data" onsubmit="return validateForm()">
            <label for="username">User name:</label>
            <input type="text" id="username" name="username"  required onchange="validateUsername()">
			<span id="usernameError" class="error"></span>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required onchange="validateEmail()">
			<span id="emailError" class="error"></span>
			<label for="userImage">Profile:</label>
			<input type="file" name="userImage" id="userImage">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required onchange="validatePassword()">
			<span id="passwordError" class="error"></span>
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required onchange="validateConfirmPassword()">
			<span id="confirmPasswordError" class="error"></span>
            <input type="submit" value="Sign Up">
        </form>
    </div>
</body>
</html>
