CREATE TABLE customer_details(
	customer_id SERIAL PRIMARY KEY,
	customer_name VARCHAR(15) NOT NULL,
	customer_contact VARCHAR(10) NOT NULL UNIQUE,
	customer_email VARCHAR(35) UNIQUE,
	user_name VARCHAR(20) NOT NULL UNIQUE,
	user_password VARCHAR(20) NOT NULL
)

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED; 
BEGIN;
INSERT INTO customer_details (customer_name,customer_contact,customer_email,user_name,user_password) values('Ezhil','9876543211','ezhil@gmail.com','ezhil','Ezhil@123');
END TRANSACTION;

select customer_id,user_name,user_password from customer_details
BEGIN;
SELECT * FROM customer_details WHERE customer_id in(1,4) FOR UPDATE;
UPDATE customer_details SET customer_name = '' WHERE customer_id = 4;
COMMIT;


ROLLBACK;



select * from customer_details


drop table customer_details

SELECT booking_details .number_of_seats, booking_details .boarding_stop,booking_details.dropping_stop,booking_details.total_amount,
customer_details.customer_name,customer_details.customer_contact,customer_details.customer_email,schedule.schedule_date
FROM ((booking_details
JOIN customer_details  ON booking_details.customer_id=customer_details.customer_id)
JOIN schedule ON schedule.schedule_id=booking_details.schedule_id) where booking_details.booking_id=1




insert into customer_details (customer_name,customer_contact,customer_email,user_name,user_password) values('EZHIL','9876543211','ezhil@gmail.com','ezhil','ezhil');


delete from customer_details where customer_id=2