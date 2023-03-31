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

try {
	db.conectarBD();
	okdb = true;
} catch (Exception e) {
	okdb = false;
	//e.printStackTrace();
}
if (okdb) {
	
		String query="SELECT J.NOMBRE,J.ESTADO,I.FECHA_ENTREGA,I.FECHA_RECOGIDA FROM INTERCAMBIOS I JOIN USUARIOS U ON (I.ID_USUARIO_1=U.ID_USUARIO) JOIN JUGUETES J ON (I.ID_JUGUETE_USUARIO_1=J.ID_JUGUETE) WHERE CORREO='"+session.getAttribute("attributo2")+"' AND FECHA_RECOGIDA NOT IS NULL;";
		String [][] tablares = db.resConsultaSelectA3(query);
	if (tablares != null) {
		resultado = "<table style='border: 1px solid black; margin: auto; border-collapse: collapse;>";
		for (int i=0; i<tablares.length;i++) { //g es una variable tipo grupo que va recorriendo la lista
			resultado += "<tr style='border: 1px solid black;'>";
			resultado += "<td style='border: 1px solid black;'>" + tablares[i][0] + "</td>";
			resultado += "<td style='border: 1px solid black;'>" + tablares[i][1] + "</td>";
			resultado += "<td style='border: 1px solid black;'>" + tablares[i][2] + "</td>";
			resultado += "<td style='border: 1px solid black;'>" + tablares[i][3] + "</td>";
			resultado += "</tr>";
		}
		resultado += "</table>";
	}
	else{
		resultado = "<div style='color: darkred; font-weight: bold;'>NO HAY NINGUN INTERCAMBIO TERMINADO</div>";
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
<h1>INTERCAMBIOS TERMINADOS:</h1>
<hr/>
<p><a href="bienvenido.jsp">Página principal</a></p>
<p><a href="cerrarsesion.jsp">Salir</a></p>
<hr/>
<h3>Intercambios Terminados</h3>
<%=resultado %>

<div id="contenedor1">
</div>
</body></html>