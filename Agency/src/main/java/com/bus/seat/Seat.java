package com.bus.seat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.database.DataBase;
import com.schedule.ScheduleDetails;

@SuppressWarnings("serial")
public class Seat extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{  
        System.out.println("HIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
		Connection connection=DataBase.getDbConnection();
        try {
        	int schedule_id=ScheduleDetails.getScheduleId();
        	int capacity=getcapacity(schedule_id);
        	
        	System.out.println("capacity : "+capacity);
            PreparedStatement preparedStatement = connection.prepareStatement("insert into bus_seats (schedule_id,seat_no,available_seat) values (? , ?, ?)");
            for(int i=1;i<=capacity;i++){
            preparedStatement.setInt(1,schedule_id);
            preparedStatement.setInt(2,i);
            preparedStatement.setBoolean(3, false);
			preparedStatement.executeUpdate();
            }
		} catch (Exception e) {
			System.out.println(e);
		}finally{
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("busDetails.jsp");
    }
	
	public static int getcapacity(int schedule_id) {
		int capacity=0;
		Connection connection = DataBase.getDbConnection();
		try {
		PreparedStatement preparedStatement1 = connection.prepareStatement("select bus_details.capacity from bus_details join schedule on schedule.bus_id=bus_details.bus_id where schedule.schedule_id=?");
        preparedStatement1.setInt(1,schedule_id);
        ResultSet resultSet = preparedStatement1.executeQuery();
        if (resultSet.next()) {
            capacity = resultSet.getInt(1);
            System.out.println(capacity);
        }
		} catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return capacity;
	}
}
