package com.bus.seat;

public class SeatDetails {
	int bus_seats_id;
	int seat_no;
	boolean available_seat;
	public int getBus_seats_id() {
		return bus_seats_id;
	}
	public void setBus_seats_id(int bus_seats_id) {
		this.bus_seats_id = bus_seats_id;
	}
	public int getSeat_no() {
		return seat_no;
	}
	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}
	public boolean isAvailable_seat() {
		return available_seat;
	}
	public void setAvailable_seat(boolean available_seat) {
		this.available_seat = available_seat;
	}
	
}
