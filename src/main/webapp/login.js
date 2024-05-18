window.onload = function() {
            document.getElementById("username").value = "";
            document.getElementById("password").value = "";
        };


function validateForm() {
    var response = grecaptcha.getResponse();
    if (response.length == 0) {
        alert("Please complete the reCAPTCHA");
        return false;
    }
    return true;
}
