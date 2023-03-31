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

<link rel="stylesheet" href="./common/general.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body style="background-image: url(images/fondoJuguetes3.jpg);background-size: cover; text-decoration: none;">
<div class="container-fluid">
<div class="row">
	<div class="col-sm-12">
	 <div class="row">
    <div class="col-sm-6">
	<h1>Bienvenido <%=usuario %></h1>
	Sesión iniciada como <%=rol %>
	</div>
	<div class="col-sm-6" style="color: #EE2DD4;">
	<br><br>
	<a href="ModificarCuenta.jsp" style="color: #EE2DD4;">Modificar Perfil</a><br/>
	</div>
	</div>
	<hr/>

	</div>
    <div class="col-sm-6" style="color: #EE2DD4;">
      	<a href="verdatos.jsp" style="color: #EE2DD4;">Acceder a tus Juguetes</a><br/>
		<a href="disponibles.jsp" style="color: #EE2DD4;">Acceder a los Juguetes Disponibles</a><br>
		<a href="IntercambiosPropios.jsp" style="color: #EE2DD4;">Acceder a los Intercambios Pendientes</a><br>
		<a href="IntercambiosTerminados.jsp" style="color: #EE2DD4;">Acceder a los Intercambios Terminados</a>
		</div>

    <div class="col-sm-6">
      	<%if(rol.equals("Administrador")){
		%><a href="AgregarPuntos.jsp" style="color: #EE2DD4;">Agregar Puntos De Intercambio</a>
		<br><a href="AgregarTipo.jsp" style="color: #EE2DD4;">Agregar Tipos de Juguetes</a>
		<br><a href="BorrarUsuario.jsp" style="color: #EE2DD4;">Borrar Usuarios</a>
		<br><a href="Estadisticas.jsp" style="color: #EE2DD4;">Estadisticas</a>
	<%}
	%>
    </div>
</div>
    <div class="row text-center">
    <div class="col-sm-12">
    <br/><br/><a href="cerrarsesion.jsp" id="salida" style="color: #EE2DD4;">Salir</a>
     </div>
   </div>

</div>

</body>
</html>