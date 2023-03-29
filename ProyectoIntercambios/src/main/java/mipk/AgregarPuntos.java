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
public class AgregarPuntos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String ciudad = "";
	private String barrio = "";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgregarPuntos() {
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
		String barrio=request.getParameter("barrio");
		String ciudad=request.getParameter("ciudad");
		if (barrio == null) barrio="";
		if (ciudad == null) ciudad="";
		
		boolean ok=false;
				
		if(!barrio.equals("")&&!ciudad.equals("")) {
			String query= "INSERT INTO PUNTOS_INTERCAMBIO (CIUDAD,BARRIO) VALUES ('"+ciudad+"','"+barrio+"');";
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
