package com.bus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.database.DataBase;

public class BusDetails {
	public static List<Bus> getBusDetails(int agency_id) {
		List<Bus> list = new ArrayList<Bus>();
		Connection connection = DataBase.getDbConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("select * from bus_details where agency_id=?");
			preparedStatement.setInt(1, agency_id);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Bus obj = new Bus();
				obj.setBus_id(rs.getInt(1));
				obj.setBusname(rs.getString(3));
				obj.setPlateNo(rs.getString(4));
				obj.setType(rs.getString(5));
				obj.setCapacity(rs.getInt(6));
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

}
