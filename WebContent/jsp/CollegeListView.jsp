<%@page import="in.co.sunrays.proj3.controller.CollegeListCtl"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj3.dto.CollegeDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<html>
<body>
	<%@include file="Header.jsp"%>
	<center>
		<h1>College List</h1>

		<form action="<%=ORSView.COLLEGE_LIST_CTL%>">

			<table width="100%">
				<tr>
					<td align="center"><label> Name :</label> <input type="text"
						name="name" size="30"
						value="<%=ServletUtility.getParameter("name", request)%>">&emsp;&emsp;
						<label>City :</label> <input type="text" name="city" size="30"
						value="<%=ServletUtility.getParameter("city", request)%>">
						<input type="submit" name="operation"
						value="<%=CollegeListCtl.OP_SEARCH%>"></td>
				</tr>
			</table>
			<br>
			<table border="1" width="100%">
				<tr>
					<th>S.No</th>
					<th>ID</th>
					<th>Name</th>
					<th>Address</th>
					<th>State</th>
					<th>City</th>
					<th>PhoneNo</th>
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
					Iterator<CollegeDTO> it = list.iterator();

					while (it.hasNext()) {

						CollegeDTO dto = it.next();
				%>
				<tr>
					<td><%=index++%></td>
					<td><%=dto.getId()%></td>
					<td><%=dto.getName()%></td>
					<td><%=dto.getAddress()%></td>
					<td><%=dto.getState()%></td>
					<td><%=dto.getCity()%></td>
					<td><%=dto.getPhoneNo()%></td>
					<td><a href="CollegeCtl?id=<%=dto.getId()%>">Edit</a></td>
				</tr>
				<%
					}
				%>
			</table>
			<table width="100%">
				<tr>
					<td><input type="submit" name="operation"
						value="<%=CollegeListCtl.OP_PREVIOUS%>"></td>
					<td></td>
					<td align="right"><input type="submit" name="operation"
						value="<%=CollegeListCtl.OP_NEXT%>"></td>
				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
		</form>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>