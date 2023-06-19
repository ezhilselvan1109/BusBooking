create table route_stop(
	route_stop_id SERIAL PRIMARY KEY,
	stop VARCHAR(15) NOT NULL,
	km INT NOT NULL,
	route_id INT,
	FOREIGN KEY(route_id) REFERENCES route(route_id) ON DELETE CASCADE
)


select * from route_stop where route_stop_id in(1,2)


select * from route_stop


drop table route_stop

SELECT route_stop .stop, route_stop .km,route_stop.route_stop_id
FROM schedule_stop 
JOIN route_stop ON route_stop.route_stop_id=schedule_stop.route_stop_id where schedule_stop.schedule_id=1;



insert into route_stop (stop,km,route_id) values();

select * from route_stop where route_id=2

