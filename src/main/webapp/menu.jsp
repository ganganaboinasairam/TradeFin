<!DOCTYPE html>
<html>
<head>
    <title>Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .menu {
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            background-color: #f4f4f4;
            padding: 20px;
        }
        .menu button {
            padding: 10px;
            margin: 5px 0;
            font-size: 16px;
            cursor: pointer;
            border: 1px solid #ccc;
            background-color: #fff;
            transition: background-color 0.3s;
        }
        .menu button:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <div class="menu">
        <button onclick="loadPage('index.jsp')">Home</button>
        <button onclick="loadPage('createNote.jsp')">Create Note</button>
        <button onclick="loadPage('railLC.jsp')">Rail LC</button>
    </div>
    <script>
        function loadPage(page) {
            parent.document.getElementById('mainFrame').src = page;
        }
    </script>
</body>
</html>
