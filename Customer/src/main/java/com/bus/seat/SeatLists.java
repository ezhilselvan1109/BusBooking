package com.bus.seat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.database.DataBase;

public class SeatLists {
	public static List<SeatDetails> getBusLists(int schedule_id) {
		List<SeatDetails> list = new ArrayList<SeatDetails>();
		Connection connection = DataBase.getDbConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from bus_seats where schedule_id=?  ORDER BY seat_no ASC  ");
            preparedStatement.setInt(1,schedule_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            while (true) {
            	SeatDetails obj=new SeatDetails();
            	obj.setBus_seats_id(resultSet.getInt(2));
            	obj.setSeat_no(resultSet.getInt(3));
            	obj.setAvailable_seat(resultSet.getBoolean(4));
            	list.add(obj);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
	}
	
	public static int available(int schedule_id) {
        int count = 0;
        Connection connection = DataBase.getDbConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select COUNT(available_seat) from bus_seats where schedule_id=? and available_seat=false");
            preparedStatement.setInt(1, schedule_id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
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
        return count;
    }
	
	public static int getcapacity(int bus_id) {
		int capacity=0;
		Connection connection = DataBase.getDbConnection();
		try {
		PreparedStatement preparedStatement1 = connection.prepareStatement("select * from bus_details where bus_id=?");
        preparedStatement1.setInt(1,bus_id);
        ResultSet resultSet2 = preparedStatement1.executeQuery();
        if (resultSet2.next()) {
            capacity = resultSet2.getInt(6);
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
