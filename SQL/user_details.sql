create table user_details(
	user_id SERIAL PRIMARY KEY,
	booking_id INT,
	user_name VARCHAR(15) NOT NULL,
	age INT,
	seat_no INT NOT NULL,
	FOREIGN KEY(booking_id) REFERENCES booking_details(booking_id) ON DELETE CASCADE
)


select * from user_details

drop table user_details


insert into user_details (booking_id,user_name,age,seat_no) values ()
