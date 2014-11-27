<%@page import="in.co.sunrays.proj3.controller.MarksheetListCtl"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj3.dto.MarksheetDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<html>
<body>
	<%@include file="Header.jsp"%>
	<center>
		<h1>Marksheet List</h1>

		<form action="<%=ORSView.MARKSHEET_LIST_CTL%>">

			<table width="100%">
				<tr>
					<td align="center"><label> Name :</label> <input type="text"
						name="name"
						value="<%=ServletUtility.getParameter("name", request)%>">
						&emsp; <label>RollNo :</label> <input type="text" name="rollNo"
						value="<%=ServletUtility.getParameter("rollNo", request)%>">&emsp;
						<input type="submit" name="operation" value="<%=MarksheetListCtl.OP_SEARCH %>"></td>
				</tr>
			</table>
			<br>
			<table border="1" width="100%">
				<tr>
					<th>Select</th>
					<th>ID</th>
					<th>Roll No</th>
					<th>Name</th>
					<th>Physics</th>
					<th>Chemistry</th>
					<th>Maths</th>
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
					Iterator<MarksheetDTO> it = list.iterator();

					while (it.hasNext()) {

						MarksheetDTO dto = it.next();
				%>
				<tr>
					<td><input type="checkbox" name="ids" value="<%=dto.getId()%>"></td>
					<td><%=dto.getId()%></td>
					<td><%=dto.getRollNo()%></td>
					<td><%=dto.getName()%></td>
					<td><%=dto.getPhysics()%></td>
					<td><%=dto.getChemistry()%></td>
					<td><%=dto.getMaths()%></td>
					<td><a href="MarksheetCtl?id=<%=dto.getId()%>">Edit</a></td>
				</tr>

				<%
					}
				%>
			</table>
			<table width="100%">
				<tr>
					<td><input type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_PREVIOUS%>"></td>
					<td><input type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_NEW%>"></td>
					<td><input type="submit"
						name="operation" value="<%=MarksheetListCtl.OP_DELETE%>"></td>
					<td align="right"><input type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_NEXT%>"></td>
				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
		</form>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>