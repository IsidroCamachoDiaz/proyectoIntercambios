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
	
		String query="SELECT J.NOMBRE,J.ESTADO,I.FECHA_ENTREGA FROM INTERCAMBIOS I JOIN USUARIOS U ON (I.ID_USUARIO_1=U.ID_USUARIO) JOIN JUGUETES J ON (I.ID_JUGUETE_USUARIO_1=J.ID_JUGUETE) WHERE CORREO='"+session.getAttribute("attributo2")+"' AND FECHA_RECOGIDA IS NULL;";
		
		String query2="SELECT I.FECHA_ENTREGA,U.NOMBRE,J.NOMBRE FROM INTERCAMBIOS I JOIN USUARIOS U ON (I.ID_USUARIO_1=U.ID_USUARIO)  JOIN JUGUETES J ON (I.ID_JUGUETE_USUARIO_1=J.ID_JUGUETE) WHERE CORREO='"+session.getAttribute("attributo2")+"' AND FECHA_RECOGIDA IS NULL;";
		String [][] tablares = db.resConsultaSelectA3(query2);
	if (tablares != null) {
		resultado = "<table style='border: 1px solid black; margin: auto; border-collapse: collapse;>";
		for (int i=0; i<tablares.length;i++) { //g es una variable tipo grupo que va recorriendo la lista
			resultado += "<tr style='border: 1px solid black;'>";
			resultado += "<td style='border: 1px solid black;'>" + tablares[i][0] + "</td>";
			resultado += "<td style='border: 1px solid black;'>" + tablares[i][1] + "</td>";
			resultado += "<td style='border: 1px solid black;'>" + tablares[i][2] + "</td>";
			resultado += "<td style='border: 1px solid black; color: red;'>FECHA RECOGIDA PENDIENTE</td>";
			resultado += "</tr>";
		}
		resultado += "</table>";
		
	}
	else{
		resultado = "<div style='color: darkred; font-weight: bold;'>NO HAY NINGUN INTERCAMBIO EN PROCESO</div>";
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
<h1><%=session.getAttribute("attributo2") %> sus Intercambios Actuales:</h1>
<hr/>
<p><a href="bienvenido.jsp">Página principal</a></p>
<p><a href="HacerIntercambio.jsp">Hacer Intercambio</a></p>
<%if(!resultado.equals("<div style='color: darkred; font-weight: bold;'>NO HAY NINGUN INTERCAMBIO EN PROCESO</div>)")){%>
<p><a href="TerminarIntercambio.jsp">Terminar Intercambio</a></p>
<%}%>
<p><a href="cerrarsesion.jsp">Salir</a></p>
<hr/>
<%=resultado %>
<div id="contenedor1">
</div>
</body></html>