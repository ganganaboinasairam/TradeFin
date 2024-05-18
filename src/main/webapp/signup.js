window.onload = function() {
            setTimeout(clearFields,500);
        };

function clearFields(){
	document.getElementById("username").value = "";
    document.getElementById("password").value = "";
}
// Username validation
function validateUsername() {
    var username = document.getElementById("username").value;
    if (username.trim().length < 5) {
        document.getElementById("usernameError").innerText = "Username must be at least 5 characters";
        return false;
    } else {
        document.getElementById("usernameError").innerText = "";
        return true;
    }
}

// Email validation
function validateEmail() {
    var email = document.getElementById("email").value;
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
        document.getElementById("emailError").innerText = "Invalid email address";
        return false;
    } else {
        document.getElementById("emailError").innerText = "";
        return true;
    }
}

// Password validation
function validatePassword() {
    var password = document.getElementById("password").value;
    var strongPasswordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    if (!strongPasswordPattern.test(password)) {
        document.getElementById("passwordError").innerText = "Password must be at least 8 characters long and contain at least one lowercase letter, one uppercase letter, one number, and one special character";
        return false;
    } else {
        document.getElementById("passwordError").innerText = "";
        return true;
    }
}

// Confirm password validation
function validateConfirmPassword() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    if (password != confirmPassword) {
        document.getElementById("confirmPasswordError").innerText = "Passwords do not match";
        return false;
    } else {
        document.getElementById("confirmPasswordError").innerText = "";
        return true;
    }
}

function validateForm() {
    var isUsernameValid = validateUsername();
    var isEmailValid = validateEmail();
    var isPasswordValid = validatePassword();
    var isConfirmPasswordValid = validateConfirmPassword();
    return isUsernameValid && isEmailValid && isPasswordValid && isConfirmPasswordValid;
}
