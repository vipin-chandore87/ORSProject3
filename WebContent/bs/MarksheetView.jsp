
<%@page import="in.co.sunrays.proj3.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj3.util.HTMLUtility"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj3.controller.ORSView"%>
<%@page import="in.co.sunrays.proj3.util.DataUtility"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>

<jsp:include page="Header.jsp" />

<jsp:useBean id="dto" class="in.co.sunrays.proj3.dto.MarksheetDTO"
	scope="request"></jsp:useBean>

<%
	List l = (List) request.getAttribute("studentList");
%>
<!-- Page Content -->

<div class="container">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Marksheet</h1>
		</div>
	</div>
	<!-- /.row -->

	<div class="row">

		<div class="col-sm-8">
			<!-- Messege -->
			<label class="col-sm-10"><H2>
					<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
				</H2></label> <label class="col-sm-10"><H2>
					<font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>
				</H2></label>
			<!-- Messege -->

			<form action="<%=ORSView.MARKSHEET_CTL%>">
				<input type="hidden" name="id" value="<%=dto.getId()%>">

					<div class="form-group col-lg-7">
						<label for="rollNo">Roll No * :</label> <input type="text"
							name="rollNo" class="form-control"
							value="<%=DataUtility.getStringData(dto.getRollNo())%>"
							placeholder="Enter Roll No."> <label class="col-sm-8 "><h5
								style="color: red;"><%=ServletUtility.getErrorMessage("rollNo", request)%></h5></label>
					</div>
					
					<div class="form-group col-lg-7">
						<label for="name">Name * :</label>
						<%=HTMLUtility.getList("studentId",
					    String.valueOf(dto.getStudentId()), l)%>

					</div>
					
					<div class="form-group col-lg-7">
						<label for="physics">Physics :</label> <input type="text"
							name="physics" class="form-control"
							value="<%=DataUtility.getStringData(dto.getPhysics())%>"
							placeholder="Enter Physice No."> <label class="col-sm-8 "><h5
								style="color: red;">
								<%=ServletUtility.getErrorMessage("physics", request)%></h5></label>
					</div>
					
					<div class="form-group col-lg-7">
						<label for="chemistry">Chemistry :</label> <input type="text"
							name="chemistry" class="form-control"
							value="<%=DataUtility.getStringData(dto.getChemistry())%>"
							placeholder="Enter Chemistry No."> <label
							class="col-sm-8 "><h5 style="color: red;">
								<%=ServletUtility.getErrorMessage("chemistry", request)%></h5></label>
					</div>
					
					<div class="form-group col-lg-7">
						<label for="maths">Maths :</label> <input type="text" name="maths"
							class="form-control"
							value="<%=DataUtility.getStringData(dto.getMaths())%>"
							placeholder="Enter Maths No."> <label class="col-sm-8 "><h5
								style="color: red;"><%=ServletUtility.getErrorMessage("maths", request)%></h5></label>
					</div>

					<div class="form-group col-lg-8">
						<button type="submit" class="btn btn-primary" name="operation"
							value="<%=BaseCtl.OP_SAVE%>">Save</button>
						<%
							if (dto.getId() > 0) {
						%>
						<button type="submit" class="btn btn-primary" name="operation"
							value="<%=BaseCtl.OP_DELETE%>">Delete</button>
						<%
							}
						%>
						<button type="submit" class="btn btn-primary" name="operation"
							value="<%=BaseCtl.OP_CANCEL%>">Cancel</button>
					</div>
			</form>
		</div>
</div>
	<!-- /.row -->

	<%@ include file="Footer.jsp"%>

</div>
<!-- /.container -->

