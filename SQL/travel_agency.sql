create table travel_agency(
	agency_id SERIAL PRIMARY KEY,
	agency_name VARCHAR(15) NOT NULL,
	agency_contact VARCHAR(10) NOT NULL UNIQUE,
	agency_email VARCHAR(35) UNIQUE,
	agent_username VARCHAR(20) NOT NULL UNIQUE,
	agent_password VARCHAR(25) NOT NULL
)



select * from travel_agency


drop table travel_agency



insert into travel_agency (agency_name,agency_contact,agency_email,agent_username,agent_password) values ('SELVAN','9876543211','selvan@gmail.com','selvan','Ezhil@123')
