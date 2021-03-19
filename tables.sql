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

ALTER TABLE user_order 
ADD PRIMARY KEY (id)

CREATE TABLE owner_detail (
    id integer NOT NULL,
    fname varchar(50),
    mname varchar(50),
    lname varchar(50),
    contact varchar(15),
    email varchar(50),
    PRIMARY KEY(id)
)
