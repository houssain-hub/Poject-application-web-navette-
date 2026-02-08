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
 * Servlet implementation class inscriptionServlet
 */
@WebServlet("/inscriptionServlet")
public class inscriptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
  

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
	        // Insérer les données dans la base
	        try {
	    			Class.forName("com.mysql.cj.jdbc.Driver");
	    			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","");
	    			String photos=request.getParameter("photoS");
	    			String name=request.getParameter("Sname");
	    			String password=request.getParameter("Spasword");
	        		String semail=request.getParameter("email");
	        		String phone=request.getParameter("phone_number");
	    			PreparedStatement ps=con.prepareStatement("INSERT INTO societes (photoS , Sname,Spasword, email, phone_number) VALUES (? , ? , ?, ?, ?)");
	    			ps.setString(1,photos);
	    			ps.setString(2,name);
	    			ps.setString(3,password);
	        		ps.setString(4,semail);
	        		ps.setString(5,phone);

	            ps.executeUpdate();
	            PrintWriter out=response.getWriter();
	           
	            response.sendRedirect("login.jsp");
	            out.print("<h1>AJOUTER AVEC SUCCES</h1> ");
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Erreur lors de l'enregistrement de l'utilisateur.");
	        }
	    }
	

}
