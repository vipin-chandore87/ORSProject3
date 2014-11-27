<!-- Bootstrap core CSS -->
<%@page import="in.co.sunrays.proj3.dto.UserDTO"%>
<%@page import="in.co.sunrays.proj3.controller.ORSView"%>

<link rel="shortcut icon" href="img/favicon.ico">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="img/apple-touch-icon-114x114.png">

<link href="/ORSProject3/css/bootstrap.css" rel="stylesheet">
<link href="/ORSProject3/css/modern-business.css" rel="stylesheet">
<link href="/ORSProject3/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

<script src="/ORSProject3/js/jquery-1.10.2.js"></script>
<script src="/ORSProject3/js/bootstrap.js"></script>
<script src="/ORSProject3/js/modern-business.js"></script>


<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 10px;
}

/* To keep short panes open decently tall */
.tab-pane {
	min-height: 500px;
}
</style>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header" style="padding-top: 0px; font-size: 30px;">
			<div class="container">
				
			</div>
		</div>
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav pull-right">
			<%
				UserDTO user = (UserDTO) session.getAttribute("user");
				if (user != null) {
					if (user.getRoleId() == 4) {
			%>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">USER <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="<%=ORSView.USER_CTL%>">ADD USER</a></li>
						<li><a href="<%=ORSView.USER_LIST_CTL%>">USER LIST</a></li>

					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">MARKSHEET <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="<%=ORSView.MARKSHEET_CTL%>">Add Marksheet</a></li>
						<li><a href="<%=ORSView.MARKSHEET_LIST_CTL%>">Marksheet
								List</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">PROFILE <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="<%=ORSView.MY_PROFILE_CTL%>">My Profile</a></li>
						<li><a href="<%=ORSView.CHANGE_PASSWORD_CTL%>">Change
								Password</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">COLLEGE <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="<%=ORSView.COLLEGE_CTL%>">Add College</a></li>
						<li><a href="<%=ORSView.COLLEGE_LIST_CTL%>">College List</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">STUDENT <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="<%=ORSView.STUDENT_CTL%>">Add Student</a></li>
						<li><a href="<%=ORSView.STUDENT_LIST_CTL%>">Student List</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">ROLE <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="<%=ORSView.ROLE_CTL%>">Add Role</a></li>
						<li><a href="<%=ORSView.ROLE_LIST_CTL%>">Role List</a></li>

					</ul></li>
				<li><a href="<%=ORSView.GET_MARKSHEET_CTL%>">GET MARKSHEET</a></li>
				<li><a href="<%=ORSView.LOGIN_CTL%>?operation=logout">LOGOUT</a></li>
				<%
					}
						if (user.getRoleId() == 3) {
				%>

				<li><a href="<%=ORSView.FORGET_PASSWORD_CTL%>"><b>FORGET
							PASSWORD</b></a></li>
				<li><a href="<%=ORSView.GET_MARKSHEET_CTL%>"><b>GET
							MARKSHEET</b></a></li>
				<li><a href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>"><b>MARKSHEET
							MERIT LIST</b></a></li>
				<li><a href="<%=ORSView.MY_PROFILE_CTL%>"><b>MY PROFILE</b></a></li>
				<li><a href="<%=ORSView.CHANGE_PASSWORD_CTL%>"><b>CHANGE
							PASSWORD</b></a></li>
				<li><a href="<%=ORSView.JAVA_DOC_VIEW%>"><b>JAVA DOC</b></a></li>
				<li><a href="<%=ORSView.LOGIN_CTL%>?operation=logout"><b>LOGOUT</b></a></li>
			</ul>
			<%
				}
				} else {
			%><ul class="nav navbar-nav pull-right">
				<li><a href="<%=ORSView.LOGIN_CTL%>">SIGN IN</a></li>
				<li><a href="<%=ORSView.USER_REGISTRATION_CTL%>">SIGN UP</a></li>
			</ul>
			<%
				}
			%>

		</div>
	</div>
</nav>