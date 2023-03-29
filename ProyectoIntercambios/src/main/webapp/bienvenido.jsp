<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 
//aquí pongo todo el código java que quiera que mi servidor ejecute.

String usuario="";
try {  //AQUI VA EL CONTROL DE SESION
	usuario=session.getAttribute("attributo2").toString();
	String acceso = session.getAttribute("attributo1").toString();
 	if (!acceso.equals("1")) response.sendRedirect("usercheker2.jsp");
} catch (Exception e) {
	response.sendRedirect("usercheker2.jsp");
}
String rol="Usuario";
if(usuario.equals("admin")||usuario.equals("prueba"))
	rol="Administrador";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bienvenido</title>

<link rel="stylesheet" href="common/general.css">

</head>
<body style="background-image: url(images/fondoJuguetes3.jpg); background-repeat: no-repeat; background-size: cover;">
<h1>Bienvenido <%=usuario %></h1>
Sesión iniciada como <%=rol %>
<hr/>
<a href="verdatos.jsp">Acceder a tus Juguetes</a><br/>
<a href="disponibles.jsp">Acceder a los Juguetes Disponibles</a>
<%if(rol.equals("Administrador")){
	%><br><a href="AgregarPuntos.jsp">Agregar Puntos De Intercambio</a>
	<br><a href="AgregarTipo.jsp">Agregar Tipos de Juguetes</a>
<%}
%>
<br/><br/><a href="cerrarsesion.jsp">Salir</a>
</body>
</html>