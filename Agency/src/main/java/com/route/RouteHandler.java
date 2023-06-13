package com.route;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.database.DataBase;

@SuppressWarnings("serial")
public class RouteHandler extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=DataBase.getDbConnection();
		try {
			PreparedStatement preparedStatement = con.prepareStatement("insert into route(starting_point,destination,km) values(? , ? , ? )");
			preparedStatement.setString(1,request.getParameter("stating_point"));
			preparedStatement.setString(2, request.getParameter("destination"));
			preparedStatement.setInt(3, Integer.parseInt(request.getParameter("km")));
			preparedStatement.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		response.sendRedirect("addRouteStop.jsp");
	}

}
