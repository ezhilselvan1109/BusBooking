package com.schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.database.DataBase;

public class ScheduleDetails {
	
	public static List<Schedule> getScheduleDetails(){
		List<Schedule> list = new ArrayList<Schedule>();
		Connection connection = DataBase.getDbConnection();
		return list;
	}
	
	public static int getScheduleId() {
		int schedule_id=1;
        Connection connection = DataBase.getDbConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select MAX(schedule_id) from schedule");
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                schedule_id = resultSet.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return schedule_id;
	}

}
