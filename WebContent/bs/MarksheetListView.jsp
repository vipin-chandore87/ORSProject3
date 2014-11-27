
<%@page import="in.co.sunrays.proj3.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj3.controller.ORSView"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj3.dto.MarksheetDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<jsp:include page="Header.jsp" />

<!-- Page Content -->

<div class="container">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Marksheet List</h1>
		</div>
	</div>
	<!-- /.row -->
	<div>
		<form action="<%=ORSView.MARKSHEET_LIST_CTL%>">

			<div class="form-group ">
				<label for="name" class="col-sm-1">Name : </label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="name"
						value="<%=ServletUtility.getParameter("name", request)%>"
						placeholder="Enter Name ">
				</div>
			</div>
			<div class="form-group ">
				<label for="rollNo" class="col-sm-1">Roll No. : </label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="rollNo"
						value="<%=ServletUtility.getParameter("rollNo", request)%>"
						placeholder="Enter Roll No. ">
				</div>
			</div>
			<div class=" col-sm-2">
				<button class="btn btn-primary btn-small" type="submit"
					name="operation" value="<%=BaseCtl.OP_SEARCH%>">Search</button>
			</div>
			<br> <br> <br>
			<div class="row">
				<table class="table table-Bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>Select</th>
							<th>RollNo</th>
							<th>Name</th>
							<th>Physics</th>
							<th>Chemistry</th>
							<th>Maths</th>
							<th>Edit</th>
						</tr>
					</thead>
					<tbody>
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
							<td><input type="checkbox" name="ids"
								value="<%=dto.getId()%>"></td>
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
					</tbody>
				</table>

				<table>
					<tr>
						<td><button class="btn btn-primary btn-small" type="submit"
								name="operation" value="<%=BaseCtl.OP_PREVIOUS%>">Previous</button></td>
						<td><button class="btn btn-primary btn-small " type="submit"
								name="operation" value="<%=BaseCtl.OP_NEXT%>">Next</button></td>
						<td><button class="btn btn-primary btn-small" type="submit"
								name="operation" value="<%=BaseCtl.OP_NEW%>">New</button></td>
						<td><button class="btn btn-primary btn-small" type="submit"
								name="operation" value="<%=BaseCtl.OP_DELETE%>">Delete</button>
						</td>
					</tr>
				</table>
			</div>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
			<!-- /.row -->
			<br>
		</form>
	</div>
</div>

<!-- /.container -->

<jsp:include page="Footer.jsp"></jsp:include>

