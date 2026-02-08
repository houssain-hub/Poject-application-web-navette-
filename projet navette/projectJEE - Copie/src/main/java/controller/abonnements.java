package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class abonnements
 */
@WebServlet("/abonnements")
public class abonnements extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public abonnements() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
//			connexion base de donnée
			PrintWriter out=response.getWriter();
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","");
			
			int client=Integer.parseInt(request.getParameter("id_client"));
			int offer=Integer.parseInt(request.getParameter("id"));
			int company=Integer.parseInt(request.getParameter("company_id"));
			PreparedStatement ps=con.prepareStatement("INSERT INTO abonnements (client_id, offer_id, company_id)  VALUES (?, ?, ?)");
			
			ps.setInt(1,client);
			ps.setInt(2,offer);
			ps.setInt(3,company);
			ps.executeUpdate();
			

//                // Rediriger en fonction du rôle
                request.setAttribute("message", "Nom d'utilisateur ou mot de passe incorrect.");
			    request.getRequestDispatcher("login.jsp").forward(request, response);
                   response.sendRedirect("navette.jsp");
			
//			else {
//			    
//				request.setAttribute("message", "Nom d'utilisateur ou mot de passe incorrect.");
//				request.getRequestDispatcher("login.jsp").forward(request, response);
//
//			}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
