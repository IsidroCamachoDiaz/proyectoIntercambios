<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<%@page import="mipk.beanDB"%>
<% 
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
	
		String query="SELECT T.NOMBRE,U.NOMBRE,U.ID_USUARIO,JD.NOMBRE,J.ESTADO FROM JuguetesDisponibles JD JOIN JUGUETES J ON (JD.ID_JUGUETE=J.ID_JUGUETE) JOIN USUARIOS U ON (J.ID_USUARIO=U.ID_USUARIO) JOIN TIPOS_JUGUETES T ON (J.ID_TIPO_JUGUETE=T.ID_TIPO);";
		String [][] tablares = db.resConsultaSelectA3(query);
	if (tablares != null) {
		resultado = "<table style='border: 1px solid black; margin: auto; border-collapse: collapse;> <tr style='border: 1px solid black;'><td style='border: 1px solid black;'>Tipo de Juguete</td><td style='border: 1px solid black;'>Nombre de Usuario</td><td style='border: 1px solid black;'>ID de Usuario</td><td style='border: 1px solid black;'>Nombre de Juguete</td><td style='border: 1px solid black;'>Estado del Juguete</td></tr>";
		for (int i=0; i<tablares.length;i++) { //g es una variable tipo grupo que va recorriendo la lista
			resultado += "<tr style='border: 1px solid black;'>";
			resultado += "<td style='border: 1px solid black;'>" + tablares[i][0] + "</td>";
			resultado += "<td style='border: 1px solid black;'>" + tablares[i][1] + "</td>";
			resultado += "<td style='border: 1px solid black;'>" + tablares[i][2] + "</td>";
			resultado += "<td style='border: 1px solid black;'>" + tablares[i][3] + "</td>";
			resultado += "<td style='border: 1px solid black;'>" + tablares[i][4] + "</td>";
			resultado += "</tr>";
		}
		resultado += "</table>";
	}
	else{
		resultado = "<div style='color: darkred; font-weight: bold;'>NO HAY NINGUN TIPO DE JUGUETE</div>";
	}
	db.desconectarBD();
}
else {
	resultado = "<div style='color: darkred; font-weight: bold;'>ERROR: No se pudo conectar con la BBDD</div>";
}
//----------------------------------------------------------------------------------------------------------------
String resultado2="";
try {
	db.conectarBD();
	okdb = true;
} catch (Exception e) {
	okdb = false;
	//e.printStackTrace();
}
if (okdb) {
	
		String query2="SELECT * FROM PUNTOS_INTERCAMBIO;";
		String [][] tablares2 = db.resConsultaSelectA3(query2);
	if (tablares2 != null) {
		resultado2 = "<table style='border: 1px solid black; margin: auto; border-collapse: collapse;>  <tr style='border: 1px solid black;'><td style='border: 1px solid black;'>ID del Lugar</td><td style='border: 1px solid black;'>Ciudad</td><td style='border: 1px solid black;'>Barrio</td></tr>";
		for (int i=0; i<tablares2.length;i++) { //g es una variable tipo grupo que va recorriendo la lista
			resultado2 += "<tr style='border: 1px solid black;'>";
			resultado2 += "<td style='border: 1px solid black;'>" + tablares2[i][0] + "</td>";
			resultado2 += "<td style='border: 1px solid black;'>" + tablares2[i][1] + "</td>";
			resultado2 += "<td style='border: 1px solid black;'>" + tablares2[i][2] + "</td>";
			resultado2 += "</tr>";
		}
		resultado2 += "</table>";
	}
	else{
		resultado = "<div style='color: darkred; font-weight: bold;'>NO HAY NINGUN TIPO DE JUGUETE</div>";
	}
	db.desconectarBD();
}
else {
	resultado = "<div style='color: darkred; font-weight: bold;'>ERROR: No se pudo conectar con la BBDD</div>";
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mi Primer Formulario</title>

<link rel="stylesheet" href="common/general.css">

<script type="text/javascript">
function compruebayenvia() {
	datos=document.iniciosesion;
	if (datos.idCambio.value == '' ||
			datos.usuario2.value == ''|| datos.nombrePedir.value==''||datos.idLugar.value==''||datos.fecha.value==''||datos.hora.value=='')
		alert ('¡Tiene que rellenar todos los campos!');
	else datos.submit();
}
function compruebanums(campo, evento) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (evento) keycode = evento.which;
	else return true;
	if (keycode < 48 || keycode > 57) //Rango ASCII de números
	{
		if (keycode != 8 && keycode != 27 && keycode != 0 ) { //Caracteres especiales permitidos
			alert('Sólo puede introducir números ');
			return false;
		}
		else return true;
	}
	else return true;
}
function compruebaalfan(campo, evento) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (evento) keycode = evento.which;
	else return true;
	if (( keycode < 48 || keycode > 57 ) && ( keycode < 64 || keycode > 90 ) && ( keycode < 97 || keycode > 122 )) //Rango ASCII de números y letras
	{
		 if (keycode == 13) {
			compruebayenvia();
		} else return true;
	} else {
		return true;
	}
}
</script>
</head>
<body style="background-image: url(images/fondoJuguetes.jpg);">

<h1 style="color: pink;">HACER INTERCAMBIO</h1>
<h3 style="color: pink;">DATOS DE LOS JUGUETES:</h3>
<%=resultado %>
<hr>
<h3 style="color: pink;">DATOS DE LOS LUGARES DE INTERCAMBIO:</h3>
<%=resultado2 %>
<form action="./HacerIntercambio" method="post" name="iniciosesion" id="iniciosesion">
<table style="text-align: left; border: none;">
<tr><td>
<input type="hidden" name="varoculta" value="secreto"/>
ID del Usuario:
	</td><td><input type="text" name="usuario2" onkeypress="return compruebaalfan(this,event);" maxlength="30" value="" class="inputgris"/>
</td></tr><tr><td>Nombre del Juguete a querer:
	</td><td><input type="text" name="nombrePedir" onkeypress="return compruebaalfan(this,event);" maxlength="20" value="" class="inputgris"/>
</td></tr><tr><td>ID del Juguete suyo del intercambio:
	</td><td><input type="text" name="idCambio" onkeypress="return compruebaalfan(this,event);" maxlength="20" value="" class="inputgris"/>
</td></tr><tr><td>ID Del Lugar de Intercambio:
</td><td><input type="text" name="idLugar" onkeypress="return compruebaalfan(this,event);" maxlength="20" value="" class="inputgris"/>
</td></tr><tr><td>Fecha de Entrega:
</td><td><input type="date" name="fecha" onkeypress="return compruebaalfan(this,event);" maxlength="20" value="" class="inputgris"/>
</td></tr><tr><td>Hora de Entrega:
</td><td><input type="time" name="hora" onkeypress="return compruebaalfan(this,event);" maxlength="20" value="" class="inputgris"/>
</td></tr><tr><td>
	</td><td style="text-align: center;">
		<input type="button" name="send" value="Enviar" onclick="compruebayenvia();"/>
</td></tr></table>
</form>
</body>
</html>