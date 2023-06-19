create table schedule(
	schedule_id SERIAL PRIMARY KEY,
	bus_id INT,
	route_id INT,
	schedule_date DATE NOT NULL,
	departare_time VARCHAR(10) NOT NULL,
	fare_amount float NOT NULL,
	FOREIGN KEY(route_id) REFERENCES route(route_id) ON DELETE CASCADE,
	FOREIGN KEY(bus_id) REFERENCES bus_details(bus_id) ON DELETE CASCADE,
	CONSTRAINT schedule_check UNIQUE (bus_id,schedule_date)  
)

select bus_details.capacity from bus_details join schedule on schedule.bus_id=bus_details.bus_id where schedule.schedule_id=1
select schedule.fare_amount,route.km FROM schedule JOIN route  ON route.route_id=schedule.route_id where schedule.schedule_id=4 


insert into schedule (bus_id,route_id,schedule_date,departare_time,fare_amount) values (3,1,'2023-03-05','12:30',2000)


SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED; 
BEGIN;
insert into schedule (bus_id,route_id,schedule_date,departare_time,fare_amount) values (1,1,'2023-03-05','12:30',2000);
END TRANSACTION;

select * from travel_schedule


drop table schedule


-- SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
BEGIN;
select * from schedule;
END TRANSACTION;



select * from schedule

SELECT route.starting_point,ro   ute.destination,route.km,
schedule.schedule_id,schedule.bus_id,schedule.route_id,schedule.schedule_date,schedule.departare_time,schedule.fare_amount,
bus_details.bus_name,bus_details.bus_type,bus_details.capacity
FROM ((schedule JOIN route  ON route.route_id=schedule.route_id) 
JOIN bus_details  ON bus_details.bus_id=schedule.bus_id)



insert into travel_schedule (bus_id,Stating_point,destination,schedule_date,departare_time,estimated_arrival_time,fare_amount,km) values (1,'dindigul','dindigul','2000-1-05','12:30','8:00',2000,500)






create table travel_schedule(
	schedule_id SERIAL PRIMARY KEY,
	bus_id INT,
	starting_point TEXT NOT NULL,
	destination TEXT NOT NULL,
	schedule_date DATE NOT NULL,
	departare_time TEXT NOT NULL,
	estimated_arrival_time TEXT NOT NULL,
	fare_amount float NOT NULL,
	km INT NOT NULL,
	FOREIGN KEY(bus_id) REFERENCES bus_details(bus_id)
)
