package com.schedule;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.database.DataBase;

@SuppressWarnings("serial")
public class ScheduleHandler extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = DataBase.getDbConnection();
		boolean back = true;
		System.out.println("bus_id : "+request.getParameter("bus_id"));
		System.out.println("route_id : "+request.getParameter("route_id"));
		System.out.println("schedule_date : "+request.getParameter("schedule_date"));
		System.out.println("departare_time : "+request.getParameter("departare_time"));
		System.out.println("fare_amount : "+request.getParameter("fare_amount"));
		try {
			PreparedStatement preparedStatement = con.prepareStatement("insert into schedule(bus_id,route_id,schedule_date,departare_time,fare_amount) values(? , ? , ? , ?, ?)");
			preparedStatement.setInt(1, Integer.parseInt(request.getParameter("bus_id")));
			preparedStatement.setInt(2, Integer.parseInt(request.getParameter("route_id")));
			preparedStatement.setDate(3, Date.valueOf((String) request.getParameter("schedule_date")));
			preparedStatement.setString(4, request.getParameter("departare_time"));
			preparedStatement.setFloat(5, Float.parseFloat(request.getParameter("fare_amount")));
			preparedStatement.executeUpdate();
		} catch (org.postgresql.util.PSQLException ex) {
			back=false;
			response.sendRedirect("schedule.jsp?route_id="+request.getParameter("route_id")+"&bus_id="+request.getParameter("bus_id")+"");
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(back){
			response.sendRedirect("scheduleRouteStop.jsp?route_id="+request.getParameter("route_id"));
		}
	}

}
