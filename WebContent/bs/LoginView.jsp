<%@page import="in.co.sunrays.proj3.controller.LoginCtl"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj3.controller.ORSView"%>
<jsp:include page="Header.jsp" />
<!-- Page Content -->

<div class="container">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Login</h1>
		</div>
	</div>
	<!-- /.row -->

	<div class="row">

		<div class="col-sm-8">
			<!-- Messege -->
			<label class="col-sm-10"><h2>
					<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
				</h2></label> <label class="col-sm-10"><h2>
					<font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>
				</h2></label>
			<!-- Messege -->

			<form action="<%=ORSView.LOGIN_CTL%>">
					
					<div class="form-group col-lg-7">
						<label for="login">User Id * :</label> <input type="text"
							name="login" class="form-control" placeholder="Enter Login Id">
						<label class="col-sm-8"><h5 style="color: red;"><%=ServletUtility.getErrorMessage("login", request)%></h5></label>
					</div>
					
					<div class="form-group col-lg-7">
						<label for="password">Password * :</label> <input type="password"
							name="password" class="form-control" placeholder="Enter Password">
						<label class="col-sm-8"><h5 style="color: red;"><%=ServletUtility.getErrorMessage("password", request)%></h5></label>
					</div>

					<div class="form-group col-lg-7">
						<button role="button" class="btn btn-primary btn-small"
							type="submit" name="operation" value="<%=LoginCtl.OP_SIGN_IN%>">Sign In</button>
						<button role="button" class="btn btn-primary btn-small"
							type="submit" name="operation" value="<%=LoginCtl.OP_SIGN_UP%>">Sign Up</button>
						<a href="<%=ORSView.FORGET_PASSWORD_CTL%>">Forget My Password</a>
					</div>
			
			</form>
		</div>



	</div>
	<!-- /.row -->
	
	<jsp:include page="Footer.jsp"></jsp:include>

</div>
<!-- /.container -->

