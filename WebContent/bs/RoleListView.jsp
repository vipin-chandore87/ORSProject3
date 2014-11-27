
<%@page import="in.co.sunrays.proj3.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj3.controller.ORSView"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj3.dto.RoleDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<jsp:include page="Header.jsp" />

<!-- Page Content -->

<div class="container">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Role</h1>
		</div>
	</div>
<!-- /.row -->
	
	<div>
		<form action="<%=ORSView.ROLE_LIST_CTL%>">
			<div class="form-group ">
				<label for="name" class="col-sm-1">Name : </label>
				<div class="col-sm-4">
					<input type="name" class="form-control" name="name"
						value="<%=ServletUtility.getParameter("name", request)%>"
						placeholder="Enter Name ">
				</div>
			</div>

			<div class=" col-sm-1">
				<button role="button" class="btn btn-primary btn-small"
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
							<th>Name</th>
							<th>Description</th>
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
								Iterator<RoleDTO> it = list.iterator();

								while (it.hasNext()) {

									RoleDTO dto = it.next();
							%>
						<tr>

							<td><%=dto.getId()%></td>
							<td><%=dto.getName()%></td>
							<td><%=dto.getDescription()%></td>
							<td><a href="RoleCtl?id=<%=dto.getId()%>">Edit</a></td>

						</tr>
						<%
								}
							%>
					</tbody>
				</table>

				<table>
						<tr>
							<td><button role="button" class="btn btn-primary btn-small"
									type="submit" name="operation" value="<%=BaseCtl.OP_PREVIOUS%>">Previous</button>
								<button role="button" class="btn btn-primary btn-small "
									type="submit" name="operation" value="<%=BaseCtl.OP_NEXT%>">Next</button>
							</td>
						</tr>
				 </table>
					<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
						type="hidden" name="pageSize" value="<%=pageSize%>">
				</div>
		</form>
	</div>

<jsp:include page="Footer.jsp"></jsp:include>

</div>
<!-- /.container -->
			