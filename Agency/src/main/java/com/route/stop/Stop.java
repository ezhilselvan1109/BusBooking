package com.route.stop;

public class Stop {
	int  route_stop_id;
	String stop;
	int km;
	int route_id;
	public int getRoute_id() {
		return route_id;
	}
	public void setRoute_id(int route_id) {
		this.route_id = route_id;
	}
	public int getRoute_stop_id() {
		return route_stop_id;
	}
	public void setRoute_stop_id(int route_stop_id) {
		this.route_stop_id = route_stop_id;
	}
	public String getStop() {
		return stop;
	}
	public void setStop(String stop) {
		this.stop = stop;
	}
	public int getKm() {
		return km;
	}
	public void setKm(int i) {
		this.km = i;
	}
}
