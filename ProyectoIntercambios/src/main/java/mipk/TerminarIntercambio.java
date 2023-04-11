package mipk;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


/**
 * Servlet implementation class LoginAuthenticator
 */
public class TerminarIntercambio extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String idIntercambio = "";
	private String fecha = "";
	private String hora = "";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TerminarIntercambio() {
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
		String idIntercambio=request.getParameter("idIntercambio");
		String fecha=request.getParameter("fecha");
		String hora=request.getParameter("hora");

		
		if (idIntercambio == null) idIntercambio="";
		if (fecha == null) fecha="";
		if (hora == null) hora="";
		
		boolean ok=false;
		
		if(!idIntercambio.equals("")&&!fecha.equals("")&&!hora.equals("")) {
			fecha=fecha+" "+hora+":00";
			String query2= "UPDATE INTERCAMBIOS SET FECHA_RECOGIDA='"+fecha+"' WHERE ID_INTERCAMBIO="+idIntercambio+";";
			ok=true;
			try {
			db.conectarBD();
			db.insert(query2);
			}catch(Exception e) {
			}	
	}
		db.desconectarBD();
		if (ok) response.sendRedirect("verdatos.jsp");
		else response.sendRedirect("InicioInvalido.html");
	
	}


}
