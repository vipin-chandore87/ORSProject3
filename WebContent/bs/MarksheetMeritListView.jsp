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
			<h1 class="page-header">Marksheet Merit List</h1>

		</div>



	</div>
	<!-- /.row -->
	<div>
		<form role="form" action="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>">



			<div class="row">

				<div class="col-sm-12">

					<table class="table table-Bordered">
						<thead>
							<tr>
								<th>RollNo</th>
								<th>Name</th>
								<th>Physics</th>
								<th>Chemistry</th>
								<th>Maths</th>
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
								<td><%=dto.getRollNo()%></td>
								<td><%=dto.getName()%></td>
								<td><%=dto.getPhysics()%></td>
								<td><%=dto.getChemistry()%></td>
								<td><%=dto.getMaths()%></td>
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
									type="submit" name="operation" value="<%=BaseCtl.OP_NEXT%>">Next</button></td>
						</tr>
					</table>
					<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
						type="hidden" name="pageSize" value="<%=pageSize%>">
				</div>


			</div>
			<br>
			<!-- /.row -->


		</form>
	</div>


	<jsp:include page="Footer.jsp"></jsp:include>

</div>

<!-- /.container -->
