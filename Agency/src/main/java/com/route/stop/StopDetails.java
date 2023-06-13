package com.route.stop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.database.DataBase;

public class StopDetails {
	public static List<Stop> getStopDetails(int route_id) {
		List<Stop> list = new ArrayList<Stop>();
		Connection connection = DataBase.getDbConnection();
		try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from route_stop where route_id=?");
            preparedStatement.setInt(1,route_id);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()) {
            	Stop obj=new Stop();
            	obj.setStop(rs.getString(2));
            	obj.setKm(rs.getInt(3));
            	obj.setRoute_stop_id(rs.getInt(1));
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

}
