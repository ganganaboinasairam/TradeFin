package com.telsuko;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 3,      // 3MB
                 maxRequestSize = 1024 * 1024 * 5)   // 5MB
public class signupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        System.out.println("//////////////////inside signup servlet//////////////////");
        System.out.println(username + "," + email + "," + password + "," + confirmPassword);

        // Check if passwords match and password is not null
        if (password != null && password.equals(confirmPassword)) {
            Common common = new Common();
            // Store the user data in your database
            common.storeUserData(username, email, password);

            // Set success message attribute
            request.setAttribute("successMessage", "Signup successful! Please login.");
            response.sendRedirect("login.jsp");
        } else {
            // Handle passwords not matching or password being null
            System.out.println("//////////////////password validation failed//////////////////");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
}
