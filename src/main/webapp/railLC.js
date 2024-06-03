function validateContractID(){
    	    var contractID = document.getElementById("CONTRACT_ID").value;	
    		$.ajax({
                url: 'ContractDetailsServlet',
                type: 'GET',
                data: {
                    reqType: 'validateContarctID',
                    contractId: contractID
                },
                success: function(response){
                	try{
                		console.log(response);
                		getContractDetails()
                	}catch{
                		
                	}
                },
                error: function(xhr, status, error) {
                    alert("Error: " + error);
                }
            });
                
                }
    	
        function getContractDetails() {
            var contractID = document.getElementById("CONTRACT_ID").value;	
            
            $.ajax({
                url: 'ContractDetailsServlet',
                type: 'GET',
                data: {
                    reqType: 'getContractDetails',
                    contractId: contractID
                },
                success: function(response) {
                    try {
                        var xmlDoc = new DOMParser().parseFromString(response, "text/xml");
                        var contract = xmlDoc.getElementsByTagName("CONTRACT")[0];

                        var fieldMapping = {
                            "CONTRACT_NO": "CONTRACTNO",
                            "CONTRACT_DATE": "CONTRACT_DATE",
                            "CONTRACT_VALUE": "CONTRACT_VALUE",
                            "VENDOR_NAME": "VENDOR_NAME",
                            "VENDOR_ADDR": "VENDOR_ADDR"
                            // Add more fields as needed
                        };

                        for (var fieldId in fieldMapping) {
                            var xmlTagName = fieldMapping[fieldId];
                            document.getElementById(fieldId).value = getElementTextContent(contract, xmlTagName);
                        }
                    } catch (e) {
                        clearAllFields();
                        alert("Error parsing XML response");
                    }
                },
                error: function(xhr, status, error) {
                    alert("Error: " + error);
                }
            });
        }

        function getElementTextContent(parent, tagName) {
            return parent.getElementsByTagName(tagName)[0].textContent;
        }

        function clearAllFields() {
            document.getElementById("CONTRACT_NO").value = "";
            document.getElementById("CONTRACT_DATE").value = "";
            document.getElementById("CONTRACT_VALUE").value = "";
            document.getElementById("VENDOR_NAME").value = "";
            document.getElementById("VENDOR_ADDR").value = "";
        }