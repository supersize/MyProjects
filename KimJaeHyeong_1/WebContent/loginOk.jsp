<%@page import="dto.Dto"%>
<%@page import="dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- loginOk는 계정(아이디,비밀번호)가 있는지 없는지, 비밀번호가 일치하는지 안하는지 확인 -->
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
<%
	Dao dao = Dao.getDao();

	if(id == "" || pw == ""){
%>
		<script language="javascript">
			alert("빈칸을 입력해주세요.")
			history.back();
		</script>
<%
	}else if(dao.userCheck(id, pw)==-1){
%>
 		<script language="javascript">
			alert("존재하지 않는 아이디입니다.")
			history.back();
		</script>
<%
	}else if(dao.userCheck(id, pw)==0){
%>
		<script language="javascript">
			alert("비밀번호가 틀렸습니다.")
			history.back();
		</script>
<%
	}else{
		Dto dto = dao.getMember(id);
		session.setAttribute("id", dto.getId());
		session.setAttribute("pw", dto.getPw());
		session.setAttribute("name", dto.getName());
		session.setAttribute("eMail", dto.geteMail());
		session.setAttribute("rDate", dto.getrDate());
		session.setAttribute("address", dto.getAddress());
%>
		<script language="javascript">
			document.location.href='main.jsp'
 		</script>
<%
	}
%>
</body>
</html>