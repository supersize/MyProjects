<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="veiwport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/myCustom.css">
<title>글작성</title>
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
				<li><a href="main.jsp">메인</a> </li>
				<li class="active"><a href="list.do">게시판</a> </li>
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
		<div class="row">
		<form action="write.do" method="post">
				<table class="table table-striped" style="text-align: center;  border="1px solid #dddddd "
				width="500" cellpadding="0" cellspacing="0">
				<thead>
					<tr>
						<td colspan="2" style="background-color: #eeeeee; text-align: center" >게시판 글쓰기</td>
				</thead>
				<tbody>
					</tr>
					<tr>
						<td><input type="text" class="form-control" placeholder="글제목" name="title" maxlength="50">${dto.bId}</td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글내용" name="content" maxlength="2048" style="height: 350px">${dto.bId}</textarea></td>
					</tr>
					</tbody>
				</table>
				<a href="list.do" class = "btn btn-primary">목록가기</a>
				<input type="submit" href="write_view.do" class="btn btn-primary pull-right" value="작성완료">
			</form>
		</div>
	</div>
</body>
</html>