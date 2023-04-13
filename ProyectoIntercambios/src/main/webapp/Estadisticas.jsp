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
String resultado2 = "";
String resultado3="";

try {
	db.conectarBD();
	okdb = true;
} catch (Exception e) {
	okdb = false;
	//e.printStackTrace();
}
if (okdb) {
	
		String query="SELECT * FROM UsuariosMasIntercambios LIMIT 10;";
		String [][] tablares = db.resConsultaSelectA3(query);
	if (tablares != null) {
		resultado = "<table style='border: 1px solid black; margin: auto; border-collapse: collapse;>";
		for (int i=0; i<tablares.length;i++) { //g es una variable tipo grupo que va recorriendo la lista
			resultado += "<tr style='border: 1px solid black;'>";
			resultado += "<td style='border: 1px solid black;'>" + tablares[i][0] + "</td>";
			resultado += "<td style='border: 1px solid black;'>" + tablares[i][1] + "</td>";
			resultado += "</tr>";
		}
		resultado += "</table>";
		
	}

	query="SELECT * FROM UsuariosMasJuguetes LIMIT 10;";
	tablares = db.resConsultaSelectA3(query);
	if (tablares != null) {
		resultado2 = "<table style='border: 1px solid black; margin: auto; border-collapse: collapse;>";
		for (int i=0; i<tablares.length;i++) { //g es una variable tipo grupo que va recorriendo la lista
			resultado2 += "<tr style='border: 1px solid black;'>";
			resultado2 += "<td style='border: 1px solid black;'>" + tablares[i][0] + "</td>";
			resultado2 += "<td style='border: 1px solid black;'>" + tablares[i][1] + "</td>";
			resultado2 += "</tr>";
		}
		resultado2 += "</table>";
		
	}
	
	query="SELECT * FROM PuntosMasIntercambios LIMIT 10;";
	tablares = db.resConsultaSelectA3(query);
	if (tablares != null) {
		resultado3 = "<table style='border: 1px solid black; margin: auto; border-collapse: collapse;>";
		for (int i=0; i<tablares.length;i++) { //g es una variable tipo grupo que va recorriendo la lista
			resultado3 += "<tr style='border: 1px solid black;'>";
			resultado3 += "<td style='border: 1px solid black;'>" + tablares[i][0] + "</td>";
			resultado3 += "<td style='border: 1px solid black;'>" + tablares[i][1] + "</td>";
			resultado3 += "</tr>";
		}
		resultado3 += "</table>";
		
	}
	
	
	
	db.desconectarBD();
}

else {
	resultado = "<div style='color: darkred; font-weight: bold;'>ERROR: No se pudo conectar con la BBDD</div>";
}


%>
<html>
<head>

<link rel="stylesheet" href="common/general.css">

</head>
<body style="background-image: url(images/fondo2.jpg);">
<h1>Estadisticas:</h1>
<hr/>
<p><a href="bienvenido.jsp">Página principal</a></p>
<p><a href="cerrarsesion.jsp">Salir</a></p>
<hr/>
<h3>Usuarios Con Mas Intercambios</h3>
<%=resultado %>
<h3>Usuarios Con Mas Juguetes</h3>
<%=resultado2 %>
<h3>Lugares Con Mas Intercambios</h3>
<%=resultado3 %>
<div id="contenedor1">
</div>
</body></html>