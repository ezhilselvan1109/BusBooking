create table booking_details(
	booking_id SERIAL PRIMARY KEY,
	schedule_id INT,
	customer_id INT,
	number_of_seats INT NOT NULL,
	boarding_stop VARCHAR(15) NOT NULL,
	dropping_stop VARCHAR(15) NOT NULL,
	total_amount FLOAT NOT NULL,
	FOREIGN KEY(schedule_id) REFERENCES schedule(schedule_id) ON DELETE CASCADE,
	FOREIGN KEY(customer_id) REFERENCES customer_details(customer_id) ON DELETE CASCADE
)

select booking_details.booking_id,schedule.schedule_date,booking_details.boarding_stop,booking_details.dropping_stop,booking_details.total_amount
FROM booking_details
JOIN schedule ON schedule.schedule_id=booking_details.schedule_id



SET TRANSACTION ISOLATION LEVEL READ COMMITTED ;
BEGIN;
SELECT * FROM booking_details;
END TRANSACTION;


select * from booking_details


drop table booking_details

SELECT booking_details .number_of_seats, booking_details .boarding_stop,booking_details.dropping_stop,booking_details.total_amount,
customer_details.customer_name,customer_details.customer_contact,customer_details.customer_email,schedule.schedule_date,bus_details.bus_type,bus_details.bus_name
FROM (((booking_details
JOIN customer_details  ON booking_details.customer_id=customer_details.customer_id)
JOIN schedule ON schedule.schedule_id=booking_details.schedule_id)
JOIN bus_details ON schedule.bus_id=bus_details.bus_id)where booking_details.booking_id=1


create table booking_details(
	booking_id SERIAL PRIMARY KEY,
	schedule_id INT,
	customer_id INT,
	number_of_seats INT NOT NULL,
	total_amount FLOAT NOT NULL,
	FOREIGN KEY(schedule_id) REFERENCES travel_schedule(schedule_id),
	FOREIGN KEY(customer_id) REFERENCES customer_details(customer_id)
)



insert into booking_details (schedule_id,customer_id,number_of_seats,total_amount) values(1,1,1,54);