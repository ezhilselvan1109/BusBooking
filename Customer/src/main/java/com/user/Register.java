package com.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.database.DataBase;



@SuppressWarnings("serial")
public class Register extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Boolean flag=false;
		if(!Validation.validate(request.getParameter("contactNo"))){
			flag=true;
		}
		Connection connection = DataBase.getDbConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("insert into customer_details (customer_name,customer_contact,customer_email,user_name,user_password) values (? , ? , ? , ?, ?)");
			preparedStatement.setString(1, request.getParameter("name"));
			preparedStatement.setString(2, request.getParameter("contactNo"));
			preparedStatement.setString(3, request.getParameter("email"));
			preparedStatement.setString(4, request.getParameter("userName"));
			preparedStatement.setString(5, request.getParameter("password"));
			preparedStatement.executeUpdate();
			flag=true;
		}catch (org.postgresql.util.PSQLException ex) {
			flag=false;
			ex.printStackTrace();
		}catch (SQLException ex) {
			flag=false;
			ex.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(flag) {
			response.sendRedirect("index.jsp");
		}else {
			response.sendRedirect("register.jsp");
		}
	}

}
