package com.route;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.database.DataBase;

public class RouteDetails {
	public static List<Route> getRouteDetails() {
		List<Route> list = new ArrayList<Route>();
		Connection connection = DataBase.getDbConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from route");
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()) {
            	Route obj=new Route();
            	obj.setRoute_id(1);
            	obj.setStarting_point(rs.getString(2));
            	obj.setDestination(rs.getString(3));
            	obj.setKm(rs.getInt(4)); 
            	list.add(obj);
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
	public static int getRouteID() {
		int route_id=1;
		try {
            Connection connection = DataBase.getDbConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT MAX(route_id) FROM route");
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                route_id = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
		return route_id;
	}
}
