<%@page import="dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="dto.Dto" scope="page"/>
<<jsp:setProperty property="*" name="dto"/>
<%
	String id = (String)session.getAttribute("id");
	dto.setId(id);
	
	Dao dao = Dao.getDao();
	int ri = dao.updateMember(dto);
	
	if(ri==0){
%>
	<script language="javascript">
		alert("정보수정을 실패했습니다.");
		history.go(-1);
	</script>
<%
	}else{
%>
	
	<script language="javascript">
		alert("정보수정이 완료되었습니다.");
		document.location.href="main.jsp";
	</script>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
</head>
<body>

</body>
</html>