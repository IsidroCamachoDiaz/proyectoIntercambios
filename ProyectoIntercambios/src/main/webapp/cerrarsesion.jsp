<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<%
session.invalidate();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./common/general.css">
<title>Insert title here</title>
</head>
<body id="bb" style="background:linear-gradient(top, rgb(255, 255, 255), rgb(255, 0, 128));">
<h1 id="hh">Ha cerrado sesion Correctamente</h1>
<a href="index.jsp" style="color: white;">Volver</a>
</body>
</html>