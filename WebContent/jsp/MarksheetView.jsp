
<%@page import="in.co.sunrays.proj3.controller.MarksheetCtl"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj3.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj3.util.DataUtility"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>
<html>
<body>
	<%@ include file="Header.jsp"%>

	<jsp:useBean id="dto" class="in.co.sunrays.proj3.dto.MarksheetDTO"
		scope="request"></jsp:useBean>

	<%
		List l = (List) request.getAttribute("studentList");
	%>


	<center>
		<h1>Add Marksheet</h1>
		<H2>
			<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
			</font>
		</H2>
		<H2>
			<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
			</font>
		</H2>

		<form action="<%=ORSView.MARKSHEET_CTL%>">

			<input type="hidden" name="id" value="<%=dto.getId()%>">
			<input type="hidden" name="createdBy" value="<%=dto.getCreatedBy()%>">
			<input type="hidden" name="modifiedBy" value="<%=dto.getModifiedBy()%>"> 
			<input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(dto.getCreatedDatetime())%>">
			<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(dto.getModifiedDatetime())%>">
			

			<table>
				<tr>
					<th>Rollno*</th>
					<td><input type="text" name="rollNo"
						value="<%=DataUtility.getStringData(dto.getRollNo())%>"
						<%=(dto.getId() > 0) ? "readonly" : ""%>> <font
						color="red"> <%=ServletUtility.getErrorMessage("rollNo", request)%></font></td>
					</font>
					</td>
				</tr>
				<tr>
					<th>Name*</th>
					<td><%=HTMLUtility.getList("studentId",
					String.valueOf(dto.getStudentId()), l)%></td>
				</tr>
				<tr>
					<th>Physics</th>
					<td><input type="text" name="physics"
						value="<%=DataUtility.getStringData(dto.getPhysics())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("physics", request)%></font></td>
				</tr>
				<tr>
					<th>Chemistry</th>
					<td><input type="text" name="chemistry"
						value="<%=DataUtility.getStringData(dto.getChemistry())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("chemistry", request)%></font></td>
				</tr>
				<tr>
					<th>Maths</th>
					<td><input type="text" name="maths"
						value="<%=DataUtility.getStringData(dto.getMaths())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("maths", request)%></font></td>

				</tr>
				<tr> 
				     <th></th>
					<td colspan="2"><input type="submit" name="operation"
						value="<%=MarksheetCtl.OP_SAVE%>"> <%
 	if (dto.getId() > 0) {
 %><input type="submit" name="operation" value="<%=MarksheetCtl.OP_DELETE%>">
						<%
 	}
 %> <input type="submit" name="operation" value="<%=MarksheetCtl.OP_CANCEL%>"></td>
				</tr>
			</table>
		</form>
	</center>
	<%@ include file="Footer.jsp"%>
</body>
</html>