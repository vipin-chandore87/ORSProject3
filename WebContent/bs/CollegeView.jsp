
<%@page import="in.co.sunrays.proj3.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj3.util.HTMLUtility"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj3.controller.ORSView"%>
<%@page import="in.co.sunrays.proj3.util.DataUtility"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>

<jsp:include page="Header.jsp" />

<jsp:useBean id="dto" class="in.co.sunrays.proj3.dto.CollegeDTO"
	scope="request"></jsp:useBean>

<%
	List l = (List) request.getAttribute("studentList");
%>
<!-- Page Content -->

<div class="container">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">College</h1>
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

			<form action="<%=ORSView.COLLEGE_CTL%>">
				<input type="hidden" name="id" value="<%=dto.getId()%>">

				<div class="form-group col-lg-7">
					<label for="name">Name * :</label> <input type="text" name="name"
						class="form-control"
						value="<%=DataUtility.getStringData(dto.getName())%>"
						placeholder="Enter Name."><label class="col-sm-8 "><h5
							style="color: red;"><%=ServletUtility.getErrorMessage("name", request)%></h5></label>
				</div>

				<div class="form-group col-lg-7">
					<label for="address">Address * :</label> <input type="text"
						name="address" class="form-control"
						value="<%=DataUtility.getStringData(dto.getAddress())%>"
						placeholder="Enter Address."> <label class="col-sm-8 "><h5
							style="color: red;"><%=ServletUtility.getErrorMessage("address", request)%></h5></label>
				</div>

				<div class="form-group col-lg-7">
					<label for="state">State * :</label> <input type="text"
						name="state" class="form-control"
						value="<%=DataUtility.getStringData(dto.getState())%>"
						placeholder="Enter State."> <label class="col-sm-8 "><h5
							style="color: red;"><%=ServletUtility.getErrorMessage("state", request)%></h5></label>
				</div>


				<div class="form-group col-lg-7">
					<label for="city">City * :</label> <input type="text" name="city"
						class="form-control"
						value="<%=DataUtility.getStringData(dto.getCity())%>"
						placeholder="Enter City."> <label class="col-sm-8 "><h5
							style="color: red;"><%=ServletUtility.getErrorMessage("city", request)%></h5></label>
				</div>



				<div class="form-group col-lg-7">
					<label for="phoneNo">PhoneNo *:</label> <input type="text"
						name="phoneNo" class="form-control"
						value="<%=DataUtility.getStringData(dto.getPhoneNo())%>"
						placeholder="Enter PhoneNo."> <label class="col-sm-8 "><h5
							style="color: red;"><%=ServletUtility.getErrorMessage("phoneNo", request)%></h5></label>
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
	
	<jsp:include page="Footer.jsp"></jsp:include>

</div>
<!-- /.container -->


