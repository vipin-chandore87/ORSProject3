<%@page import="in.co.sunrays.proj3.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj3.controller.ORSView"%>

<%@page import="in.co.sunrays.proj3.util.DataUtility"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>

<jsp:include page="Header.jsp" />
<!-- Page Content -->
<jsp:useBean id="dto" class="in.co.sunrays.proj3.dto.MarksheetDTO"
	scope="request"></jsp:useBean>

<div class="container">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Get Marksheet</h1>
		</div>
	</div>
	<!-- /.row -->

	<div class="col-sm-12">

		<form class="form-horizontal" action="<%=ORSView.GET_MARKSHEET_CTL%>">
			<input type="hidden" name="id" value="<%=dto.getId()%>">
			  	<table>
				  <div class="form-group">
					  <label for="rollNo" class="col-sm-2 control-label">Roll No
						:</label>
					    <div class="col-sm-4">
						<input type="rollNo" class="form-control" name="rollNo"
							value="<%=ServletUtility.getParameter("rollNo", request)%>"
							 placeholder="Enter Roll No"> <label class="col-sm-10"><h3
								style="color: red;"><%=ServletUtility.getErrorMessage("rollNo", request)%>
								<h3 style="color: red;"><%=ServletUtility.getErrorMessage(request)%></h5>
									</h5></label>
					</div>
					<div>
						<button type="submit" class="btn btn-primary" value="<%=BaseCtl.OP_GO%>"
							name="operation">Go</button>
					</div>
				</div>
				<br>
				<br>
				<%
					if (dto.getRollNo() != null && dto.getRollNo().trim().length() > 0) {
				%>
				<table class="table table-Bordered">

					<tbody>
						<tr>
							<th>RollNo</th>
							<td><%=DataUtility.getStringData(dto.getRollNo())%></td>
						</tr>
						<tr>
							<th>Name</th>
							<td><%=DataUtility.getStringData(dto.getName())%></td>
						</tr>
						<tr>
							<th>Physics</th>
							<td><%=DataUtility.getStringData(dto.getPhysics())%></td>
						</tr>
						<tr>
							<th>Chemistry</th>
							<td><%=DataUtility.getStringData(dto.getChemistry())%></td>
						</tr>
						<tr>
							<th>Maths</th>
							<td><%=DataUtility.getStringData(dto.getMaths())%></td>
						</tr>
				</table>
			</table>

			<%
				}
			%>

			<div>
				<input type="hidden" name="save" value="save">
				<button type="submit" class="btn btn-primary" value="operation">Print</button>
				<input type="hidden" name="delete" value="back">
				<button type="submit" class="btn btn-primary">Back</button>
			</div>
		</form>


	</div>
	<!-- /.row -->

	<jsp:include page="Footer.jsp"></jsp:include>

</div>
<!-- /.container -->

