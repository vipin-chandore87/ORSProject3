<%@page import="in.co.sunrays.proj3.controller.ORSView"%>
<%@page import="in.co.sunrays.proj3.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj3.dto.UserDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.sunrays.proj3.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj3.util.DataUtility"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>

<jsp:include page="Header.jsp" />

<!-- Page Content -->

<div class="container">

	<div class="row">

		<div class="col-lg-12">
			<h1 class="page-header">User List</h1>
			
		</div>

	</div>
	<!-- /.row -->
	<div>
		<form action="<%=ORSView.USER_LIST_CTL%>">
			<div class="form-group">
				<label for="firstName" class="col-sm-1">First Name: </label>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="firstName"
					value="<%=ServletUtility.getParameter("firstName", request)%>"
						placeholder="Enter First Name ">
				</div>
			</div>

			<div class="form-group">
				<label for="lastName" class="col-sm-1 ">Last Name: </label>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="lastName"
					value="<%=ServletUtility.getParameter("lastName", request)%>"
						placeholder="Enter Last Name. ">
				</div>
			</div>
			<div class="form-group">
				<label for="login" class="col-sm-1">Email ID: </label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="login"
					value="<%=ServletUtility.getParameter("login", request)%>"
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
								<th>Select</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>UserName</th>
								<th>Gender</th>
								<th>Date of Birth</th>
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
								Iterator<UserDTO> it = list.iterator();
								while (it.hasNext()) {
									UserDTO dto = it.next();
							%>
							<tr>
								<td><input type="checkbox" name="ids"
									value="<%=dto.getId()%>"></td>
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
					<table>
						<tr>
							<td><button class="btn btn-primary btn-small"
									type="submit" name="operation" value="<%=BaseCtl.OP_PREVIOUS%>">Previous</button>

								<button class="btn btn-primary btn-small "
									type="submit" name="operation" value="<%=BaseCtl.OP_DELETE%>">Delete</button>

								<button class="btn btn-primary btn-small "
									type="submit" name="operation" value="<%=BaseCtl.OP_NEXT%>">Next</button></td>
						</tr>

					</table>
			</div>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
		</form>
		<!-- /.row -->
	</div>
</div>
<!-- /.container -->
<jsp:include page="Footer.jsp" />