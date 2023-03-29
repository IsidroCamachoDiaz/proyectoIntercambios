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
public class AgregarJuguete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String idTipo = "";
	private String idUsuario = "";
	private String nombre = "";
	private String estado = "";
	private String correo = "";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgregarJuguete() {
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
		String idTipo=request.getParameter("tipo");
		String nombre=request.getParameter("nombre");
		String estado=request.getParameter("estado");
		String correo=request.getParameter("correo");
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
		String query="SELECT ID_USUARIO FROM USUARIOS WHERE CORREO='"+correo+"';";
		try {
			tablares = db.resConsultaSelectA3(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		db.desconectarBD();
		}
		String idUsuario=tablares[0][0];
		if (nombre == null) nombre="";
		if (estado == null) estado="";
		if (idTipo == null) idTipo="";
		if (correo == null) correo="";
		if (idUsuario == null) idUsuario="";
		
		boolean ok=false;
		
		if(!correo.equals("")&&!idTipo.equals("")&&!nombre.equals("")&&!estado.equals("")&&!idUsuario.equals("")) {
			String query2= "INSERT INTO JUGUETES (ID_TIPO_JUGUETE,ID_USUARIO,NOMBRE,ESTADO) VALUES ("+idTipo+","+idUsuario+",'"+nombre+"','"+estado+"');";
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
