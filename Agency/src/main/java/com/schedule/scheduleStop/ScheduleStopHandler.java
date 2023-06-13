package com.schedule.scheduleStop;

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

import org.apache.jasper.tagplugins.jstl.core.Set;

import com.database.DataBase;
import com.schedule.ScheduleDetails;

@SuppressWarnings("serial")
public class ScheduleStopHandler extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int schedule_id=ScheduleDetails.getScheduleId();
		Connection con = DataBase.getDbConnection();
		String[] checkedIds = request.getParameterValues("checkedRows");
		try {
            for (int i=0;i<checkedIds.length;i++) {
                String value = checkedIds[i];
                System.out.println(value);
                PreparedStatement preparedStatement = con.prepareStatement( "insert into schedule_stop (schedule_id,route_stop_id) values(? , ? )");
                preparedStatement.setInt(1,schedule_id);
                preparedStatement.setInt(2, Integer.parseInt(value));
                preparedStatement.executeUpdate();
                }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
		response.sendRedirect("Seat");
	}

}
