<!DOCTYPE html>
<html>
<head>
    <title>Addition</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <h1>Addition</h1>
    <input type="text" id="num1" placeholder="Enter number 1"><br><br>
    <input type="text" id="num2" placeholder="Enter number 2"><br><br>
    <button onclick="addNumbers()">Add</button><br><br>
    <div id="result"></div>

    <script>
        function addNumbers() {
            var num1 = $("#num1").val();
            var num2 = $("#num2").val();

            $.ajax({
                type: "POST",
                url: "testServlet",
                data: { num1: num1, num2: num2 },
                success: function(response) {
                    $("#result").html(response);
                }
            });
        }
    </script>
</body>
</html>
