<!DOCTYPE html>
<html>
<head>
    <title>Main Page</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            display: flex;
            height: 100%;
        }
        iframe {
            border: none;
        }
        #menuFrame {
            width: 200px;
            height: 100%;
        }
        #mainFrame {
            flex: 1;
            height: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <iframe id="menuFrame" src="menu.jsp"></iframe>
        <iframe id="mainFrame" src="index.jsp"></iframe>
    </div>
</body>
</html>
