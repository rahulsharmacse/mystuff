
<%

String data[][] = {

		

		{  "registeruser", "{\"userId\":\"prins1\",\"password\":\"prins1\",\"emailId\":\"aa@aa.com\", \"question1\":\"question1\", \"answer1\":\"answer1\",\"question2\":\"question2\", \"answer2\":\"answer2\", \"question3\":\"question3\", \"answer3\":\"answer3\"}"  },

		

		{  "login", "{\"userId\":\"prins1\",\"password\":\"prins1\"}"  },

		

		{  "forgot_password", "{\"userId\":\"prins1\"}"  },

		

		{  "validate_security_questions_answers", "{\"userId\":\"prins1\",\"answer1\":\"answer1\",\"answer2\":\"answer2\",\"answer3\":\"answer3\"}"  },

		

		{  "reset_password", "{\"userId\":\"prins1\",\"password\":\"prins1\"}"  },

		

		{  "getuserprofile", "{\"userId\":\"prins1\"}"  },

		

		{  "getusertransaction", "{\"userId\":\"prins1\",\"page\":\"0\"}"  },

		

		{  "get_user_eatable_buying_items_list", "{\"userId\":\"prins1\",\"noOfItems\":\"0\"}"  },

		

		{  "get_user_eatable_selling_items_list", "{\"userId\":\"prins1\"}"  },

		

		{  "buy_eatable_item", "{\"userId\":\"prins1\",\"productName\":\"productId\"}"  },

		

		{  "get_user_depreciable_buying_items_list", "{\"userId\":\"prins1\",\"noOfItems\":\"0\"}"  },

		

	    {  "get_user_depreciable_selling_items_list", "{\"userId\":\"prins1\"}"  },

	    

	    {  "get_user_depreciable_hold_items_list", "{\"userId\":\"prins1\"}"  },

				

		{  "buy_depreciable_item", "{\"userId\":\"prins1\",\"productName\":\"productId\"}"  },

		

		{  "get_user_appreciable_buying_items_list", "{\"userId\":\"prins1\",\"noOfItems\":\"0\"}" },

		

	    {  "get_user_appreciable_selling_items_list", "{\"userId\":\"prins1\"}"  },

	    

	    {  "get_user_Appreciable_hold_items_list", "{\"userId\":\"prins1\"}"  },

		

	    {  "buy_appreciable_item", "{\"userId\":\"prins1\",\"productName\":\"productId\"}"  },

	    

		{  "Sell_To_Bank_Appreciable_Depreciable_Item", "{\"userId\":\"prins1\",\"productName\":\"productId\"}"  },

		

		{  "Sell_To_Market_Appreciable_Depreciable_Item", "{\"userId\":\"prins1\",\"productName\":\"productId\"}"  },

	

		{  "list_item", "{\"userId\":\"prins1\",\"filter\":\"eatable\"}"  },

		

	    {  "Repost_A_Product", "{\"productName\":\"product1\"}"  },

	    

	    {  "calculate_user_net_worth", "{\"userId\":\"prins1\"}"  },

	    

	    {  "calculate_user_ranking", "{\"userId\":\"prins1\"}"  },

		    

	    {  "view_Economy_Calculation", "{\"userId\":\"prins1\"}"  },

	    

	    {  "get_celebration_triggers_list", "{\"userId\":\"prins1\",\"filter\":\"Pending/Completed\"}"  },

	    				

	    {  "manage_a_celebration", "{\"userId\":\"host\",\"appEmail\":\"dreamapp001@gmail.com\",\"password\":\"8860779277\",\"guest\":[ \"host\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\" ],\"celebrationId\":\"celebrationId\",\"mailBody\":\"thanks for attending the party\"}"  },



		{  "accept_or_reject_an_invitation", "{\"userId\":\"prins1\",\"invitationId\":\"invitationId\", \"filter\":\"Accept/Reject\"}"  },



	    {  "get_guest_celebration_list", "{\"userId\":\"prins1\",\"filter\":\"Accepted/Rejected/Requested\"}"  },

	    

	    {  "get_host_celebration_list", "{\"userId\":\"prins1\",\"filter\":\"Accepted/Rejected/sent\"}"  },

	  

	    {  "trigger_thanks_email", "{\"userId\":\"prins1\",\"emailId\":\"dreamapp001@gmail.com\",\"reciever\":\"rahul@gmail.com\",\"password\":\"8860779277\",\"body\":\"thanks for attending the party\"}"  },

	    

	    {  "process_batch", "{\"userId\":\"prins1\"}"  },

	    

{"a", "a"}};

%>

















<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.BufferedReader" %>

<%@ page import="java.io.IOException" %>

<%@ page import="java.io.InputStreamReader" %>

<%@ page import="java.io.OutputStream" %>

<%@ page import="java.net.HttpURLConnection" %>

<%@ page import="java.net.MalformedURLException" %>

<%@ page import="java.net.URL" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<title>Test Harness</title>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 



<%

String endPointValue = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/dwmts/rest/";



String action = request.getParameter("action");



int index = 0;

if(action != null){

	for(int i = 0; i < data.length - 1; i++ ) {

		if(action.equals(data[i][0])){

			index = i;

			break;

		}

	}

}



endPointValue += data[index][0];

String requestXML = data[index][1];

String responseXML = "";



if(action != null && action.equals("Submit")){

	

 requestXML = request.getParameter("requestXMLParameter");

 endPointValue = request.getParameter("endPointParameter");

 

  try {



	URL url = new URL(endPointValue);

	HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	conn.setDoOutput(true);

	conn.setRequestMethod("POST");

	conn.setRequestProperty("Content-Type", "application/json");

	

	OutputStream os = conn.getOutputStream();

	os.write(requestXML.getBytes());

	os.flush();



	if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {

		throw new RuntimeException("Failed : HTTP error code : "

			+ conn.getResponseCode());

	}



	BufferedReader br = new BufferedReader(new InputStreamReader(

			(conn.getInputStream())));



	String tmp = "";

	while ((tmp = br.readLine()) != null) {

		responseXML += tmp;

	}



	conn.disconnect();



  } catch (MalformedURLException e) {



	e.printStackTrace();



  } catch (IOException e) {



	e.printStackTrace();



 }

  

}

%>







<body>



<form action="welcome.jsp" method="post">

<table width="100%" height="100%" border="0">



<tr>

<td width = "20%" align="center" valign="top"> 



<% for(int i = 0; i < data.length - 1; i++ ) { %> 

<br/><br/>

<a href="welcome.jsp?action=<%= data[i][0] %>"><%= data[i][0] %></a>

<% } %>



</td>



<td width = "80%">



<table width="100%" height="100%" border="0">



<tr>

<td align="center">

<br/>

<b>EndPoint : </b>

<input type="text" name="endPointParameter" value="<%= endPointValue %>"  size="80" />

<br/>

</td>

</tr>



<tr>

<td align="center">

<b>REQUEST</b>

<br/>

<br/>

<textarea rows="12" cols="100" name="requestXMLParameter"><%= requestXML %></textarea>

<br/>

<br/>

<input type="submit" name="action" value="Submit" /> 

<br/>

<br/>

</td>

</tr>



<tr>

<td align="center">

<b>RESPONSE</b>

<br/>

<br/>

<textarea rows="12" cols="100"><%= responseXML %></textarea>

<br/>

<br/>

</td>

</tr>







</table>

</td>

</tr>

</table>

</form>



</body>

</html>
