
<%@page import="in.co.sunrays.proj3.controller.MyProfileCtl"%>
<%@page import="in.co.sunrays.proj3.controller.BaseCtl"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj3.controller.ORSView"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.sunrays.proj3.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj3.util.DataUtility"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>

<jsp:include page="Header.jsp" />
<jsp:useBean id="dto" class="in.co.sunrays.proj3.dto.UserDTO"
	scope="request"></jsp:useBean>

<%
	List l = (List) request.getAttribute("roleList");
%>

<!-- Page Content -->

<div class="container">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">My Profile</h1>
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

			<form action="<%=ORSView.MY_PROFILE_CTL%>">

				<input type="hidden" name="id" value="<%=dto.getId()%>">

				<div class="form-group col-lg-7">
					<label for="login">Login Id * :</label> <input type="login"
						name="login" class="form-control"
						value="<%=DataUtility.getStringData(dto.getLogin())%>"
						readonly="readonly"> <label class="col-sm-8 "></label>
				</div>

				<div class="form-group col-lg-7">
					<label for="firstName">First Name * :</label> <input type="text"
						name="firstName" class="form-control"
						value="<%=DataUtility.getStringData(dto.getFirstName())%>"
						placeholder="Enter First Name"> <label class="col-sm-8 "><h5
							style="color: red;"><%=ServletUtility.getErrorMessage("firstName", request)%></h5></label>
				</div>
				<div class="form-group col-lg-7">
					<label for="lastName">Last Name * :</label> <input type="text"
						name="lastName" class="form-control"
						value="<%=DataUtility.getStringData(dto.getLastName())%>"
						placeholder="Enter Last Name"> <label class="col-sm-8 "><h5
							style="color: red;">
							<%=ServletUtility.getErrorMessage("lastName", request)%></h5></label>
				</div>



				<div class="form-group col-lg-7">
					<label for="gender">Gender :</label>
					<%
						HashMap map = new HashMap();
						map.put("M", "Male");
						map.put("F", "Female");

						String htmlList = HTMLUtility.getList("gender", dto.getGender(),
								map);
					%>
					<%=htmlList%>
				</div>


				<div class="form-group col-lg-7">
					<label for="mobileNo">PhoneNo* :</label> <input type="text"
						name="mobileNo" class="form-control"
						value="<%=DataUtility.getStringData(dto.getMobileNo())%>"
						placeholder="Enter PhoneNo."> <label class="col-sm-8 "><h5
							style="color: red;"><%=ServletUtility.getErrorMessage("mobileNo", request)%></h5></label>
				</div>
				<div class="form-group col-lg-7">
					<label for="dob">Date Of Birth :</label> <input type="text"
						name="dob" class="form-control"
						value="<%=DataUtility.getDateString(dto.getDob())%>"
						placeholder="Enter Date of Birth"> <label
						class="col-sm-8 "><h5 style="color: red;"><%=ServletUtility.getErrorMessage("dob", request)%></h5></label>
				</div>


				<div class="form-group col-lg-8">
					<button type="submit" class="btn btn-primary" name="operation"
						value="<%=MyProfileCtl.OP_CHANGE_MY_PASSWORD%>">Change
						Password</button>
					<button type="submit" class="btn btn-primary" name="operation"
						value="<%=BaseCtl.OP_SAVE%>">Save</button>
				</div>

		</form>
	</div>



</div>
<!-- /.row -->

<jsp:include page="Footer.jsp"></jsp:include>

</div>
<!-- /.container -->
