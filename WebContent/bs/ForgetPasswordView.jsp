<%@page import="in.co.sunrays.proj3.controller.BaseCtl"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj3.controller.ORSView"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.sunrays.proj3.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj3.util.DataUtility"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>
<jsp:useBean id="dto" class="in.co.sunrays.proj3.dto.UserDTO"
	scope="request"></jsp:useBean>
<jsp:include page="Header.jsp" />
<!-- Page Content -->

<div class="container">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Forget your Password</h1>
		</div>
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-sm-8">
			<form action="<%=ORSView.FORGET_PASSWORD_CTL%>">
				<input type="hidden" name="id" value="<%=dto.getId()%>">

				<div class="form-group col-sm-10">
					<div>
						<h4>Submit your email address and we'll send your password.</h4>
					</div>
					<br> <label for="login" class="col-sm-2 control-label">Email
						Id:</label>
					<div class="col-sm-8">
						<input type="login" class="form-control" name="login"
							value="<%=ServletUtility.getParameter("login", request)%>"
							placeholder="Enter Email Id"> <label class="col-sm-10"><h3
								style="color: red;"><%=ServletUtility.getErrorMessage("login", request)%></h3></label>
						<label class="col-sm-10"></label>
						<!-- Messege -->
						<H4>
							<font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>
						</H4>
						<!-- Messege -->
					</div>
					<div>
						<button type="submit" class="btn btn-primary" value="<%=BaseCtl.OP_GO%>"
							name="operation">Go</button>
					</div>
			</form>
		</div>
	</div>
	<!-- /.row -->

</div>
<!-- /.container -->
<jsp:include page="Footer.jsp"></jsp:include>