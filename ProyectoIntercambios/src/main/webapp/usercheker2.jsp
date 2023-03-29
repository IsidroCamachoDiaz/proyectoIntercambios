<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	var noEntra=false;
</script>
<% 
//Crea una varible con el usuario vacio;
String usuario="";
try {  //Coge el sesionid
	//Si no ha iniciado sesion lo lleva directamente al inicio invalido
	usuario=session.getAttribute("attributo2").toString();
	//Convierte el acceso en un numero
	String acceso = session.getAttribute("attributo1").toString();
	//Si es idSesion es distinto que el del navegador lo lleva al inicio invalido
 	if (!acceso.equals("1")) {
 		response.sendRedirect("InicioInvalido.html");
 	}
} catch (Exception e) {
	response.sendRedirect("InicioInvalido.html");
}

%>
</head>
<body>
<h1>Inicio sesion Correctamente</h1>
</body>
</html>