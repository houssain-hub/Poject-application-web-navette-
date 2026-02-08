package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class modifierServlet
 */
@WebServlet("/modifierServlet")
public class modifierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modifierServlet() {
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
	


	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
	        // Récupérer les données du formulaire
			 try {
		 			Class.forName("com.mysql.cj.jdbc.Driver");
		 			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","");
		 			
		 			String villeD=request.getParameter("villeD");
		     		String villeA=request.getParameter("villeA");
		     		String heureD=request.getParameter("heureD");
		     		String heureA=request.getParameter("heureA");
		 			String abonnementD=request.getParameter("abonnementD");
		     		String abonnementF=request.getParameter("abonnementF");
		     		String nombreA=request.getParameter("nombreA");
		     		String Ndescription=request.getParameter("Ndescription");
		     		String status=request.getParameter("statut");
		     		int ido=Integer.parseInt(request.getParameter("id"));
		 			PreparedStatement ps=con.prepareStatement("UPDATE offers SET villeD = ?, villeA = ?, heureD = ?, heureA = ?, abonnementD = ?, abonnementF = ?, nombreA = ?, Ndescription = ?, statut = ? WHERE id = ?");
		 			
		 			ps.setString(1,villeD);
		     		ps.setString(2,villeA);
		     		ps.setString(3,heureD);
		     		ps.setString(4,heureA);
		 			ps.setString(5,abonnementD);
		     		ps.setString(6,abonnementF);
		     		ps.setString(7,nombreA);
		     		ps.setString(8,Ndescription);
		 			ps.setString(9,status);
		 			ps.setInt(10, ido);
		         ps.executeUpdate();
		         PrintWriter out=response.getWriter();
		        
		         response.sendRedirect("navette.jsp");
		         out.print("<h1>AJOUTER AVEC SUCCES</h1> ");
		     } catch (Exception e) {
		         e.printStackTrace();
		         response.getWriter().println("Erreur lors de l'enregistrement de l'utilisateur.");
		     }
		 }
//	           
	}



