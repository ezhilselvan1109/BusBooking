package com.schedule;

public class Schedule {
	int schedule_id;
	int bus_id;
	int route_id;
	String schedule_date;
	String departare_time;
	float fare_amount;
	public int getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}
	public int getBus_id() {
		return bus_id;
	}
	public void setBus_id(int bus_id) {
		this.bus_id = bus_id;
	}
	public int getRoute_id() {
		return route_id;
	}
	public void setRoute_id(int route_id) {
		this.route_id = route_id;
	}
	public String getSchedule_date() {
		return schedule_date;
	}
	public void setSchedule_date(String schedule_date) {
		this.schedule_date = schedule_date;
	}
	public String getDepartare_time() {
		return departare_time;
	}
	public void setDepartare_time(String departare_time) {
		this.departare_time = departare_time;
	}
	public float getFare_amount() {
		return fare_amount;
	}
	public void setFare_amount(float fare_amount) {
		this.fare_amount = fare_amount;
	}
}
