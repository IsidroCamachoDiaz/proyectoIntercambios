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
	
	<div class="col-12">
						<div class="row">
						<div class="col-md-4 col-sm-6" >
							<div class="card espacio">
								<img class="card-img-top" src="images/juguete1.jpg">
								<div class=" card-body">
									<p class="card-text cen1v2" style="text-align: center;">Mis Juguetes</p>
									<p class="card-text"><strong>Acceder a mis Juguetes</strong></p>
									<div class="cen1"  style="text-align: center;">
										<a class="btn btn-dark" href="verdatos.jsp">Juguetes</a>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-4 col-sm-6">
							<div class="card espacio">
								<img class="card-img-top" src="canales.jpg">
								<div class=" card-body">
									<p class="card-text cen1v2" style="text-align: center;">Juguetes Disponibles</p>
									<p class="card-text"><strong>Juguetes disponibles para hacer intercambio</strong></p>
									<div class="cen1"  style="text-align: center;">
										<a class="btn btn-dark" href="disponibles.jsp">Disponibles</a>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-4 col-sm-6">
							<div class="card espacio">
								<img class="card-img-top" src="resultados.jpg">
								<div class=" card-body">
									<p class="card-text cen1v2" style="text-align: center;">Intercambios Pendientes</p>
									<p class="card-text"><strong>Tus intercambios con fecha pendiente</strong></p>
									<div class="cen1"  style="text-align: center;">
										<a class="btn btn-dark" href="IntercambiosPropios.jsp">Pendientes</a>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-4 col-sm-6">
							<div class="card espacio">
								<img class="card-img-top" src="debate.jpg">
								<div class=" card-body">
									<p class="card-text cen1v2" style="text-align: center;">Intercambios Terminados</p>
									<p class="card-text"><strong>Intercambios que ya has terminado</strong></p>
									<div class="cen1"  style="text-align: center;">
										<a class="btn btn-dark" href="IntercambiosTerminados.jsp">Terminado</a>
									</div>
								</div>
							</div>
						</div>

      	<%if(rol.equals("Administrador")){
		%>
		<div class="col-md-4 col-sm-6">
							<div class="card espacio">
								<img class="card-img-top" src="debate.jpg">
								<div class=" card-body">
									<p class="card-text cen1v2" style="text-align: center;">Agregar Puntos</p>
									<p class="card-text"><strong>Agregar Puntos Intercambios</strong></p>
									<div class="cen1"  style="text-align: center;">
										<a class="btn btn-dark" href="AgregarPuntos.jsp">Agregar Puntos</a>
									</div>
								</div>
							</div>
						</div>
		<div class="col-md-4 col-sm-6">
							<div class="card espacio">
								<img class="card-img-top" src="debate.jpg">
								<div class=" card-body">
									<p class="card-text cen1v2" style="text-align: center;">Agregar Tipos</p>
									<p class="card-text"><strong>Agregar Tipos de Juguetes</strong></p>
									<div class="cen1"  style="text-align: center;">
										<a class="btn btn-dark" href="AgregarTipo.jsp">Agregar Tipos</a>
									</div>
								</div>
							</div>
						</div>
		<div class="col-md-4 col-sm-6">
							<div class="card espacio">
								<img class="card-img-top" src="debate.jpg">
								<div class=" card-body">
									<p class="card-text cen1v2" style="text-align: center;">Borrar Usuario</p>
									<p class="card-text"><strong>Borrar usuarios</strong></p>
									<div class="cen1"  style="text-align: center;">
										<a class="btn btn-dark" href="BorrarUsuario.jsp">Borrar Usuarios</a>
									</div>
								</div>
							</div>
						</div>
		<div class="col-md-4 col-sm-6">
							<div class="card espacio">
								<img class="card-img-top" src="debate.jpg">
								<div class=" card-body">
									<p class="card-text cen1v2" style="text-align: center;">Estadisticas</p>
									<p class="card-text"><strong>Estadisticas generales</strong></p>
									<div class="cen1"  style="text-align: center;">
										<a class="btn btn-dark" href="Estadisticas.jsp">Estadisticas</a>
									</div>
								</div>
							</div>
						</div>
	<%}
	%>
    	</div>
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