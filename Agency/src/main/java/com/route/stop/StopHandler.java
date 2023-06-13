package com.route.stop;

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
import com.route.RouteDetails;

@SuppressWarnings("serial")
public class StopHandler extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int route_id=1;
		if(request.getParameter("route_id")==null) {
			route_id=RouteDetails.getRouteID();
		}
		Connection con = DataBase.getDbConnection();
		try {
			PreparedStatement preparedStatement = con.prepareStatement("insert into route_stop (stop,km,route_id) values(? , ? , ? )");
			preparedStatement.setString(1, request.getParameter("stop"));
			preparedStatement.setInt(2, Integer.parseInt(request.getParameter("km")));
			preparedStatement.setInt(3, route_id);
			preparedStatement.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		String flag = request.getParameter("continue");
		try {
			if (flag.equals(null)) {
				flag = "";
			}
		} catch (NullPointerException e) {
			flag = "";
		}
		if (flag.equals("Add And Save")) {
			response.sendRedirect("addRouteStop.jsp");
		} else {
			response.sendRedirect("busDetails.jsp");
		}
	}

}
