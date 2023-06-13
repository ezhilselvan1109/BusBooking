package com.route;

public class Route {
	int route_id;
	public int getRoute_id() {
		return route_id;
	}
	public void setRoute_id(int route_id) {
		this.route_id = route_id;
	}
	String starting_point;
	String destination;
	int km;
	public String getStarting_point() {
		return starting_point;
	}
	public void setStarting_point(String starting_point) {
		this.starting_point = starting_point;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public int getKm() {
		return km;
	}
	public void setKm(int km) {
		this.km = km;
	}
}
