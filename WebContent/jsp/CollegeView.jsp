

<%@page import="in.co.sunrays.proj3.controller.CollegeCtl"%>
<%@page import="in.co.sunrays.proj3.util.DataUtility"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>
<html>
<body>
	<form action="CollegeCtl">
		<%@ include file="Header.jsp"%>

		<jsp:useBean id="dto" class="in.co.sunrays.proj3.dto.CollegeDTO"
			scope="request"></jsp:useBean>

		<center>
			<h1>Add College</h1>

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
					<th>Name*</th>
					<td><input type="text" name="name" size="30"
						value="<%=DataUtility.getStringData(dto.getName())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("name", request)%></font></td>
				</tr>
				<tr>
					<th>Address*</th>
					<td><input type="text" name="address" size="30"
						value="<%=DataUtility.getStringData(dto.getAddress())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("address", request)%></font></td>
				</tr>
				<tr>
					<th>State*</th>
					<td><input type="text" name="state" size="30"
						value="<%=DataUtility.getStringData(dto.getState())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("state", request)%></font></td>
				</tr>
				<tr>
					<th>City*</th>
					<td><input type="text" name="city" size="30"
						value="<%=DataUtility.getStringData(dto.getCity())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("city", request)%></font></td>
				</tr>
				<tr>
					<th>PhoneNo*</th>
					<td><input type="text" name="phoneNo" size="30" maxlength="12"
						value="<%=DataUtility.getStringData(dto.getPhoneNo())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("phoneNo", request)%></font></td>
				</tr>


				<tr>
					<th></th>
					<td colspan="2"><input type="submit" name="operation"
						value="<%=CollegeCtl.OP_SAVE%>"> <%
 	if (dto.getId() > 0) {
 %> &emsp;<input type="submit" name="operation"
						value="<%=CollegeCtl.OP_DELETE%>"> <%
 	}
 %>&emsp; <input type="submit" name="operation"
						value="<%=CollegeCtl.OP_CANCEL%>"></td>
				</tr>
			</table>
	</form>
	</center>
	<%@ include file="Footer.jsp"%>
</body>
</html>