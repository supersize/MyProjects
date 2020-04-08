<%@page import="dto.Dto"%>
<%@page import="dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String id = (String)session.getAttribute("id");
	Dao dao = Dao.getDao();
	Dto dto = dao.getMember(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="veiwport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/myCustom.css">
<title>회원 정보 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script language="javascript" src="prac.js"></script>
</head>
<body>
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
				<li><a href="list.do">게시판</a> </li>
			</ul>
			</ul>
			<%
				if(id == null){
			%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="logout.jsp">로그아웃</a> </li>
							<li><a href="member_delete.jsp">탈퇴하기</a> </li>
							<li><a href="member_modify.jsp">회원정보수정</a> </li>
							<li><a href="membersAll.do">전체회원보기</a> </li>
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
							<li><a href="logout.jsp">탈퇴하기</a> </li>
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
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top:20px;">
				<form action="member_modifyOk.jsp" method="post" name="reg_prac">
					<h3 style="text-align: center;">회 원 정 보 수 정</h3>
					<div class="form-group">
						<lable class="form-control" placeholder="아이디" name="id" maxlength="20"><%=dto.getId()%></lable>
					</div>
					
					<div class="form-group">
						<input type="password" class="form-control" placeholder="패스워드" name="pw" maxlength="20">
					</div>
					
					<div class="form-group">
						<input type="password" class="form-control" placeholder="패스워드확인" name="pw_check" maxlength="20">
					</div>
					
					<div class="form-group">
						<lable class="form-control" placeholder="이름" name="name" maxlength="20" ><%=dto.getName()%></lable>
					</div>
					
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="eMail" maxlength="30">
					</div>
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="주소" name="address" maxlength="50">
					</div>
					
					<input type="button" class="btn btn-primary form-control" value="수정완료" onclick="updateMember()">
					<br/><br/>
					<input type="reset" class="btn btn-primary form-control" value="취소" 
						onclick="javascript:window.location='./main.jsp'">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div> 
</body>
</html>