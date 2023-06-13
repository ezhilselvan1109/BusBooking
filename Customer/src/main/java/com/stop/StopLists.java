package com.stop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.database.DataBase;

public class StopLists {
	public static List<StopDetails> getStopLists(int schedule_id) {
		List<StopDetails> list = new ArrayList<StopDetails>();
		Connection connection = DataBase.getDbConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"SELECT route_stop .stop, route_stop .km ,route_stop.route_stop_id FROM schedule_stop JOIN route_stop ON route_stop.route_stop_id=schedule_stop.route_stop_id where schedule_stop.schedule_id=?");
			preparedStatement.setInt(1, schedule_id);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				StopDetails obj = new StopDetails();
				obj.setStop(rs.getString(1));
				obj.setKm(rs.getInt(2));
				obj.setRoute_stop_id(rs.getInt(3));
				list.add(obj);
			}
		} catch (org.postgresql.util.PSQLException e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException ex) {
				ex.printStackTrace();
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
}
