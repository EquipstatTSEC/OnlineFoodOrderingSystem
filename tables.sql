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

ALTER TABLE restaurant 
MODIFY bank_branch varchar(50)

DROP TABLE restaurant_owners

CREATE TABLE restaurant_owners (
  id integer NOT NULL,
  owner_id integer,
  restaurant_id integer,
  PRIMARY KEY(id),
  FOREIGN KEY(owner_id) REFERENCES owner_detail(id),
  FOREIGN KEY(restaurant_id) REFERENCES restaurant(id)
)


ALTER TABLE restaurant 
RENAME COLUMN rest_name TO restaurant_name