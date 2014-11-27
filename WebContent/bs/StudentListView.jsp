<%@page import="in.co.sunrays.proj3.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj3.controller.ORSView"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj3.dto.StudentDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<jsp:include page="Header.jsp" />

<!-- Page Content -->

<div class="container">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Student List</h1>
		</div>
	</div>
	<!-- /.row -->

	<div>
		<form action="<%=ORSView.STUDENT_LIST_CTL%>">
			<div class="form-group">
				<label for="firstName" class="col-sm-1">First Name: </label>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="firstName"
					value="<%=ServletUtility.getParameter("firstName", request)%>"
						placeholder="Enter First Name ">
				</div>

			</div>
			<div class="form-group">
				<label for="lastName" class="col-sm-1">Last Name: </label>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="lastName"
					value="<%=ServletUtility.getParameter("lastName", request)%>"
						placeholder="Enter Last Name. ">
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-1">Email ID: </label>
				<div class="col-sm-3">
					<input type="email" class="form-control" name="email"
					value="<%=ServletUtility.getParameter("email", request)%>"
						placeholder="Enter Email Id . ">
			</div>
			</div>
			<div class=" col-sm-1">
				<button class="btn btn-primary btn-small"
					type="submit" name="operation" value="<%=BaseCtl.OP_SEARCH%>">Search</button>

			</div>
			<br>
			<br>
			<br>
			<div class="row">
					<table class="table table-Bordered">
						<thead>
							<tr>

								<th>ID</th>
								<th>College</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Date Of Birth</th>
								<th>Mobile No</th>
								<th>Email ID</th>

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
								Iterator<StudentDTO> it = list.iterator();

								while (it.hasNext()) {

									StudentDTO dto = it.next();
							%>
							<tr>
								<td><%=dto.getId()%></td>
								<td><%=dto.getCollegeId()%></td>
								<td><%=dto.getFirstName()%></td>
								<td><%=dto.getLastName()%></td>
								<td><%=dto.getDob()%></td>
								<td><%=dto.getMobileNo()%></td>
								<td><%=dto.getEmail()%></td>

							</tr>
							<%
								}
							%>
						</tbody>
					</table>


					<table>
						<tr>
							<td><button class="btn btn-primary btn-small"
									type="submit" name="operation" value="<%=BaseCtl.OP_PREVIOUS%>">Previous</button>
								<button class="btn btn-primary btn-small "
									type="submit" name="operation" value="<%=BaseCtl.OP_NEXT%>">Next</button></td>
						</tr>
					</table>
					<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
						type="hidden" name="pageSize" value="<%=pageSize%>">
				</div>
			<br>
		</form>
	</div>
	<!-- /.row -->

	<jsp:include page="Footer.jsp"></jsp:include>

</div>
<!-- /.container -->