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
public class AgregarTipo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String tipo = "";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgregarTipo() {
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
		String tipo=request.getParameter("tipo");
		if (tipo == null) tipo="";
		
		boolean ok=false;
				
		if(!tipo.equals("")) {
			String query= "INSERT INTO TIPOS_JUGUETES (NOMBRE) VALUES ('"+tipo+"');";
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
