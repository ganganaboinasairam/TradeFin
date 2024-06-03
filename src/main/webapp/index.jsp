<% 
    HttpSession session2 = request.getSession(false);
    if (session2 == null || session2.getAttribute("username") == null) {
        response.sendRedirect("login.jsp"); // Redirect to login page if not logged in
        return; // Stop further processing of the JSP page
    }
    String username = (String) session2.getAttribute("username");
    String imageUrl = (String) session2.getAttribute("imageUrl"); // Assuming you store the image URL in session
    if (imageUrl == null || imageUrl.isEmpty()) {
        imageUrl = "https://telugurajyam.com/wp-content/uploads/2023/03/Sai-Pallavi-1.webp"; // Default image URL
    }
    // Assuming the unique ID is generated or retrieved here
    String uniqueId = "12345"; // Replace this with actual logic to retrieve or generate the unique ID
%>
<!DOCTYPE html>
<html>
<head>
    <title>Unicorn Survey</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="header">
        <div class="left">Unicorn</div>
        <div class="right">
            <span>Welcome, <%= username %>!</span>
            <img src="<%= imageUrl %>" alt="User Image" width="50" height="50"> <!-- User image -->
            <a href="logout.jsp">Logout</a> <!-- Assuming you have a logout page or servlet -->
        </div>
    </div>
    <div class="content" id="notesContainer">
        <!-- Existing notes will be added here -->
    </div>
    <form action="RedirectServlet" method="get">
        <input type="hidden" name="id" value="<%= uniqueId %>">
    </form>
    <script src="index.js"></script>
</body>
</html>
