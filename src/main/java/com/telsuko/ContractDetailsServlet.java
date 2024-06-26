package com.telsuko;

import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.google.gson.Gson;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

@WebServlet("/ContractDetailsServlet")
public class ContractDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // This method handles HTTP GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try
    	{
        response.setContentType("application/json");
        String requestType = request.getParameter("reqType");
        String contractId = request.getParameter("contractId");
        Connection conn = DatabaseConnectionManager.getConnection();

        if (requestType.equals("getContractDetails") && contractId != null && !contractId.isEmpty()) {
            try {
                // Establish database connection
                String query = "SELECT LC_DETAIL FROM RAIL_LC";
                PreparedStatement pstmt = conn.prepareStatement(query);
                ResultSet rs = pstmt.executeQuery();

                List<String> contractList = new ArrayList<>();
                DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                DocumentBuilder builder = factory.newDocumentBuilder();

                // Iterate over the result set
                while (rs.next()) {
                    String lcDetailXml = rs.getString("LC_DETAIL");
                    System.out.println("LC_DETAIL: " + lcDetailXml); // Log the XML content

                    if (lcDetailXml != null && !lcDetailXml.trim().isEmpty()) {
                        // Remove the XML declaration if present
                        lcDetailXml = lcDetailXml.replaceFirst("^<\\?xml.*\\?>", "").trim();
                        
                        try {
                            // Parse the XML into a DOM document
                            InputSource is = new InputSource(new StringReader(lcDetailXml));
                            Document doc = builder.parse(is);
                            if (doc != null) {
                                // Navigate to CONTRACT elements
                                NodeList contractNodes = doc.getElementsByTagName("CONTRACT");
                                for (int i = 0; i < contractNodes.getLength(); i++) {
                                    Element contractElement = (Element) contractNodes.item(i);
                                    String currentContractId = contractElement.getElementsByTagName("CONTRACTNO").item(0).getTextContent();

                                    // Check if the contract ID matches the requested contract ID
                                    if (currentContractId.equals(contractId)) {
                                        contractList.add(nodeToString(contractElement));
                                    }
                                }
                            } else {
                                System.err.println("Document parsing resulted in null");
                            }
                        } catch (Exception e) {
                            System.err.println("Error parsing XML: " + lcDetailXml);
                            e.printStackTrace();
                        }
                    } else {
                        System.err.println("Empty or null LC_DETAIL encountered");
                    }
                }

                // Convert the contract list to JSON
                Gson gs = new Gson();
                String jsonList = gs.toJson(contractList);
                System.out.println("list is " + jsonList);

                // Send the JSON response
                response.setContentType("application/json");
                response.getWriter().write(jsonList);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(requestType.equals("validateContarctID") && contractId != null && !contractId.isEmpty()) {
            try {
                System.out.println("Validating contractId: " + contractId);
                
                String query = "SELECT STATUS, LC_NO FROM INIS_MASTER WHERE CONTRACT_ID = ?";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, contractId);
                ResultSet rs = pstmt.executeQuery();
                
                if (rs.next()) {
                    String status = rs.getString("STATUS");
                    String lcNo = rs.getString("LC_NO");
                    
                    // Create a JSON object to hold the response data
                    JSONObject responseJson = new JSONObject();
                    responseJson.put("contractId", contractId);
                    responseJson.put("status", status);
                    responseJson.put("lcNo", lcNo);
                    
                    // Convert the JSON object to a string and send it as the response
                    String jsonResponse = responseJson.toString();
                    response.setContentType("application/json");
                    response.getWriter().write(jsonResponse);
                } else {
                    // Contract ID not found
                    response.getWriter().write("{\"error\": \"Contract ID not found\"}");
                }
                
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("{\"error\": \"An error occurred\"}");
            }
        }
else {
            // Send an invalid request response if the request is not valid
            response.getWriter().write("Invalid request");
        }
    
    }catch (Exception e) {
        e.printStackTrace();
    }
    }

    // Utility method to convert a DOM node to a string
    private String nodeToString(Node node) throws Exception {
        StringWriter sw = new StringWriter();
        Transformer t = TransformerFactory.newInstance().newTransformer();
        t.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
        t.setOutputProperty(OutputKeys.INDENT, "yes");
        t.transform(new DOMSource(node), new StreamResult(sw));
        return sw.toString();
    }
}
