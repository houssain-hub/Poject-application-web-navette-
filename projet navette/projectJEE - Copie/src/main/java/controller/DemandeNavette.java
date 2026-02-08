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
 * Servlet implementation class DemandeNavette
 */
@WebServlet("/DemandeNavette")
public class DemandeNavette extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DemandeNavette() {
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
		// TODO Auto-generated method stub
		  try {
  			Class.forName("com.mysql.cj.jdbc.Driver");
  			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","");
  			String name=request.getParameter("nameC");
  			String phone=request.getParameter("phone");
  			String email=request.getParameter("email");
      		String villeD=request.getParameter("VilleD");
      		String villeA=request.getParameter("VilleA");
  			PreparedStatement ps=con.prepareStatement("INSERT INTO demandes (nameC ,phone,email,VilleD, VilleA) VALUES (? , ? , ?, ?, ?)");
  			ps.setString(1,name);
  			ps.setString(2,phone);
  			ps.setString(3,email);
      		ps.setString(4,villeD);
      		ps.setString(5,villeA);

          ps.executeUpdate();
          PrintWriter out=response.getWriter();
         
          response.sendRedirect("home.jsp");
          out.print("<h1>AJOUTER AVEC SUCCES</h1> ");
      } catch (Exception e) {
          e.printStackTrace();
          response.getWriter().println("Erreur lors de l'enregistrement de l'utilisateur.");
      }
  
	}

}
