 
<%@page import="in.co.sunrays.proj3.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj3.controller.StudentCtl"%>
<%@page import="in.co.sunrays.proj3.util.DataUtility"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>
<%@page import="java.util.List"%>

<html>
<body>
	<form action="StudentCtl">
		<%@ include file="Header.jsp"%>
		<script type="text/javascript" src="../js/calendar.js"></script>
		<jsp:useBean id="dto" class="in.co.sunrays.proj3.dto.StudentDTO"
			scope="request"></jsp:useBean>

		<%
			List l = (List) request.getAttribute("collegeList");
		%>



		<center>
			<h1>Add Student</h1>

			<H2>
				<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
				</font>
			</H2>

			<H2>
				<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
				</font>
			</H2>

			<input type="hidden" name="id" value="<%=dto.getId()%>">
			<input type="hidden" name="createdBy" value="<%=dto.getCreatedBy()%>">
			<input type="hidden" name="modifiedBy" value="<%=dto.getModifiedBy()%>"> 
			<input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(dto.getCreatedDatetime())%>">
			<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(dto.getModifiedDatetime())%>">
			

			<table>
				<tr>
					<th>College</th>
					<td><%=HTMLUtility.getList("collegeId",
					String.valueOf(dto.getCollegeId()), l)%></td>

				</tr>
				<tr>
					<th>First Name*</th>
					<td><input type="text" name="firstName" size="30"
						value="<%=DataUtility.getStringData(dto.getFirstName())%>"
						<%=(dto.getId() > 0) ? "readonly" : ""%>><font color="red">
							<%=ServletUtility.getErrorMessage("firstName", request)%></font></td>
				</tr>
				<tr>
					<th>Last Name*</th>
					<td><input type="text" name="lastName" size="30"
						value="<%=DataUtility.getStringData(dto.getLastName())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("lastName", request)%></font></td>
				</tr>
				
				<tr>
					<th>Date Of Birth (mm/dd/yyyy)*</th>
					<td><input type="text" name="dob" readonly="readonly" size=30
						value="<%=DataUtility.getDateString(dto.getDob())%>">
					<a href="javascript:getCalendar(document.forms[0].dob);">
							<img src="../img/cal.jpg" width="16" height="15" border="0"
							alt="Calender">
					</a><font
						color="red"> <%=ServletUtility.getErrorMessage("dob", request)%></font></td>
				</tr>
				<tr>
					<th>MobileNo*</th>
					<td><input type="text" name="mobileNo" size="30"
						maxlength="10"
						value="<%=DataUtility.getStringData(dto.getMobileNo())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("mobileNo", request)%></font></td>
				</tr>
				<tr>
					<th>Email ID*</th>
					<td><input type="text" name="email" size="30"
						value="<%=DataUtility.getStringData(dto.getEmail())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("email", request)%></font></td>
				</tr>


				<tr>
					<th></th>
					<td colspan="2"><input type="submit" name="operation"
						value="<%=StudentCtl.OP_SAVE%>"> <%
 	if (dto.getId() > 0) {
 %> &emsp;<input type="submit" name="operation"
						value="<%=StudentCtl.OP_DELETE%>"> <%
 	}
 %>&emsp; <input type="submit" name="operation"
						value="<%=StudentCtl.OP_CANCEL%>"></td>
				</tr>
			</table>
	</form>
	</center>
	<%@ include file="Footer.jsp"%>
</body>
</html>