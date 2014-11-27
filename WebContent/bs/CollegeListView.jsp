<%@page import="in.co.sunrays.proj3.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj3.controller.ORSView"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj3.dto.CollegeDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<jsp:include page="Header.jsp" />

<!-- Page Content -->

<div class="container">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">College List</h1>
		</div>
	</div>
	<!-- /.row -->

	<div>
		<form action="<%=ORSView.COLLEGE_LIST_CTL%>">
         
			<div class="form-group">
				<label for="name" class="col-sm-1">Name : </label>
				<div class="col-lg-4">
					<input type="text" class="form-control" name="name"
						value="<%=ServletUtility.getParameter("name", request)%>"
						placeholder="Enter Name.">
				</div>
			</div>
			<div class="form-group">
				<label for="city" class="col-sm-1">City : </label>
				<div class="col-lg-4">
					<input type="text" class="form-control" name="city"
						value="<%=ServletUtility.getParameter("city", request)%>"
						placeholder="Enter City. ">
				</div>
			</div>

			<div class=" col-lg-2">
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
						<th>Name</th>
						<th>Address</th>
						<th>State</th>
						<th>City</th>
						<th>Phone No</th>
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
						Iterator<CollegeDTO> it = list.iterator();

						while (it.hasNext()) {

							CollegeDTO dto = it.next();
					%>

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
				</tbody>
			</table>


			<table>
				<tr>
					<td><button class="btn btn-primary btn-small"
							type="submit" name="operation" value="<%=BaseCtl.OP_PREVIOUS%>">Previous</button>
						<button class="btn btn-primary btn-small "
							type="submit" name="operation" value="<%=BaseCtl.OP_NEXT%>">Next</button>
					</td>
				</tr>
			</table>
		</div>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>"> <br>
			<!-- /.row -->
		</form>
	</div>

	<jsp:include page="Footer.jsp"></jsp:include>

</div>
<!-- /.container -->
