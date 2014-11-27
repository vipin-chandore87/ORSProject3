
<%@page import="in.co.sunrays.proj3.controller.StudentListCtl"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj3.dto.StudentDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<html>
<body>
	<%@include file="Header.jsp"%>
	<center>
		<h1>Student List</h1>

		<form action="<%=ORSView.STUDENT_LIST_CTL%>">
			<table width="100%">
				<tr>
					<td align="center"><label> First Name :</label> <input
						type="text" name="firstName" size="30"
						value="<%=ServletUtility.getParameter("firstName", request)%>">&emsp;
						<label>Last Name :</label> <input type="text" name="lastName"
						size="30"
						value="<%=ServletUtility.getParameter("lastName", request)%>">&emsp;
						<label>Email Id :</label> <input type="text" name="email"
						size="30"
						value="<%=ServletUtility.getParameter("email", request)%>">&emsp;
						<input type="submit" name="operation"
						value="<%=StudentListCtl.OP_SEARCH%>"></td>
				</tr>
			</table>
			<br>
			<table border="1" width="100%">
				<tr>
					<th>S.No</th>
					<th>ID</th>
					<th>College</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Date Of Birth</th>
					<th>Mobil No</th>
					<th>Email ID</th>
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
					Iterator<StudentDTO> it = list.iterator();

					while (it.hasNext()) {

						StudentDTO dto = it.next();
				%>
				<tr>
					<td><%=index++%></td>
					<td><%=dto.getId()%></td>
					<td><%=dto.getCollegeId()%></td>
					<td><%=dto.getFirstName()%></td>
					<td><%=dto.getLastName()%></td>
					<td><%=dto.getDob()%></td>
					<td><%=dto.getMobileNo()%></td>
					<td><%=dto.getEmail()%></td>
					<td><a href="StudentCtl?id=<%=dto.getId()%>">Edit</a></td>
				</tr>
				<%
					}
				%>
			</table>
			<table width="100%">
				<tr>
					<td><input type="submit" name="operation"
						value="<%=StudentListCtl.OP_PREVIOUS%>"></td>
					<td align="right"><input type="submit" name="operation"
						value="<%=StudentListCtl.OP_NEXT%>"></td>
				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"><input
				type="hidden" name="pageSize" value="<%=pageSize%>">


		</form>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>