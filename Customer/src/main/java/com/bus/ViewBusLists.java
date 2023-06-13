package com.bus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.database.DataBase;

public class ViewBusLists {
	public static List<ViewBusDetails> getBusLists(String starting_point,String destination,String date) {
		List<ViewBusDetails> list = new ArrayList<ViewBusDetails>();
		System.out.println("Hello");
		Connection connection = DataBase.getDbConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT route.starting_point,route.destination,route.km,schedule.schedule_id,schedule.bus_id,schedule.route_id,schedule.schedule_date,schedule.departare_time,schedule.fare_amount,bus_details.bus_name,bus_details.bus_type,bus_details.capacity FROM ((schedule JOIN route  ON route.route_id=schedule.route_id) JOIN bus_details  ON bus_details.bus_id=schedule.bus_id)");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                if (starting_point.toUpperCase().equals(rs.getString(1).toUpperCase()) && destination.toUpperCase().equals(rs.getString(2).toUpperCase()) && date.equals(rs.getString(7))) {
                	ViewBusDetails obj=new ViewBusDetails();
                	obj.setStarting_point(rs.getString(1));
                	System.out.println(rs.getString(1));
                	System.out.println(rs.getString(2));
                	
                	obj.setDestination(rs.getString(2));
                	obj.setKm(rs.getInt(3));
                	
                	obj.setSchedule_id(rs.getInt(4));
                	obj.setBus_id(rs.getInt(5));
                	obj.setRoute_id(rs.getInt(6));
                	
                	obj.setSchedule_date(rs.getString(7));
                	obj.setDepartare_time(rs.getString(8));
                	obj.setFare_amount(rs.getFloat(9));
                	
                	obj.setBus_name(rs.getString(10));
                	obj.setBus_type(rs.getString(11));
                	obj.setCapacity(rs.getInt(12));
                	list.add(obj);
               }
        
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally{
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
		return list;
	}
	
}
