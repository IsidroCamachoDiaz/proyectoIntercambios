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
public class LoginAuthenticator extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String usuvalido = "admin";
	private String pwdvalida = "1357";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAuthenticator() {
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
		String usuario=request.getParameter("usuario");
		String pass=request.getParameter("pass");
		if (usuario == null) usuario="";
		if (pass == null) pass="";
		boolean ok=false;
		
		
		String query= "SELECT ID_USUARIO FROM USUARIOS WHERE CORREO='"+usuario+"' AND CONTRASEÑA=AES_ENCRYPT('"+pass+"','ClaveSeguridad22');";
		String [][] tablares= {};
		try {
		db.conectarBD();
		tablares= db.resConsultaSelectA3(query);
		}catch(Exception e) {
		}
		
		boolean incorrecto =true;

		if(tablares!=null) {
			session.setAttribute("attributo2",usuario);
			session.setAttribute("attributo1","1");
			ok=true;
			incorrecto=false;
		}
		db.desconectarBD();
		if (ok) response.sendRedirect("bienvenido.jsp");
		else response.sendRedirect("index.jsp");
	
	}


}
