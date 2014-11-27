
<%@page import="in.co.sunrays.proj3.controller.UserListCtl"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<html>
<body>

	<%@include file="Header.jsp"%>

	<center>
		<h1>User List</h1>

		<form action="<%=ORSView.USER_LIST_CTL%>">

			<table width="100%">
				<tr>
					<td align="center"><label>First Name :</label> <input
						type="text" name="firstName" size="30"
						value="<%=ServletUtility.getParameter("firstName", request)%>">
						&emsp; <label>Last Name :</label> <input type="text"
						name="lastName" size="30"
						value="<%=ServletUtility.getParameter("lastName", request)%>">
						&emsp; <label>Login Id:</label> <input type="text" name="login"
						size="30"
						value="<%=ServletUtility.getParameter("login", request)%>">
						&emsp; <input type="submit" name="operation"
						value="<%=UserListCtl.OP_SEARCH%>"></td>
				</tr>
			</table>
			<br>

			<table border="1" width="100%">
				<tr>
					<th>Select</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Login Id</th>
					<th>Gender</th>
					<th>DOB</th>
					<th>Edit</th>
				</tr>

				<tr>
					<td colspan="8"><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></td>
				</tr>

				<%
					int pageNo = ServletUtility.getPageNo(request);
					int pageSize = ServletUtility.getPageSize(request);
					int index = ((pageNo - 1) * pageSize) + 1;

					List list = ServletUtility.getList(request);
					Iterator<UserDTO> it = list.iterator();
					while (it.hasNext()) {
						UserDTO dto = it.next();
				%>
				<tr>
					<td><input type="checkbox" name="ids" value="<%=dto.getId()%>"></td>
					<td><%=dto.getFirstName()%></td>
					<td><%=dto.getLastName()%></td>
					<td><%=dto.getLogin()%></td>
					<td><%=dto.getGender()%></td>
					<td><%=dto.getDob()%></td>
					<td><a href="UserCtl?id=<%=dto.getId()%>">Edit</a></td>
				</tr>
				<%
					}
				%>
			</table>
			<table width="100%">
				<tr>
					<td><input type="submit" name="operation"
						value="<%=UserListCtl.OP_PREVIOUS%>"></td>
					<td><input type="submit" name="operation"
						value="<%=UserListCtl.OP_DELETE%>"></td>
					<td align="right"><input type="submit" name="operation"
						value="<%=UserListCtl.OP_NEXT%>"></td>
				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
		</form>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>