<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mi Primer Formulario</title>

<link rel="stylesheet" href="common/general.css">

<script type="text/javascript">
function compruebayenvia() {
	datos=document.iniciosesion;
	if (datos.contrasenia.value == '' ||datos.nombre.value == ''|| datos.apellidos.value==''||datos.ciudad.value=='')
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

<h1 style="color: pink;">Modificar la Cuenta</h1>
<form action="./ModificarCuenta" method="post" name="iniciosesion" id="iniciosesion">
<table style="text-align: left; border: none;">
<tr><td>
<input type="hidden" name="varoculta" value="secreto"/>
Contraseña:
	</td><td><input type="password" name="contrasenia" onkeypress="return compruebaalfan(this,event);" maxlength="20" value="" class="inputgris"/>
</td></tr><tr><td>Nombre:
	</td><td><input type="text" name="nombre" onkeypress="return compruebaalfan(this,event);" maxlength="20" value="" class="inputgris"/>
</td></tr><tr><td>Apellidos:
	</td><td><input type="text" name="apellidos" onkeypress="return compruebaalfan(this,event);" maxlength="20" value="" class="inputgris"/>
</td></tr><tr><td>Ciudad:
</td><td><input type="text" name="ciudad" onkeypress="return compruebaalfan(this,event);" maxlength="20" value="" class="inputgris"/>
</td></tr><tr><td>
	</td><td style="text-align: center;">
		<input type="button" name="send" value="Enviar" onclick="compruebayenvia();"/>
</td></tr></table>
</form>
</body>
</html>