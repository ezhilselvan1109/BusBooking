package com.booking;

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

@SuppressWarnings("serial")
public class CancelBooking extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException { 
        Connection connection=DataBase.getDbConnection(); 
        try{
            PreparedStatement preparedStatement1 = connection.prepareStatement("select * from user_details where booking_id=?");
            preparedStatement1.setInt(1, Integer.parseInt(request.getParameter("booking_id")));
            ResultSet resultSet1 = preparedStatement1.executeQuery();
            while(resultSet1.next()){
                cancelBusSeat(connection,resultSet1.getInt(6));
            }
            PreparedStatement preparedStatement2 =connection.prepareStatement("delete from booking_details where booking_id =?");
			preparedStatement2.setInt(1, Integer.parseInt(request.getParameter("booking_id")));
			preparedStatement2.executeUpdate();
		}catch(Exception e){
            e.printStackTrace();
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("Manu.jsp");
    }


    private void cancelBusSeat(Connection connection,int bus_seats_id) throws SQLException{
            PreparedStatement preparedStatement=connection.prepareStatement("update bus_seats set available_seat=? where bus_seats_id=?");
			preparedStatement.setBoolean(1,false);
            preparedStatement.setInt(2,bus_seats_id);
            preparedStatement.executeUpdate();
    }
}
