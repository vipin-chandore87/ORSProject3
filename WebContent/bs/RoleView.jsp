
<%@page import="in.co.sunrays.proj3.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj3.util.HTMLUtility"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj3.controller.ORSView"%>
<%@page import="in.co.sunrays.proj3.util.DataUtility"%>
<%@page import="in.co.sunrays.proj3.util.ServletUtility"%>

<jsp:include page="Header.jsp" />

<jsp:useBean id="dto" class="in.co.sunrays.proj3.dto.RoleDTO"
	scope="request"></jsp:useBean>

<!-- Page Content -->

<div class="container">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Role</h1>
		</div>
	</div>
	<!-- /.row -->

	<div class="row">
		<div class="col-sm-8">
			<!-- Messege -->
			<label class="col-sm-10"><H2>
					<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
				</H2></label>
			<label class="col-sm-10"><H2>
					<font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>
				</H2></label>
			<!-- Messege -->

			<form action="<%=ORSView.ROLE_CTL%>">
				<input type="hidden" name="id" value="<%=dto.getId()%>">

				<div class="form-group col-lg-7">
					<label for="name">Name * :</label> <input type="text" name="name"
						class="form-control"
						value="<%=DataUtility.getStringData(dto.getName())%>"
						placeholder="Enter Name."> <label class="col-sm-8 "><h5
							style="color: red;"><%=ServletUtility.getErrorMessage("name", request)%></h5></label>
				</div>

				<div class="form-group col-lg-7">
					<label for="description">Description * :</label> <input type="text"
						name="description" class="form-control"
						value="<%=DataUtility.getStringData(dto.getDescription())%>"
						placeholder="Enter Description"> <label class="col-sm-8"><h5
							style="color: red;"><%=ServletUtility.getErrorMessage("description", request)%></h5></label>
				</div>

				<div class="form-group col-lg-8">
					<button type="submit" class="btn btn-primary" name="operation"
						value="<%=BaseCtl.OP_SAVE%>">Save</button>
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

