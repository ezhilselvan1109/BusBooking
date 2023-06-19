create table schedule_stop(
	schedule_stop_id SERIAL PRIMARY KEY,
	schedule_id INT,
	route_stop_id INT,
	FOREIGN KEY(schedule_id) REFERENCES schedule(schedule_id) ON DELETE CASCADE,
	FOREIGN KEY(route_stop_id) REFERENCES route_stop(route_stop_id) ON DELETE CASCADE 
)


select * from schedule_stop

drop table schedule_stop

insert into schedule_stop (schedule_id,route_stop_id) values (1,2)

