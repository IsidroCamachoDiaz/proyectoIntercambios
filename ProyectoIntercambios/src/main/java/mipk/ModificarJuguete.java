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
public class ModificarJuguete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String idJuguete = "";
	private String nombre = "";
	private String estado = "";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarJuguete() {
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
	
		String idJuguete=request.getParameter("idJuguete");
		String nombre=request.getParameter("nombre");
		String estado=request.getParameter("estado");
		if (idJuguete == null) idJuguete="";
		if (nombre == null) nombre="";
		if (estado == null) estado="";
		boolean ok=false;
					
		if(!idJuguete.equals("")&&!nombre.equals("")&&!estado.equals("")) {
			String query= "UPDATE JUGUETES SET NOMBRE='"+nombre+"',ESTADO='"+estado+"' WHERE ID_JUGUETE='"+idJuguete+"';";
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
