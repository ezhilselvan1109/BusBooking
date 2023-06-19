create table bus_seats(
	bus_seats_id SERIAL PRIMARY KEY,
	schedule_id INT,
	seat_no INT NOT NULL,
	available_seat BOOLEAN NOT NULL,
	FOREIGN KEY(schedule_id) REFERENCES schedule(schedule_id) ON DELETE CASCADE
)

insert into bus_seats(schedule_id,seat_no,available_seat) values(1,2,'0')

select * from bus_seats where bus_seats_id=1 for update; 

update bus_seats set available_seat=false where bus_seats_id=5
update bus_seats set available_seat=true where bus_seats_id=1

select * from bus_seats

select * from bus_seats order by bus_seats_id ASC

drop table bus_seats

delete from bus_seats where schedule_id=3


select COUNT(available_seat) from bus_seats where schedule_id=1 and available_seat=false


create table bus_seats(
	schedule_id INT,
	seat_no INT NOT NULL,
	available_seat BOOLEAN NOT NULL,
	FOREIGN KEY(schedule_id) REFERENCES travel_schedule(schedule_id)
)





select * from busseats

update busseats set available='1' where scheduleid=2 and seatno=1