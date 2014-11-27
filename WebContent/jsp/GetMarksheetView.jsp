
<%@page import="in.co.sunrays.proj3.controller.GetMarksheetCtl"%>
<%@page import="in.co.sunrays.proj3.util.DataUtility"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>
<html>
<body>
	<%@ include file="Header.jsp"%>

	<jsp:useBean id="dto" class="in.co.sunrays.proj3.dto.MarksheetDTO"
		scope="request"></jsp:useBean>

	<center>
		<h1>Get Marksheet</h1>


		<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
		</font>


		<H2>
			<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
			</font>
		</H2>

		<form action="<%=ORSView.GET_MARKSHEET_CTL%>">

			<input type="hidden" name="id" value="<%=dto.getId()%>">
			<table>
				<label>RollNo :</label>&emsp;
				<input type="text" name="rollNo" placeholder="Enter Roll NO"
					value="<%=ServletUtility.getParameter("rollNo", request)%>">&emsp;
				<input type="submit" name="operation" value="<%=GetMarksheetCtl.OP_GO%>">
				<br>
				<font color="red"><%=ServletUtility.getErrorMessage("rollNo", request)%></font>

				<%
					if (dto.getRollNo() != null && dto.getRollNo().trim().length() > 0) {
				%>


				<tr>
					<td>Rollno :</td>
					<td><%=DataUtility.getStringData(dto.getRollNo())%></td>
				</tr>
				<tr>
					<td>Name :</td>
					<td><%=DataUtility.getStringData(dto.getName())%></td>
				</tr>
				<tr>
					<td>Physics :</td>
					<td><%=DataUtility.getStringData(dto.getPhysics())%></td>
				</tr>
				<tr>
					<td>Chemistry :</td>
					<td><%=DataUtility.getStringData(dto.getChemistry())%></td>
				</tr>
				<tr>
					<td>Maths :</td>
					<td><%=DataUtility.getStringData(dto.getMaths())%></td>

				</tr>
				<tr>
					</td>
				</tr>
			</table>
			<%
				}
			%>
		</form>
	</center>
	<%@ include file="Footer.jsp"%>
</body>
</html>