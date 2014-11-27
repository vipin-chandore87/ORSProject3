
<%@page import="in.co.sunrays.proj3.controller.RoleListCtl"%>
<%@page import="in.co.sunrays.proj3.controller.RoleCtl"%>
<%@page import="in.co.sunrays.proj3.dto.RoleDTO"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<html>
<body>

	<%@include file="Header.jsp"%>

	<center>
		<h1>Role List</h1>

		<form action="<%=ORSView.ROLE_LIST_CTL%>">
			<table width="100%">
				<tr>
					<td align="center"><label>Name :</label> <input type="text"
						name="name"
						value="<%=ServletUtility.getParameter("name", request)%>">
						&nbsp; <input type="submit" name="operation"
						value="<%=RoleListCtl.OP_SEARCH%>"></td>
				</tr>
			</table>
			<table border="1" width="100%">
				<tr>
					<th>S.No.</th>
					<th>ID</th>
					<th>Name</th>
					<th>Descriptiop</th>
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
					Iterator<RoleDTO> it = list.iterator();
					while (it.hasNext()) {
						RoleDTO dto = it.next();
				%>
				<tr>
					<td><%=index++%></td>
					<td><%=dto.getId()%></td>
					<td><%=dto.getName()%></td>
					<td><%=dto.getDescription()%></td>
					<td><a href="RoleCtl?id=<%=dto.getId()%>">Edit</a></td>
				</tr>
				<%
					}
				%>
			</table>
			<table width="100%">
				<tr>
					<td><input type="submit" name="operation"
						value="<%=RoleListCtl.OP_PREVIOUS%>"></td>
					<td></td>
					<td align="right"><input type="submit" name="operation"
						value="<%=RoleListCtl.OP_NEXT%>"></td>
				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
		</form>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>