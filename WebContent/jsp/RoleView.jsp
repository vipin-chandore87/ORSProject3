
<%@page import="in.co.sunrays.proj3.controller.RoleCtl"%>
<%@page import="in.co.sunrays.proj3.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj3.util.DataUtility"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>
<html>
<body>
	<form action="<%=ORSView.ROLE_CTL%>">
		<%@ include file="Header.jsp"%>

		<jsp:useBean id="dto" class="in.co.sunrays.proj3.dto.RoleDTO"
			scope="request"></jsp:useBean>

		<center>
			<h1>Add Role</h1>
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
					<th>Description*</th>
					<td><input type="text" name="description" size="30"
						value="<%=DataUtility.getStringData(dto.getDescription())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("description", request)%></font></td>
				</tr>
				<tr>
				    <th></th>
					<td colspan="2"><input type="submit" name="operation"
						value="<%=RoleCtl.OP_SAVE%>">&emsp; <input type="submit"
						name="operation" value="<%=RoleCtl.OP_CANCEL%>"></td>
				</tr>
			</table>
	</form>
	</center>
	<%@ include file="Footer.jsp"%>
</body>
</html>