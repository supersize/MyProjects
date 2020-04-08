<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="veiwport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/myCustom.css">
<title>메인 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<body>
	<% String id = (String)session.getAttribute("name"); %>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
				data-target='#bs-example-navbar-collapse-1' aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">김재형의 게시판</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a> </li>
				<li><a href="list.do">게시판</a> </li>
			</ul>
			<%
				if(id == null){
			%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="login.jsp">로그인</a> </li>
							<li><a href="join.jsp">회원가입</a> </li>
						</ul>
					</li>
				</ul>
			<%
				}else{
			%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">회원관리<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="logout.jsp">로그아웃</a> </li>
							<li><a href="member_delete.jsp">탈퇴하기</a> </li>
							<li><a href="member_modify.jsp">회원정보수정</a> </li>
							<li><a href="membersAll.do">전체회원보기</a> </li>
						</ul>
					</li>
				</ul>
			<%
				}
			%>
		</div>
	</nav>
	<div class="container">
			<div class="container">
				<div class="jumbotron" style="padding-top:20px;">
					<%
						if(id != null){					
					%>
						<h1 style="text-align: center;">
							<%= id %>님 환영합니다.
						</h1><br>
						<p style="text-align: center;">이 사이트는 김재형의 게시판 입니다. 방문해 주셔서 감사합니다.</p>
					<%}else{ %>
						<h1 style="text-align: center;">
							환영합니다!<br>
						</h1>
						<h3 style="text-align: center;">
							<br>로그인 하시면<br> 게시판 기능을<br> 사용하실수 있습니다.
						</h3>
					<% }%>
				</div>
			</div>
		<div class="col-lg-4"></div>
	</div> 
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="img/1.jpg">
				</div>
				<div class="item">
					<img src="img/3.jpg">
				</div>
				<div class="item">
					<img src="img/2-me.jpg">
				</div>
				<div class="item">
					<img src="img/4.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
</body>
</html>