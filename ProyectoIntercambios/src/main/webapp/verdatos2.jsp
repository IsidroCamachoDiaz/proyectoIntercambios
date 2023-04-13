<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="mipk.beanDB"%>
<%@page import="java.sql.SQLException"%>

<%
try {  //AQUI VA EL CONTROL DE SESION
	String acceso = session.getAttribute("attributo1").toString();
 	if (!acceso.equals("1")) response.sendRedirect("cerrarsesion.jsp");
} catch (Exception e) {
	response.sendRedirect("cerrarsesion.jsp");
}
beanDB db = new beanDB();
boolean okdb = false;
String resultado = "";

try {
	db.conectarBD();
	okdb = true;
} catch (Exception e) {
	okdb = false;
	//e.printStackTrace();
}
if (okdb) {
	
		String query="SELECT J.NOMBRE,J.ESTADO,J.ID_JUGUETE FROM JUGUETES J JOIN USUARIOS U ON (J.ID_USUARIO=U.ID_USUARIO) WHERE U.CORREO='"+session.getAttribute("attributo2")+"';";
		String [][] tablares = db.resConsultaSelectA3(query);
%>
<html>
<head>

<link rel="stylesheet" href="common/general.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body style="background-image: url(images/fondo2.jpg);">
<div class="col-12">
			<div class="row">
				<div class=col-sm-12>
				
					<h1><%=session.getAttribute("attributo2") %> sus Juguetes:</h1>
					<hr/>
				<ul class="nav">
					  <li class="nav-item">
					    <a class="nav-link active" href="bienvenido.jsp" style="color: #EE2DD4;">Página principal</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="HacerIntercambio.jsp" style="color: #EE2DD4;">Hacer Intercambio</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="AgregarJuguete.jsp" style="color: #EE2DD4;">Agregar Juguete</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="ModificarJuguete.jsp" style="color: #EE2DD4;">Modificar Juguete</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="cerrarsesion.jsp" style="color: #EE2DD4;">Salir</a>
					  </li>
				</ul>		
					<hr/>
				</div>

<%if (tablares != null) { 
	for (int i=0;i<tablares.length;i++) {
%>
						<div class="col-md-4 col-sm-6" >
							<div class="card espacio" style="background:pink;">
								<div class=" card-body">
									<p class="card-text cen1v2" style="text-align: center;"><%=tablares[i][0]%></p>
									<p class="card-text"><strong>Estado: <%=tablares[i][1]%> ID: <%=tablares[i][2]%></strong></p>
									<div class="cen1"  style="text-align: center;">
										<a class="btn btn-light" href="HacerIntercambio.jsp">Intercambiar Juguete</a>
									</div>
								</div>
							</div>
						</div>
<%
}
	db.desconectarBD();
	}
else {%>
	<div class="col-md-12 col-sm-12" >
							<div class="card espacio" style="background:red;">
								<div class=" card-body">
									<p class="card-text cen1v2" style="text-align: center;"></p>
									<p class="card-text" style="text-align: center;"><strong>No Tiene Ningun Juguete Registrado</strong></p>
									<div class="cen1"  style="text-align: center;">
										<a class="btn btn-light" href="AgregarJuguete.jsp">Agregar juguete</a>
									</div>
								</div>
							</div>
						</div>
<%} %>	
<% }

else {%>
	<div class="col-md-12 col-sm-12" >
							<div class="card espacio" style="background:red;">
								<div class=" card-body">
									<p class="card-text cen1v2" style="text-align: center;"></p>
									<p class="card-text" style="text-align: center;"><strong>No e pudo conectar con la base de datos</strong></p>
									<div class="cen1"  style="text-align: center;">
										<a class="btn btn-light" href="bienvenido.jsp">Volver</a>
									</div>
								</div>
							</div>
						</div>
<%} %>						
					</div>
				</div>


<div id="contenedor1">
</div>
</body></html>