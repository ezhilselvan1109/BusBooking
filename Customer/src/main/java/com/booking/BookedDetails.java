package com.booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.database.DataBase;

public class BookedDetails {
	public static List<BookedList> getBookedList(int customer_id){
		List<BookedList> list = new ArrayList<BookedList>();
		Connection connection = DataBase.getDbConnection();
		try {
            PreparedStatement preparedStatement = connection.prepareStatement("select booking_details.booking_id,schedule.schedule_date,booking_details.boarding_stop,booking_details.dropping_stop,booking_details.number_of_seats,booking_details.total_amount from booking_details JOIN schedule ON schedule.schedule_id=booking_details.schedule_id where booking_details.customer_id=?");
            preparedStatement.setInt(1,customer_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
            	BookedList obj=new BookedList();
            	obj.setBooking_id(resultSet.getInt(1));
            	obj.setSchedule_date(resultSet.getString(2)); 
            	obj.setBoarding_stop(resultSet.getString(3));   
            	obj.setDropping_stop(resultSet.getString(4));    
            	obj.setNumber_of_seats(resultSet.getInt(5));   
            	obj.setTotal_amount(resultSet.getFloat(6));
            	list.add(obj);
            }
        }catch (Exception ex) {
            ex.printStackTrace();
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
		return list;
	}

}
