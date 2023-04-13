<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mipk.beanDB"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mi Primer Formulario</title>

<link rel="stylesheet" href="common/general.css">

<script type="text/javascript">
function compruebayenvia() {
	datos=document.iniciosesion;
	if (datos.idJuguete.value == '' ||datos.nombre.value == ''|| datos.estado.value=='')
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

<h1 style="color: pink;">Modificar Juguete</h1>
<form action="./ModificarJuguete" method="post" name="iniciosesion" id="iniciosesion">
<table style="text-align: left; border: none;">
<tr><td>
<input type="hidden" name="varoculta" value="secreto"/>
ID del Juguete:
	</td><td><select name="idJuguete">
<%
beanDB db = new beanDB();
boolean okdb = false;
String resultado = "";
String [][] tablares={};

try {
	db.conectarBD();
	okdb = true;
} catch (Exception e) {
	okdb = false;
	//e.printStackTrace();
}
if (okdb) {
	
		String query="SELECT J.ID_JUGUETE,J.NOMBRE FROM JUGUETES J JOIN USUARIOS U ON (J.ID_USUARIO=U.ID_USUARIO) WHERE CORREO='"+session.getAttribute("attributo2")+"';";
		tablares = db.resConsultaSelectA3(query);
	if (tablares != null) {
		for (int i=0; i<tablares.length;i++){ %>
		<option value="<%=tablares[i][0]%>"><%=tablares[i][1]%></option>
		<% //g es una variable tipo grupo que va recorriendo la lista
		}
	}
	db.desconectarBD();
}
%>	
	
</select>
</td></tr><tr><td>Nombre del Juguete:
</td><td><input type="text" name="nombre" onkeypress="return compruebaalfan(this,event);" maxlength="20" value="" class="inputgris"/>
</td></tr><tr><td>Estado del Juguete:
</td><td><input type="text" name="estado" onkeypress="return compruebaalfan(this,event);" maxlength="20" value="" class="inputgris"/>
</td></tr><tr><td>
	</td><td style="text-align: center;">
		<input type="button" name="send" value="Enviar" onclick="compruebayenvia();"/>
</td></tr></table>
</form>
</body>
</html>