package com.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.database.DataBase;

@SuppressWarnings("serial")
public class Login extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter(); 
		boolean flag=true;
		Connection connection=DataBase.getDbConnection();
	    try {
	        PreparedStatement preparedStatement = connection.prepareStatement("select agency_id,agent_username,agent_password from travel_agency");
	        ResultSet rs = preparedStatement.executeQuery();
	        while(rs.next()) {
	            if(rs.getString(2).equals(request.getParameter("userName")) && rs.getString(3).equals(request.getParameter("password"))){
	                flag=false;
	                HttpSession session=request.getSession();
	    			session.setAttribute("userName",request.getParameter("userName"));
	    			session.setAttribute("agency_id",rs.getInt(1));
	                response.sendRedirect("busDetails.jsp");
	                break;  
	            }
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }finally{
	        try {
	            connection.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    if(flag){  
	        out.print("Sorry UserName or Password Error!");  
	        response.sendRedirect("login.jsp");            
	        } 
	}

}
