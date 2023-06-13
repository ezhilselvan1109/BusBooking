package com.bus;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.database.DataBase;

@SuppressWarnings("serial")
public class BusHandler extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection=DataBase.getDbConnection(); 
		try {
			PreparedStatement preparedStatement =connection.prepareStatement("delete from bus_details where bus_id =?");
			preparedStatement.setInt(1, Integer.parseInt(request.getParameter("bus_id")));
			preparedStatement.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		response.sendRedirect("busDetails.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Connection con = DataBase.getDbConnection();
		Boolean flag=true;
		try {
			int agency_id=(int) session.getAttribute("agency_id");
			PreparedStatement preparedStatement = con.prepareStatement("insert into bus_details (agency_id,bus_name,bus_plate_name,bus_type,capacity) values (? , ? , ? , ?, ?)");
			preparedStatement.setInt(1,agency_id);
			preparedStatement.setString(2, request.getParameter("busname"));
			preparedStatement.setString(3, request.getParameter("plateNo"));
			preparedStatement.setString(4, request.getParameter("type"));
			preparedStatement.setInt(5, Integer.parseInt(request.getParameter("capacity")));
			preparedStatement.executeUpdate();
		} catch (org.postgresql.util.PSQLException ex) {
			flag=false;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(flag) {
			response.sendRedirect("busDetails.jsp");
		}else {
			response.sendRedirect("registerBus.jsp");
		}
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
