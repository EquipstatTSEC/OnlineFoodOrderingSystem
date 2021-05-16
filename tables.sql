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
);

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
); 

CREATE TABLE user_order (
	id integer NOT NULL,
	user_id integer,
	order_description varchar(225),
	order_date varchar(8),
	payment_type varchar(15),
	order_status varchar(10),
	total integer,
	FOREIGN KEY(user_id) REFERENCES user_detail(id)
);

ALTER TABLE
	user_order
ADD
	PRIMARY KEY (id);
	
CREATE TABLE owner_detail (
	id integer NOT NULL,
	fname varchar(50),
	mname varchar(50),
	lname varchar(50),
	contact varchar(15),
	email varchar(50),
	PRIMARY KEY(id)
);

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
) ;

CREATE TABLE restaurant_owners (
	id integer NOT NULL,
	owner_id integer,
	restaurant_id integer,
	PRIMARY KEY(id),
	FOREIGN KEY(owner_id) REFERENCES owner_detail(id),
	FOREIGN KEY(restaurant_id) REFERENCES restaurant(id)
);
	
CREATE TABLE item (
	id integer NOT NULL,
	restaurant_id integer,
	bestseller integer,
	item_type varchar(10),
	item_name varchar(100),
	price float,
	FOREIGN KEY(restaurant_id) REFERENCES restaurant(id),
	PRIMARY KEY(id)
) ;
	
CREATE TABLE order_items (
	id integer NOT NULL,
	order_id integer,
	item_id integer,
	quantity integer,
	FOREIGN KEY(order_id) REFERENCES user_order(id),
	FOREIGN KEY(item_id) REFERENCES item(id),
	PRIMARY KEY(id)
) ;
	
CREATE TABLE item_ingredients (
	id integer NOT NULL,
	item_id integer,
	ingredient_name varchar(50),
	FOREIGN KEY(item_id) REFERENCES item(id),
	PRIMARY KEY(id)
) ;
	
-- ==========================================

ALTER TABLE restaurant MODIFY bank_branch varchar(50);
DROP TABLE restaurant_owners;
CREATE TABLE restaurant_owners ( 
	id integer NOT NULL, 
	owner_id integer, 
	restaurant_id integer, 
	PRIMARY KEY(id), 
	FOREIGN KEY(owner_id) REFERENCES owner_detail(id), 
	FOREIGN KEY(restaurant_id) REFERENCES restaurant(id) 
);
ALTER TABLE restaurant RENAME COLUMN rest_name TO restaurant_name;
desc user_detail;
INSERT INTO
    user_detail 
VALUES
    (
        1, 'Dheeraj', 'Deepak', 'Lalwani', 'MasterX', '8451904417', 'lalwanidheeraj1234@gmail.com', 'EasyPassword101', 'Home, addr 1', 'Home, addr 2', 'Mumbai', 400014, 'Maharashtra', 'Mandir', 0 
    )
;
INSERT INTO
    user_detail 
VALUES
    (
        2, 'Chirag', 'Vinodkumar', 'Lulla', 'chiraglulla', '8329266084', 'lullachirag239@gmail.com', 'EasyPassword202', 'Home, addr 1', 'Home, addr 2', 'Mumbai', 421003, 'Maharashtra', 'Mandir', 0 
    )
;
INSERT INTO
    user_detail 
VALUES
    (
        3, 'Roshni', 'XYZ', 'Kukreja', 'DuskyCaffine', '8295394820', 'rkukrejaetahwah@gmail.com', 'EasyPassword303', 'Home, addr 1', 'Home, addr 2', 'Mumbai', 421003, 'Maharashtra', 'Mandir', 0 
    )
;
INSERT INTO
    ticket(id, ticket_subject, user_id) 
VALUES
    (
        1, 'Food was very Cold', 1
    )
;
INSERT ALL INTO ticket(id, ticket_subject, user_id) 
VALUES
    (
        2, 'Food was very Bad', 2
    )
    INTO ticket(id, ticket_subject, user_id) 
VALUES
    (
        3, 'Food was very Cold', 3
    )
;
select
    * 
from
    ticket;
UPDATE
    ticket 
SET
    ticket_description = 'late delivery',
    ticket_status = 'pending',
    ticket_type = 'greivance' 
WHERE
    user_id = 2 ;
UPDATE
    ticket 
SET
    ticket_subject = 'Food was very good',
    ticket_description = 'fast delivery',
    ticket_status = 'complete',
    ticket_type = 'feedback' 
WHERE
    user_id = 1 ;
UPDATE
    ticket 
SET
    ticket_subject = 'packing was very bad',
    ticket_description = 'packing left open',
    ticket_status = 'pending',
    ticket_type = 'greivance' 
WHERE
    user_id = 3 ;
DELETE
FROM
    ticket 
WHERE
    user_id = 3 ;
select
    * 
from
    ticket ;
DELETE
FROM
    ticket ;
select
    * 
from
    ticket ;
INSERT INTO
    ticket(id, ticket_subject, user_id) 
VALUES
    (
        1,
        'Food was very Cold',
        1
    )
;
INSERT ALL INTO ticket(id, ticket_subject, user_id) 
VALUES
    (
        2,
        'Food was very Bad',
        2
    )
    INTO ticket(id, ticket_subject, user_id) 
VALUES
    (
        3,
        'Food was very Cold',
        3
    )
    select
        * 
    from
        ticket ;
UPDATE
    ticket 
SET
    ticket_description = 'late delivery',
    ticket_status = 'pending',
    ticket_type = 'greivance' 
WHERE
    user_id = 2 ;
UPDATE
    ticket 
SET
    ticket_subject = 'Food was very good',
    ticket_description = 'fast delivery',
    ticket_status = 'complete',
    ticket_type = 'feedback' 
WHERE
    user_id = 1 ;
UPDATE
    ticket 
SET
    ticket_subject = 'packing was very bad',
    ticket_description = 'packing left open',
    ticket_status = 'pending',
    ticket_type = 'greivance' 
WHERE
    user_id = 3 ;
select
    * 
from
    ticket ;
ALTER TABLE ticket DROP PRIMARY KEY ;
ALTER TABLE ticket ADD CONSTRAINT id PRIMARY KEY (id) ;
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
;
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
;
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
;
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
;
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
;
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
;
select
    * 
from
    item ;
ALTER TABLE item DROP CONSTRAINT SYS_C0058481679 ;
ALTER TABLE item ADD FOREIGN KEY (restaurant_id) REFERENCES restaurant(id) ;
SELECT
    * 
FROM
    item ;
SELECT
    * 
FROM
    item 
WHERE
    price BETWEEN 100 AND 400;
SELECT
    * 
FROM
    item ;
-- SELECT * FROM item WHERE item_name BETWEEN 'Vadapav' AND 'Cheese Burst Pizza' ORDER BY item_name  DOUBT -- 
SELECT
    * 
FROM
    ticket ;
UPDATE
    ticket 
SET
    ticket_date = NULL;
ALTER TABLE ticket MODIFY ticket_date DATE ;
UPDATE
    ticket 
SET
    ticket_date = TO_DATE('20-06-2020', 'DD-MM-YYYY') 
WHERE
    id = 1 ;
UPDATE
    ticket 
SET
    ticket_date = TO_DATE('09-04-2019', 'DD-MM-YYYY') 
WHERE
    id = 2 ;
UPDATE
    ticket 
SET
    ticket_date = TO_DATE('09-12-2011', 'DD-MM-YYYY') 
WHERE
    id = 3 ;
SELECT
    * 
FROM
    ticket 
WHERE
    ticket_date BETWEEN '01-NOV-16' AND '30-JUN-20' ;
SELECT
    * 
FROM
    item 
WHERE
    price NOT BETWEEN 100 AND 400 ;
SELECT
    * 
FROM
    ticket 
WHERE
    ticket_date NOT BETWEEN '01-NOV-16' AND '30-JUN-20' ;
SELECT
    * 
FROM
    restaurant ;
SELECT
    * 
FROM
    restaurant 
WHERE
    NOT pincode = 400022 ;
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
;
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
;
SELECT
    restaurant_name 
FROM
    restaurant 
WHERE
    city IN 
    (
        'Banglore',
        'Thane'
    )
;
SELECT
    restaurant_name 
FROM
    restaurant 
WHERE
    city NOT IN 
    (
        'Banglore',
        'Thane'
    )
;
SELECT
    * 
FROM
    user_detail ;
SELECT
    restaurant_name 
FROM
    restaurant 
WHERE
    city IN 
    (
        SELECT
            city 
        FROM
            user_detail 
    )
;
SELECT
    restaurant_name 
FROM
    restaurant 
WHERE
    city NOT IN 
    (
        SELECT
            city 
        FROM
            user_detail 
    )
;
SELECT
    * 
FROM
    item 
WHERE
    price = 350 ;
SELECT
    * 
FROM
    item 
WHERE
    price > 350 ;
SELECT
    * 
FROM
    item 
WHERE
    price < 450 ;
SELECT
    * 
FROM
    item 
WHERE
    price >= 500 ;
SELECT
    * 
FROM
    item 
WHERE
    price <= 500 ;
SELECT
    * 
FROM
    item 
WHERE
    price <> 450 ;
CREATE TABLE special_item ( id integer NOT NULL, restaurant_id integer, bestseller integer, item_type varchar(10), item_name varchar(100), price float, FOREIGN KEY(restaurant_id) REFERENCES restaurant(id), PRIMARY KEY(id) ) ;
INSERT INTO
    special_item 
VALUES
    (
        2,
        1,
        0,
        'jain',
        'Vadapav',
        350.00 
    )
;
INSERT INTO
    special_item 
VALUES
    (
        3,
        2,
        1,
        'veg',
        'Cheese Burst Pizza',
        500.00 
    )
;
INSERT INTO
    special_item 
VALUES
    (
        1,
        2,
        1,
        'veg',
        'Cheesy Pasta',
        700.00 
    )
;
select
    * 
from
    special_item ;
select
    * 
from
    item ;
select
    * 
from
    special_item 
UNION
select
    * 
from
    item ;
select
    * 
from
    item 
UNION ALL
select
    * 
from
    special_item ;
select
    * 
from
    special_item 
INTERSECT
select
    * 
from
    item ;
select
    * 
from
    special_item MINUS 
    select
        * 
    from
        item ;
SELECT
    COUNT(item_name),
    item_type 
FROM
    item 
GROUP BY
    item_type;
SELECT
    COUNT(restaurant_name),
    city 
FROM
    restaurant 
GROUP BY
    city;
select
    * 
from
    (
        select
            * 
        from
            item 
        UNION
        select
            * 
        from
            special_item
    )
WHERE
    item_name LIKE 'Chees_%' ;
select
    * 
from
    (
        select
            * 
        from
            item 
        UNION
        select
            * 
        from
            special_item
    )
WHERE
    item_name NOT LIKE 'Chees_%' ;
select
    restaurant_name,
    address_line_1,
    address_line_2 
from
    restaurant 
where
    city LIKE 'Mumbai' 
    OR city LIKE 'Banglore' ;
select
    concat('Aandmandkhatola', 'Chirag Lulla') 
from
    dual;
select
    upper('mumbai'),
    lower('MuMbaI') 
from
    dual;
select
    ascii('D'),
    ascii('C'),
    length('Chirag & Dheeraj') 
from
    dual ;
select
    max(price) 
from
    item ;
INSERT INTO
    user_detail 
VALUES
    (
        4,
        'Aaayush',
        'XYZ',
        'Wadhwani',
        'KingAA',
        '8888888888',
        'aayushwadhwani99@gmail.com',
        'EasyPassword300',
        'Home, addr 1',
        'Home, addr 2',
        'Mumbai',
        421000,
        'Maharashtra',
        'Mandir',
        0 
    )
;
INSERT INTO
    ticket(id, ticket_subject, ticket_description, ticket_status, ticket_type, ticket_date, user_id) 
VALUES
    (
        4,
        'Food was goodest',
        'Awesome',
        'completed',
        'feedback',
        TO_DATE('07-11-2016', 'DD-MM-YYYY'),
        4
    )
;
select
    * 
from
    user_detail;
select
    * 
from
    ticket;
select
    * 
from
    user_order;
select
    * 
from
    restaurant;
select
    * 
from
    owner_detail;
select
    * 
from
    restaurant_owners;
select
    * 
from
    item;
select
    * 
from
    order_items;
select
    * 
from
    item_ingredients;
-- 1. Select usernames of users whose ticket are pending to be responded.
select
    username 
from
    user_detail 
where
    id in 
    (
        select
            user_id 
        from
            ticket 
        where
            ticket_status = 'pending' 
    )
;
INSERT INTO
    item 
VALUES
    (
        7,
        3,
        0,
        'veg',
        'Paneer Tikka Masala',
        800.00 
    )
;
INSERT INTO
    item 
VALUES
    (
        5,
        3,
        1,
        'jain',
        'Vadapav',
        100.00 
    )
;
INSERT INTO
    item 
VALUES
    (
        6,
        4,
        0,
        'veg',
        'Cheese Burst Pizza',
        670.00 
    )
;
-- 2. Select restaurants name and location (city) where there are bestseller items
select
    restaurant_name,
    city 
from
    restaurant 
where
    id in 
    (
        select
            restaurant_id 
        from
            item 
        where
            bestseller = 1 
    )
;
-- 3. Select user's location according to location of restaurants having bestseller
select
    city 
from
    user_detail 
where
    user_detail.city in 
    (
        select
            restaurant.city 
        from
            restaurant 
        where
            id in 
            (
                select
                    restaurant_id 
                from
                    item 
                where
                    bestseller = 1 
            )
    )
;
-- 4. Select name of restaurants from the location of users got from previous query
select
    restaurant_name 
from
    restaurant 
where
    restaurant.city in 
    (
        select
            city 
        from
            user_detail 
        where
            user_detail.city in 
            (
                select
                    restaurant.city 
                from
                    restaurant 
                where
                    id in 
                    (
                        select
                            restaurant_id 
                        from
                            item 
                        where
                            bestseller = 1 
                    )
            )
    )
;
-- 5. Select restaurant id from the location of users got from previous to previous query
select
    id 
from
    restaurant 
where
    restaurant.city in 
    (
        select
            user_detail.city 
        from
            user_detail 
        where
            user_detail.city in 
            (
                select
                    restaurant.city 
                from
                    restaurant 
                where
                    id in 
                    (
                        select
                            restaurant_id 
                        from
                            item 
                        where
                            bestseller = 1 
                    )
            )
    )
;
-- 6. Select item name and price for user which are bestseller and near to users location's restaurant.
select
    item_name,
    price 
from
    item 
where
    restaurant_id in 
    (
        select
            id 
        from
            restaurant 
        where
            restaurant.city in 
            (
                select
                    user_detail.city 
                from
                    user_detail 
                where
                    user_detail.city in 
                    (
                        select
                            restaurant.city 
                        from
                            restaurant 
                        where
                            id in 
                            (
                                select
                                    restaurant_id 
                                from
                                    item 
                            )
                    )
            )
    )
    and item.bestseller = 1;
select
    * 
from
    restaurant;
select
    * 
from
    item;
select
    * 
from
    user_detail;
INSERT INTO
    user_detail 
VALUES
    (
        5,
        'Harsh',
        'Gaurang',
        'Kapadia',
        'Hersheys',
        '9999999999',
        'hersheys@gmail.com',
        'EasyPassword101',
        'Home, addr 1',
        'Home, addr 2',
        'Thane',
        421009,
        'Maharashtra',
        'Mandir',
        0 
    )
;
insert into
    user_order(id, user_id, order_description, payment_type, order_status) 
values
    (
        1,
        1,
        'Get it delivered sharp 10 am',
        'COD',
        'pending'
    )
;
insert into
    user_order(id, user_id, order_description, payment_type, order_status) 
values
    (
        2,
        1,
        'Give extra onion packets',
        'Net Banking',
        'processing'
    )
;
insert into
    user_order(id, user_id, order_description, payment_type, order_status) 
values
    (
        3,
        2,
        'Give extra colddrink',
        'COD',
        'pending'
    )
;
insert into
    user_order(id, user_id, order_description, payment_type, order_status) 
values
    (
        4,
        3,
        'Give extra schezwan packets',
        'Net Banking',
        'complete'
    )
;
insert into
    user_order(id, user_id, order_description, payment_type, order_status) 
values
    (
        5,
        4,
        'Give extra salad packets',
        'COD',
        'processing'
    )
;
insert into
    user_order(id, user_id, order_description, payment_type, order_status) 
values
    (
        6,
        4,
        'Give extra burritos packets',
        'Net Banking',
        'complete'
    )
;
select
    * 
from
    user_order;
alter table user_order MODIFY order_date DATE;
update
    user_order 
set
    order_date = TO_DATE('20-06-2020', 'DD-MM-YYYY') 
where
    id = 1;
update
    user_order 
set
    order_date = TO_DATE('21-06-2020', 'DD-MM-YYYY') 
where
    id = 2;
update
    user_order 
set
    order_date = TO_DATE('22-06-2020', 'DD-MM-YYYY') 
where
    id = 3;
update
    user_order 
set
    order_date = TO_DATE('23-06-2020', 'DD-MM-YYYY') 
where
    id = 4;
update
    user_order 
set
    order_date = TO_DATE('24-06-2020', 'DD-MM-YYYY') 
where
    id = 5;
update
    user_order 
set
    order_date = TO_DATE('25-06-2020', 'DD-MM-YYYY') 
where
    id = 6;
alter table user_order drop column total;
insert into
    order_items 
values
    (
        1,
        1,
        7,
        2
    )
;
insert into
    order_items 
values
    (
        2,
        1,
        4,
        2
    )
;
insert into
    order_items 
values
    (
        3,
        2,
        5,
        5
    )
;
insert into
    order_items 
values
    (
        4,
        3,
        3,
        1
    )
;
insert into
    order_items 
values
    (
        5,
        4,
        1,
        2
    )
;
insert into
    order_items 
values
    (
        6,
        5,
        4,
        2
    )
;
insert into
    order_items 
values
    (
        5,
        6,
        1,
        2
    )
;
-- 7. Select order date of order when an item of id 1 was ordered.
select
    order_date 
from
    user_order 
where
    order_id in 
    (
        select
            order_id 
        from
            order_items 
        where
            item_id = 1 
    )
;
-- 8. Select order status of those orders having non-veg items.
select
    order_status 
from
    user_order 
where
    id in 
    (
        select
            order_id 
        from
            order_items 
        where
            item_id in 
            (
                select
                    id 
                from
                    item 
                where
                    item_type = 'non-veg' 
            )
    )
;
-- 9. Select all items ordered by user having id 1.
select
    item_name 
from
    item 
where
    id in 
    (
        select
            item_id 
        from
            order_items 
        where
            order_id in
            (
                select
                    id 
                from
                    user_order 
                where
                    user_id = 1 
            )
    )
;
-- 10. Select all items ordered by user having id 1 and have ordered on 20-JUN-20.
select
    item_name 
from
    item 
where
    id in 
    (
        select
            item_id 
        from
            order_items 
        where
            order_id in
            (
                select
                    id 
                from
                    user_order 
                where
                    user_id = 1 
                    and order_date = '20-JUN-20' 
            )
    )
;
select
    * 
from
    user_order;
select
    * 
from
    item;
select
    * 
from
    order_items;
-- Complex Queries.
-- Joins
-- Inner join
-- 1. Prepare a report of users' tickets.
select
    user_detail.fname,
    user_detail.lname,
    user_detail.email,
    ticket.ticket_subject,
    ticket.ticket_status,
    ticket.ticket_date 
from
    user_detail 
    inner join
        ticket 
        on user_detail.id = ticket.user_id;
-- 2. Prepare a report of users' orders.
select
    user_detail.fname,
    user_detail.address_line_1,
    user_detail.address_line_2,
    user_order.order_description,
    user_order.order_status 
from
    user_detail 
    inner join
        user_order 
        on user_detail.id = user_order.user_id;
INSERT INTO
    user_detail 
VALUES
    (
        6,
        'Kunal',
        'Lachman',
        'Budhrani',
        'Kunu',
        '1234567812',
        'kunu@gmail.com',
        'EasyPassword199',
        'Home, addr 1',
        'Home, addr 2',
        'Banglore',
        521021,
        'Karnataka',
        'Mandir',
        1 
    )
;
INSERT INTO
    user_detail 
VALUES
    (
        7,
        'Varun',
        'XYZ',
        'Mamtora',
        'VarunM',
        '1234567890',
        'varunm@gmail.com',
        'EasyPassword200',
        'Home, addr 1',
        'Home, addr 2',
        'Chennai',
        521021,
        'Tamil Nadu',
        'Mandir',
        1 
    )
;
-- Left join
-- 1. Prepare a report of users and their orders along with users who haven't ordered since they have registered.
select
    user_detail.fname,
    user_detail.address_line_1,
    user_detail.address_line_2,
    user_order.order_description,
    user_order.order_status 
from
    user_detail 
    left join
        user_order 
        on user_detail.id = user_order.user_id;
-- 2. Prepare a report of users and their ticket along with users who haven't submitted any ticket since they have registered.
select
    user_detail.fname,
    user_detail.lname,
    user_detail.email,
    ticket.ticket_subject,
    ticket.ticket_status,
    ticket.ticket_date 
from
    user_detail 
    left join
        ticket 
        on user_detail.id = ticket.user_id;
-- Right join
-- 1. Reverse of the first query in left join.
select
    user_detail.fname,
    user_detail.address_line_1,
    user_detail.address_line_2,
    user_order.order_description,
    user_order.order_status 
from
    user_order 
    right join
        user_detail 
        on user_detail.id = user_order.user_id;
--2. Reverse of the second query in left join.
select
    user_detail.fname,
    user_detail.lname,
    user_detail.email,
    ticket.ticket_subject,
    ticket.ticket_status,
    ticket.ticket_date 
from
    ticket 
    right join
        user_detail 
        on user_detail.id = ticket.user_id;
-- Full join
select
    user_detail.id,
    user_detail.fname,
    user_detail.lname,
    user_detail.email,
    user_order.id,
    user_order.order_date,
    user_order.order_status,
    item.id,
    item.item_name,
    item.item_price 
from
    (
        user_detail 
        full join
            (
                user_order 
                full join
                    (
                        order_items 
                        full join
                            item 
                            on order_items.item_id = item.id 
                    )
                    on user_order.id = order_items.order_id 
            )
            on user_detail.id = user_order.user_id 
    )
;
