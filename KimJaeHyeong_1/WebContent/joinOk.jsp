<%@page import="dao.Dao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %> 
<!-- joinOk는 DAO에서 insert해주기위한 jsp -->

<jsp:useBean id="dto" class="dto.Dto"/>
<jsp:setProperty property="*" name="dto"/>

<% 
	dto.setrDate(new Timestamp(System.currentTimeMillis()));
	
	Dao dao = Dao.getDao();
	
	if(dao.confirmMember(dto.getId())==0){
		if(dao.insertMember(dto)==0){
%>
			<script language="javascript">
				alert("회원가입을 실패했습니다.")
				document.location.href ='join.jsp'
			</script>
<%	
		}else{
			session.setAttribute("id", dto.getId());
%>
			<script language="javascript">
				alert("회원가입을 축하합니다.")
				document.location.href ='login.jsp'
			</script>
<%
		}
	}else{
%>
		<script language="javascript">
			alert("아이디가 이미 존재합니다.")
			history.back();
		</script>	
<%
	}
	
%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>

</body>
</html>