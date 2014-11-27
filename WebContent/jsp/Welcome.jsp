<%@page import="in.co.sunrays.proj3.controller.ORSView"%>
<html>
<body>
	<form action="<%=ORSView.WELCOME_CTL%>">
		<%@ include file="Header.jsp"%>
					<h1 align="Center">
						<font size="10px" color="red">Welcome to ORS </font>
					</h1>
		
	            	<%
						UserDTO user1Dto = (UserDTO) session.getAttribute("user");
						if (user1Dto != null) {
							if (user1Dto.getRoleId() == RoleDTO.STUDENT) {
					%>
		
					<h2 align="Center">
						<a href="<%=ORSView.GET_MARKSHEET_CTL%>">Click here to see your
							Marksheet </a>
					</h2>
			         
			         <%
							}
						}
			         %>
				
				</form>
		
		<%@ include file="Footer.jsp"%>
</body>
</html>