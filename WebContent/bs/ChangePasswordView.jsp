
<%@page import="in.co.sunrays.proj3.controller.ChangePasswordCtl"%>
<%@page import="in.co.sunrays.proj3.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj3.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj3.controller.ORSView"%>
<%@page import="in.co.sunrays.proj3.util.DataUtility"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>

<jsp:include page="Header.jsp" />

<jsp:useBean id="dto" class="in.co.sunrays.proj3.dto.UserDTO"
	scope="request"></jsp:useBean>
<!-- Page Content -->

<div class="container">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Change Password</h1>
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

			<form action="<%=ORSView.CHANGE_PASSWORD_CTL%>">
				<input type="hidden" name="id" value="<%=dto.getId()%>">
				
					<div class="form-group col-lg-7">
						<label for="OldPassword">Old Password * :</label> <input
							type="password" name="oldPassword" class="form-control"
							value="<%=DataUtility.getStringData(request
					.getParameter("oldPassword") == null ? "" : DataUtility
					.getString(request.getParameter("oldPassword")))%>"
							placeholder="Enter OldPassword"> <label class="col-sm-8 "><h5
								style="color: red;"><%=ServletUtility.getErrorMessage("oldPassword", request)%></h5></label>
					</div>

					<div class="form-group col-lg-7">
						<label for="newPassword">New Password * :</label> <input
							type="password" name="newPassword" class="form-control"
							value="<%=DataUtility.getStringData(request
					.getParameter("newPassword") == null ? "" : DataUtility
					.getString(request.getParameter("newPassword")))%>"
							placeholder="Enter NewPassword"> <label class="col-sm-8 "><h5
								style="color: red;"><%=ServletUtility.getErrorMessage("newPassword", request)%></h5></label>
					</div>
					
					<div class="form-group col-lg-7">
						<label for="confirmPassword">Confirm Password * :</label> <input
							type="password" name="confirmPassword" class="form-control"
							value="<%=DataUtility.getStringData(request
					.getParameter("confirmPassword") == null ? "" : DataUtility
					.getString(request.getParameter("confirmPassword")))%>"
							placeholder="Enter ConfirmPassword"><label
							class="col-sm-8 "><h5 style="color: red;"><%=ServletUtility
					.getErrorMessage("confirmPassword", request)%></h5></label>
					</div>

				<div class="form-group col-lg-6">
					<button type="submit" class="btn btn-primary" name="operation" value="<%=ChangePasswordCtl.OP_CHANGE_MY_PROFILE%>">Change
						My Profile</button>
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

