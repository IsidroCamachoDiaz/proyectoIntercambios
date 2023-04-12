<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mi Primer Formulario</title>

<link rel="stylesheet" href="common/crear.css">
<script src="script/crear.js"></script>

<script type="text/javascript">
function compruebayenvia() {
	datos=document.iniciosesion;
	if (datos.correo.value == '' ||
			datos.contrasenia.value == ''|| datos.nombre.value==''||datos.apellidos.value==''||datos.ciudad.value=='')
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
<link rel="stylesheet" href="hsimp.jquery.css">
</head>
<body style="background-image: url(images/fondoJuguetes.jpg);">
<div class='box'>
  <div class='box-form'>
    <div class='box-login-tab'></div>
    <div class='box-login-title'>
      <div class='i i-login'></div><h2>CREAR CUENTA</h2>
    </div>
    <div class='box-login'>
      <div class='fieldset-body' id='login_form'>
      <form action="./CreacionUsuarios" method="post" name="iniciosesion" id="iniciosesion">
        	<p class='field'>
          <label for='user'>CORREO</label>
          <input type='text' id='user' name='correo' title='Username' />
          <span id='valida' class='i i-warning'></span>
        </p>
      	  <p class='field'>
          <label for='pass'>CONTRASEÑA</label>
          <input type='password' id='pass' name='contrasenia' title='Password'/>
          <span id='valida' class='i i-close'></span>
        </p>
        <!-- Contrasenia -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

        <script src="hsimp.jquery.min.js"></script>
        <script>
            jQuery(function ($) {
                "use strict";

                $("#pass").hsimp({
                    calculationsPerSecond: 10e9, // 10 billion
                    good: 31557600e9, // 1 billion years
                    ok: 31557600e2,  // 100 years
                });
            });
        </script>
		
        <p class='field'>
          <label for='user'>NOMBRE</label>
          <input type='text' id='user' name='nombre' title='Username' />
          <span id='valida' class='i i-warning'></span>
        </p>
        <p class='field'>
          <label for='user'>APELLIDOS</label>
          <input type='text' id='user' name='apellidos' title='Username' />
          <span id='valida' class='i i-warning'></span>
        </p>
        <p class='field'>
          <label for='user'>CIUDAD</label>
          <input type='text' id='user' name='ciudad' title='Username' />
          <span id='valida' class='i i-warning'></span>
        </p>


        	<input id='do_login' type="submit" name="send" value="Enviar" onclick="compruebayenvia();" />
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>