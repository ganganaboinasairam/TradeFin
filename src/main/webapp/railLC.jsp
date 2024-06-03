<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contract Details</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="railLC.js"></script>
</head>
<body>
<%
        String uniqueId = (String) request.getAttribute("uniqueId");
        out.println("Unique ID: " + uniqueId);
    %>
    <h1>Contract Details</h1>
    <label for="CONTRACT_ID">CONTRACT ID:</label>
    <input type="text" id="CONTRACT_ID" name="CONTRACT_ID" />
    <button type="button" onclick="validateContractID()">Get Contract Details</button>
    
    <br><br>
    
    <label for="CONTRACT_NO">CONTRACT NO:</label>
    <input type="text" id="CONTRACT_NO" name="CONTRACT_NO" readonly="readonly" />

    <br><br>
    
    <label for="CONTRACT_DATE">CONTRACT DATE:</label>
    <input type="text" id="CONTRACT_DATE" name="CONTRACT_DATE" readonly="readonly" />

    <br><br>
    
    <label for="CONTRACT_VALUE">CONTRACT VALUE:</label>
    <input type="text" id="CONTRACT_VALUE" name="CONTRACT_VALUE" readonly="readonly" />

    <br><br>
    
    <label for="VENDOR_NAME">VENDOR NAME:</label>
    <input type="text" id="VENDOR_NAME" name="VENDOR_NAME" readonly="readonly" />

    <br><br>
    
    <label for="VENDOR_ADDR">VENDOR ADDR:</label>
    <input type="text" id="VENDOR_ADDR" name="VENDOR_ADDR" readonly="readonly" />
</body>
</html>
