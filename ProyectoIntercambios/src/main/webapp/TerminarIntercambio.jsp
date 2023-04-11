<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<%@page import="mipk.beanDB"%>
<% 
beanDB db = new beanDB();
boolean okdb = false;
String resultado = "";
String [][] tablares= {};

try {
	db.conectarBD();
	okdb = true;
} catch (Exception e) {
	okdb = false;
	//e.printStackTrace();
}
if (okdb) {
	
		String query="SELECT I.ID_INTERCAMBIO,I.FECHA_ENTREGA FROM INTERCAMBIOS I JOIN USUARIOS U ON (I.ID_USUARIO_1=U.ID_USUARIO) WHERE CORREO='"+session.getAttribute("attributo2")+"' AND FECHA_RECOGIDA IS NULL;";
		tablares = db.resConsultaSelectA3(query);
	if (tablares != null) {
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
	if (datos.fecha.value == '' ||datos.hora.value == '')
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

<h1 style="color: pink;">TERMINAR INTERCAMBIO</h1>
<hr>
<form action="./HacerIntercambio" method="post" name="iniciosesion" id="iniciosesion">
<table style="text-align: left; border: none;">
<tr><td>
<input type="hidden" name="varoculta" value="secreto"/>
</td></tr><tr><td>Seleccione Intercambio:
</td><td><select name="idIntercambio">
<%
for (int i=0; i<tablares.length;i++){
	%><option value="<%=tablares[i][0]%>"><%=tablares[i][1]%></option><%
}
%>
	</select>
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