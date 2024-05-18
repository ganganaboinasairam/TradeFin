<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*" %>
<%@ page language="java" %>
<%
    HttpSession session2 = request.getSession(false);
    if (session2 == null || session2.getAttribute("username") == null) {
        response.sendRedirect("login.jsp"); // Redirect to login page if not logged in
        return; // Stop further processing of the JSP page
    }
    String username = (String) session.getAttribute("username");
    String imageUrl = "https://telugurajyam.com/wp-content/uploads/2023/03/Sai-Pallavi-1.webp"; // Replace this with the actual URL of the user's image
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
            <img src="<%= imageUrl %>" alt="User Image" width="50" height="50" > <!-- User image -->
            <a href="login.jsp">Logout</a>
        </div>
    </div>
    <div class="content" id="notesContainer">
        <!-- Existing notes will be added here -->
    </div>
    <button onclick="createNote()" class="note">New Note</button>
    <script src="index.js"></script>
</body>
</html>
