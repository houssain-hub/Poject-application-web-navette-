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
 * Servlet implementation class ClientInscription
 */
@WebServlet("/ClientInscription")
public class ClientInscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientInscription() {
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
 			String photo=request.getParameter("photoC");
 			String name=request.getParameter("Cname");
 			String password=request.getParameter("password");
     		String email=request.getParameter("email");
     		String phone=request.getParameter("phone_number");
 			PreparedStatement ps=con.prepareStatement("INSERT INTO clients (photoC , Cname,password, email, phone_number) VALUES (? , ? , ?, ?, ?)");
 			ps.setString(1,photo);
 			ps.setString(2,name);
 			ps.setString(3,password);
     		ps.setString(4,email);
     		ps.setString(5,phone);

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


