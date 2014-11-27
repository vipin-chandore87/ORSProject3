<%@page import="in.co.sunrays.proj3.controller.ORSView"%>

<%@ include file="Header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-lg-12">
		  <form action="<%=ORSView.WELCOME_CTL%>">
		
			<h1 align="center">
				<font class="text-danger">Welcome to ORS </font>
			   </h1>
			         <%
						UserDTO user1 = (UserDTO) session.getAttribute("user");
						if (user1 != null) {
							if (user.getRoleId() == 2) {
					 %>
					 <h3 align="center">
							<a href="<%=ORSView.GET_MARKSHEET_CTL%>">Click here to see your
								Marksheet </a>
					 </h3>
			         
			         <%
							}
						}
			         %>
			  </form>
		</div>
	</div>
	<%@ include file="Footer.jsp"%>
</div>