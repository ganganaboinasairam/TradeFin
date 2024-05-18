package com.telsuko;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class testServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Get the parameters from the request
	    int num1 = Integer.parseInt(request.getParameter("num1"));
	    int num2 = Integer.parseInt(request.getParameter("num2"));
	    
	    // Perform addition
	    int sum = num1 + num2;
	    
	    // Set the response content type
	    response.setContentType("text/plain");

	    // Get the PrintWriter
	    PrintWriter out = response.getWriter();

	    // Write the response
	    out.println(num1 + " + " + num2 + " = " + sum);

	    // Close the PrintWriter
	    out.close();
	}

}
