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
public class BorrarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String id = "";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BorrarUsuario() {
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
		String id=request.getParameter("select");
		if (id == null) id="";
		
		boolean ok=false;
			
		if(!id.equals("")) {
			String query2= "DELETE FROM INTERCAMBIOS WHERE ID_USUARIO_1="+id+" OR ID_USUARIO_2="+id+";";
			String query3= "DELETE FROM JUGUETES WHERE ID_USUARIO="+id+";";
			String query= "DELETE FROM USUARIOS WHERE ID_USUARIO="+id+";";
			ok=true;
			try {
			db.conectarBD();
			db.insert(query2);
			db.insert(query3);
			db.insert(query);
			}catch(Exception e) {
			}
	}
		db.desconectarBD();
		if (ok) response.sendRedirect("bienvenido.jsp");
		else response.sendRedirect("InicioInvalido.html");
	
	}


}
