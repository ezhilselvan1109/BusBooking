create table bus_details(
	bus_id SERIAL PRIMARY KEY,
	agency_id INT,
	bus_name VARCHAR(15) NOT NULL,
	bus_plate_name VARCHAR(15) NOT NULL UNIQUE,
	bus_type VARCHAR(6) NOT NULL,
	capacity INT NOT NULL,
	FOREIGN KEY(agency_id) REFERENCES travel_agency(agency_id) ON DELETE CASCADE
)


drop table bus_details


select * from bus_details

SELECT route.starting_point,route.destination,route.km,schedule.schedule_id,schedule.bus_id,schedule.bus_id,schedule.fare_amount,
bus_details.bus_name,bus_details.bus_type,bus_details.capacity
FROM ((schedule JOIN route  ON route.route_id=schedule.route_id) 
JOIN bus_details  ON bus_details.bus_id=schedule.bus_id)

SELECT booking_details .number_of_seats, booking_details .boarding_stop,booking_details.dropping_stop,booking_details.total_amount,
customer_details.customer_name,customer_details.customer_contact,customer_details.customer_email,schedule.schedule_date,bus_details.bus_type,bus_details.bus_name
FROM (((booking_details
JOIN customer_details  ON booking_details.customer_id=customer_details.customer_id)
JOIN schedule ON schedule.schedule_id=booking_details.schedule_id)
JOIN bus_details ON schedule.bus_id=bus_details.bus_id)where booking_details.booking_id=1



insert into bus_details (agency_id,bus_name,bus_plate_name,bus_type,capatity) values ()
