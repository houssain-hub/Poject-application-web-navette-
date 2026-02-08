package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class offreNavette
 */
@WebServlet("/offreNavette")
public class offreNavette extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public offreNavette() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
     		int company_id = Integer.parseInt(request.getParameter("id_company"));

 			PreparedStatement ps=con.prepareStatement("INSERT INTO offers (villeD,villeA,heureD,heureA,abonnementD,abonnementF,nombreA,Ndescription,statut,id_company) VALUES (?,?,?,?,?,?,?,?,?,?)");
 			
 			ps.setString(1,villeD);
     		ps.setString(2,villeA);
     		ps.setString(3,heureD);
     		ps.setString(4,heureA);
 			ps.setString(5,abonnementD);
     		ps.setString(6,abonnementF);
     		ps.setString(7,nombreA);
     		ps.setString(8,Ndescription);
 			ps.setString(9,status);
     		ps.setInt(10,company_id);
         ps.executeUpdate();
         PrintWriter out=response.getWriter();
        
         response.sendRedirect("navette.jsp");
         out.print("<h1>AJOUTER AVEC SUCCES</h1> ");
		 } catch (Exception e) {
			 PrintWriter out=response.getWriter();
	            out.println("<p style='color:red;'>Erreur : " + e.getMessage() + "</p>");
	        } 
	    
 }

	}


