package mipk;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


/**
 * Servlet implementation class LoginAuthenticator
 */
public class ModificarCuenta extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String contrasenia = "";
	private String nombre = "";
	private String apellidos = "";
	private String ciudad = "";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarCuenta() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("./index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		beanDB db = new beanDB();
		HttpSession session = request.getSession();
	
		String contrasenia=request.getParameter("contrasenia");
		String nombre=request.getParameter("nombre");
		String apellidos=request.getParameter("apellidos");
		String ciudad=request.getParameter("ciudad");
		if (contrasenia == null) contrasenia="";
		if (nombre == null) nombre="";
		if (apellidos == null) apellidos="";
		if (ciudad == null) ciudad="";
		boolean ok=false;
					
		if(!contrasenia.equals("")&&!nombre.equals("")&&!apellidos.equals("")&&!ciudad.equals("")) {
			String query= "UPDATE USUARIOS SET CONTRASEÑA='"+contrasenia+"', NOMBRE='"+nombre+"',APELLIDOS='"+apellidos+"',CIUDAD='"+ciudad+"' WHERE CORREO='"+session.getAttribute("attributo2")+"';";
			ok=true;
			try {
			db.conectarBD();
			db.insert(query);
			}catch(Exception e) {
			}
	}
		db.desconectarBD();
		if (ok) response.sendRedirect("bienvenido.jsp");
		else response.sendRedirect("InicioInvalido.html");
	
	}


}
