create table route(
	route_id SERIAL PRIMARY KEY,
	starting_point VARCHAR(15) NOT NULL,
	destination VARCHAR(15) NOT NULL,
	km INT NOT NULL
)


select * from route



drop table route

SELECT route.starting_point,route.destination,route.km FROM (((booking_details
JOIN customer_details  ON booking_details.customer_id=customer_details.customer_id)
JOIN schedule ON schedule.schedule_id=booking_details.schedule_id)
JOIN bus_details ON schedule.bus_id=bus_details.bus_id)where booking_details.booking_id=1


insert into route(starting_point,destination,km) values();

