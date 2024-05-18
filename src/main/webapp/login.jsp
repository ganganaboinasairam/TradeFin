<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
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
    input[type="password"],
    input[type="submit"],
    .signup-btn {
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
    .signup-btn {
        background-color: #008CBA;
        color: white;
        border: none;
        cursor: pointer;
    }
    .signup-btn:hover {
        background-color: #005f7f;
    }
</style>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script src="login.js"></script>
</head>
<body>
    <div class="container">
    	<%
		    String successMessage = (String) request.getAttribute("successMessage");
		    if (successMessage != null && !successMessage.isEmpty()) {
		%>
		    <div class="success-message">
		        <%= successMessage %>
		    </div>
		<%
		    }
		%>
    	
        <h2>Login</h2>
        <form action="LoginServlet" method="post" onsubmit="return validateForm()">
	    <label for="username">Username:</label>
	    <input type="text" id="username" name="username" required><br><br>
	    <label for="password">Password:</label>
	    <input type="password" id="password" name="password" required><br><br>
	    <div class="g-recaptcha" data-sitekey="6Lcyr6MpAAAAAG4HKQWJPxFI5nqnp3gbbVLcRB7R"></div><br><br>
	    <input type="submit" value="Login">
		</form>
        <button class="signup-btn" onclick="window.location.href='signup.jsp'">Sign Up</button>
    </div>
</body>
</html>
