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
public class HacerIntercambio extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String idUsuario1 = "";
	private String idUsuario2 = "";
	private String idJuguete1 = "";
	private String nombrePedir = "";
	private String idLugar = "";
	private String fecha = "";
	private String hora = "";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HacerIntercambio() {
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
		String idUsuario2=request.getParameter("usuario2");
		String nombrePedir=request.getParameter("nombrePedir");
		String  idJuguete1 =request.getParameter("idCambio");
		String idLugar=request.getParameter("idLugar");
		String fecha=request.getParameter("fecha");
		String hora=request.getParameter("hora");
		String idUsuario1="";
		String idJuguete2="";
		boolean okdb=true;
		try {
			db.conectarBD();
			okdb = true;
		} catch (Exception e) {
			okdb = false;
			//e.printStackTrace();
		}
		String[][] tablares= {};
		if(okdb) {
		String query="SELECT ID_USUARIO FROM JUGUETES WHERE ID_JUGUETE="+idJuguete1+";";
		try {
			tablares = db.resConsultaSelectA3(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		idUsuario1=tablares[0][0];
		query="SELECT ID_JUGUETE FROM JUGUETES WHERE ID_USUARIO="+idUsuario2+" AND NOMBRE='"+nombrePedir+"';";
		try {
			tablares = db.resConsultaSelectA3(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		idJuguete2=tablares[0][0];
		db.desconectarBD();
		}
		
		if (idUsuario2 == null) idUsuario2="";
		if (idJuguete1 == null) idJuguete1="";
		if (idLugar == null) idLugar="";
		if (fecha == null) fecha="";
		if (idUsuario1 == null) idUsuario1="";
		if (idJuguete2 == null) idJuguete2="";
		if (hora == null) hora="";
		
		boolean ok=false;
		
		if(!idUsuario2.equals("")&&!idUsuario1.equals("")&&!idJuguete1.equals("")&&!idJuguete2.equals("")&&!idLugar.equals("")&&!fecha.equals("")&!hora.equals("")) {
			fecha=fecha+" "+hora+":00";
			String query2= "INSERT INTO INTERCAMBIOS (ID_USUARIO_1,ID_USUARIO_2,ID_JUGUETE_USUARIO_1,ID_JUGUETE_USUARIO_2,ID_PUNTO_INTERCAMBIO,FECHA_ENTREGA,FECHA_RECOGIDA) VALUES ("+idUsuario1+","+idUsuario2+","+idJuguete1+","+idJuguete2+","+idLugar+",'"+fecha+"',NULL);";
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
