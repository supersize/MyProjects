<%@page import="dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	Dao dao = Dao.getDao();
	dao.deleteMember(id);
%>
	<script language="javascript">
		alert("탈퇴가 완료 되었습니다.");
		document.location.href='logout.jsp'
	</script>
<%
// 	response.sendRedirect("login.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/myCustom.css">
<title>회원탈퇴</title>
</head>
<body>
	
</body>
</html>