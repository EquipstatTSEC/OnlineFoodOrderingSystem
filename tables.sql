CREATE TABLE user_detail (
	id integer NOT NULL,
	fname varchar(50),
	mname varchar(50),
	lname varchar(50),
	username varchar(100),
	contact varchar(15),
	email varchar(50),
	passw varchar(128),
	address_line_1 varchar(255),
	address_line_2 varchar(255),
	city varchar(70),
	pincode integer,
	state_name varchar(70),
	landmark varchar(70),
	is_verified integer,
	PRIMARY KEY (id)
) 

CREATE TABLE ticket (
	id integer NOT NULL,
	ticket_subject varchar(150),
	ticket_description varchar(255),
	ticket_status varchar(10),
	ticket_type varchar(20),
	ticket_date varchar(8),
	user_id integer,
	PRIMARY KEY(id),
	FOREIGN KEY(user_id) REFERENCES user_detail(id)
) 

CREATE TABLE user_order (
	id integer NOT NULL,
	user_id integer,
	order_description varchar(225),
	order_date varchar(8),
	payment_type varchar(15),
	order_status varchar(10),
	total integer,
	FOREIGN KEY(user_id) REFERENCES user_detail(id)
)

ALTER TABLE
	user_order
ADD
	PRIMARY KEY (id)
	
CREATE TABLE owner_detail (
	id integer NOT NULL,
	fname varchar(50),
	mname varchar(50),
	lname varchar(50),
	contact varchar(15),
	email varchar(50),
	PRIMARY KEY(id)
) 

CREATE TABLE restaurant (
	id integer NOT NULL,
	rest_name varchar(50),
	phone varchar(15),
	email varchar(50),
	pan varchar(10),
	fssai_number varchar(14),
	ec_certificate_no varchar(50),
	health_trade_licence varchar(50),
	address_line_1 varchar(255),
	address_line_2 varchar(255),
	city varchar(70),
	pincode integer,
	state_name varchar(70),
	landmark varchar(70),
	bank_name varchar(100),
	bank_account_no varchar(30),
	bank_branch varchar(20),
	ifsc_code varchar(20),
	PRIMARY KEY(id)
) 

CREATE TABLE restaurant_owners (
	id integer NOT NULL,
	owner_id integer,
	restaurant_id integer,
	PRIMARY KEY(id),
	FOREIGN KEY(owner_id) REFERENCES owner_detail(id),
	FOREIGN KEY(restaurant_id) REFERENCES restaurant(id)
)
	
CREATE TABLE item (
	id integer NOT NULL,
	restaurant_id integer,
	bestseller integer,
	item_type varchar(10),
	item_name varchar(100),
	price float,
	FOREIGN KEY(restaurant_id) REFERENCES restaurant(id),
	PRIMARY KEY(id)
) 
	
CREATE TABLE order_items (
	id integer NOT NULL,
	order_id integer,
	item_id integer,
	quantity integer,
	FOREIGN KEY(order_id) REFERENCES user_order(id),
	FOREIGN KEY(item_id) REFERENCES item(id),
	PRIMARY KEY(id)
) 
	
CREATE TABLE item_ingredients (
	id integer NOT NULL,
	item_id integer,
	ingredient_name varchar(50),
	FOREIGN KEY(item_id) REFERENCES item(id),
	PRIMARY KEY(id)
) 
	
-- ==========================================
ALTER TABLE
	restaurant
MODIFY
	bank_branch varchar(50)
	
DROP TABLE restaurant_owners 
	
CREATE TABLE restaurant_owners (
	id integer NOT NULL,
	owner_id integer,
	restaurant_id integer,
	PRIMARY KEY(id),
	FOREIGN KEY(owner_id) REFERENCES owner_detail(id),
	FOREIGN KEY(restaurant_id) REFERENCES restaurant(id)
)


ALTER TABLE
	restaurant RENAME COLUMN rest_name TO restaurant_name
	
desc user_detail

INSERT INTO
	user_detail
VALUES
	(
		1,
		'Dheeraj',
		'Deepak',
		'Lalwani',
		'MasterX',
		'8451904417',
		'lalwanidheeraj1234@gmail.com',
		'EasyPassword101',
		'Home, addr 1',
		'Home, addr 2',
		'Mumbai',
		400014,
		'Maharashtra',
		'Mandir',
		0
	)

INSERT INTO
	user_detail
VALUES
	(
		2,
		'Chirag',
		'Vinodkumar',
		'Lulla',
		'chiraglulla',
		'8329266084',
		'lullachirag239@gmail.com',
		'EasyPassword202',
		'Home, addr 1',
		'Home, addr 2',
		'Mumbai',
		421003,
		'Maharashtra',
		'Mandir',
		0
	)
	

INSERT INTO
	user_detail
VALUES
	(
		3,
		'Roshni',
		'XYZ',
		'Kukreja',
		'DuskyCaffine',
		'8295394820',
		'rkukrejaetahwah@gmail.com',
		'EasyPassword303',
		'Home, addr 1',
		'Home, addr 2',
		'Mumbai',
		421003,
		'Maharashtra',
		'Mandir',
		0
	)
	

INSERT INTO
	ticket(id, ticket_subject, user_id)
VALUES
	(1, 'Food was very Cold', 1)
	

INSERT
	ALL INTO ticket(id, ticket_subject, user_id)
VALUES
	(2, 'Food was very Bad', 2) 
INTO ticket(id, ticket_subject, user_id)
VALUES
	(3, 'Food was very Cold', 3)
	
select * from ticket


UPDATE
	ticket
SET
	ticket_description = 'late delivery',
	ticket_status = 'pending',
	ticket_type = 'greivance',
	ticket_date = '20210903'
WHERE
	user_id = 2


UPDATE
	ticket
SET
	ticket_subject = 'Food was very good',
	ticket_description = 'fast delivery',
	ticket_status = 'complete',
	ticket_type = 'feedback',
	ticket_date = '20210910'
WHERE
	user_id = 1


UPDATE
	ticket
SET
	ticket_subject = 'packing was very bad',
	ticket_description = 'packing left open',
	ticket_status = 'pending',
	ticket_type = 'greivance',
	ticket_date = '20210915'
WHERE
	user_id = 3
	

DELETE FROM
	ticket
WHERE
	user_id = 3

select
	*
from
	ticket
	

DELETE FROM
	ticket
	

select
	*
from
	ticket
	

INSERT INTO
	ticket(id, ticket_subject, user_id)
VALUES
	(1, 'Food was very Cold', 1)

INSERT
	ALL INTO ticket(id, ticket_subject, user_id)
VALUES
	(2, 'Food was very Bad', 2) INTO ticket(id, ticket_subject, user_id)
VALUES
	(3, 'Food was very Cold', 3)

select
	*
from
	ticket
	
	
UPDATE
	ticket
SET
	ticket_description = 'late delivery',
	ticket_status = 'pending',
	ticket_type = 'greivance',
	ticket_date = '20210903'
WHERE
	user_id = 2


UPDATE
	ticket
SET
	ticket_subject = 'Food was very good',
	ticket_description = 'fast delivery',
	ticket_status = 'complete',
	ticket_type = 'feedback',
	ticket_date = '20210910'
WHERE
	user_id = 1
	

UPDATE
	ticket
SET
	ticket_subject = 'packing was very bad',
	ticket_description = 'packing left open',
	ticket_status = 'pending',
	ticket_type = 'greivance',
	ticket_date = '20210915'
WHERE
	user_id = 3
	
select
	*
from
	ticket
	

ALTER TABLE
	ticket DROP PRIMARY KEY
	
ALTER TABLE
	ticket
ADD
	CONSTRAINT id PRIMARY KEY (id)


INSERT INTO
	restaurant
VALUES
	(
		1,
		'Aandmandkhatola',
		'48594859',
		'aandmandkhatola@something.com',
		'BAQY723829',
		'95305905109249',
		'ExampleCertificate1',
		'HealthTradeLicense1',
		'R.V. Road',
		'Albela nagar',
		'Mumbai',
		400024,
		'Maharashtra',
		'Milkyway',
		'PMC',
		'BEOS93024021',
		'Takatakawadi',
		'PMJC3042'
	)
	
INSERT INTO
	restaurant
VALUES
	(
		2,
		'Tuskins',
		'48594859',
		'tuskins@something.com',
		'GAQY723829',
		'23505905109249',
		'ExampleCertificate2',
		'HealthTradeLicense2',
		'K.V. Road',
		'Chand nagar',
		'Mumbai',
		400022,
		'Maharashtra',
		'Milkyway',
		'UBS',
		'UBS93024021',
		'Chikuawadi',
		'UBSBC3042'
	)
	

INSERT INTO
	item
VALUES
	(
		1,
		1,
		1,
		'veg',
		'Paneer Tikka Masala',
		450.00
	)
	
INSERT INTO
	item
VALUES
	(
		2,
		1,
		0,
		'jain',
		'Vadapav',
		350.00
	)
	
INSERT INTO
	item
VALUES
	(
		3,
		2,
		1,
		'veg',
		'Cheese Burst Pizza',
		500.00
	)
	
INSERT INTO
	item
VALUES
	(
		4,
		2,
		0,
		'non-veg',
		'egg rolls',
		500.00
	)

select * from item
	
ALTER TABLE
	item DROP CONSTRAINT SYS_C0057042864
	
ALTER TABLE
	item
ADD
	FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)

SELECT * FROM item

SELECT * FROM item WHERE price BETWEEN 100 AND 400

SELECT * FROM item

SELECT * FROM item WHERE item_name BETWEEN 'Vadapav' AND 'Cheese Burst Pizza' ORDER BY item_name  --DOUBT

SELECT * FROM ticket

UPDATE ticket SET ticket_date=NULL

ALTER TABLE ticket MODIFY ticket_date DATE

UPDATE ticket 
SET ticket_date = TO_DATE('20-06-2020', 'DD-MM-YYYY')
WHERE id = 1

UPDATE ticket 
SET ticket_date = TO_DATE('09-04-2019', 'DD-MM-YYYY')
WHERE id = 2

UPDATE ticket 
SET ticket_date = TO_DATE('09-12-2011', 'DD-MM-YYYY')
WHERE id = 3

INSERT INTO
	ticket(id, ticket_subject, ticket_description, ticket_status, ticket_type, ticket_date, user_id)
VALUES
	(4, 'Food was goodest', 'Awesome', 'completed', 'feedback', TO_DATE('07-11-2016', 'DD-MM-YYYY'), 4)

SELECT * FROM ticket WHERE ticket_date BETWEEN '01-NOV-16' AND '30-JUN-20'

SELECT * FROM item WHERE price NOT BETWEEN 100 AND 400

SELECT * FROM ticket WHERE ticket_date NOT BETWEEN '01-NOV-16' AND '30-JUN-20'

SELECT * FROM restaurant

SELECT * FROM restaurant WHERE NOT pincode = 400022

INSERT INTO
	restaurant
VALUES
	(
		3,
		'Olo',
		'48594851',
		'olo@something.com',
		'QAQY723829',
		'98505905109249',
		'ExampleCertificate3',
		'HealthTradeLicense3',
		'A.V. Road',
		'Thand nagar',
		'Banglore',
		400021,
		'Karnataka',
		'Chaiway',
		'UBC',
		'UBC93024021',
		'Dhikuawadi',
		'UBCBC3042'
	)

INSERT INTO
	restaurant
VALUES
	(
		4,
		'Dolo',
		'58594851',
		'dolo@something.com',
		'DAQY723829',
		'68505905109249',
		'ExampleCertificate3',
		'HealthTradeLicense3',
		'D.V. Road',
		'Dhand nagar',
		'Thane',
		400021,
		'Maharashtra',
		'Dhaiway',
		'UBD',
		'UBD93024021',
		'Ddikuawadi',
		'UBDBC3042'
	)

SELECT restaurant_name FROM restaurant WHERE city IN ('Banglore', 'Thane')

SELECT restaurant_name FROM restaurant WHERE city NOT IN ('Banglore', 'Thane')

SELECT * FROM user_detail

SELECT restaurant_name FROM restaurant WHERE city IN ( SELECT city FROM user_detail )

SELECT restaurant_name FROM restaurant WHERE city NOT IN ( SELECT city FROM user_detail )

SELECT * FROM item WHERE price = 350

SELECT * FROM item WHERE price > 350

SELECT * FROM item WHERE price < 450

SELECT * FROM item WHERE price >= 500

SELECT * FROM item WHERE price <= 500

SELECT * FROM item WHERE price <> 450

CREATE TABLE special_item (
	id integer NOT NULL,
	restaurant_id integer,
	bestseller integer,
	item_type varchar(10),
	item_name varchar(100),
	price float,
	FOREIGN KEY(restaurant_id) REFERENCES restaurant(id),
	PRIMARY KEY(id)
) 