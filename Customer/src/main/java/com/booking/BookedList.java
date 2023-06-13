package com.booking;

public class BookedList {
	int booking_id;
	String schedule_date;
	String boarding_stop;
	String dropping_stop;
	int number_of_seats;
	float total_amount;
	public int getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}
	public String getSchedule_date() {
		return schedule_date;
	}
	public void setSchedule_date(String schedule_date) {
		this.schedule_date = schedule_date;
	}
	public String getBoarding_stop() {
		return boarding_stop;
	}
	public void setBoarding_stop(String boarding_stop) {
		this.boarding_stop = boarding_stop;
	}
	public String getDropping_stop() {
		return dropping_stop;
	}
	public void setDropping_stop(String dropping_stop) {
		this.dropping_stop = dropping_stop;
	}
	public int getNumber_of_seats() {
		return number_of_seats;
	}
	public void setNumber_of_seats(int number_of_seats) {
		this.number_of_seats = number_of_seats;
	}
	public float getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(float total_amount) {
		this.total_amount = total_amount;
	}
	
}
