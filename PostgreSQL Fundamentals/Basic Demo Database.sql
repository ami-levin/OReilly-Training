------------------------------
-- O'reilly Online Training --
-- PostgreSQL fundamentals ---
-- Basic Demos Database ------
------------------------------
-- https://github.com/ami-levin/OReilly-Training/tree/master/PostgreSQL%20Fundamentals
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

/*                                        
██████╗  █████╗ ███████╗██╗ ██████╗       ██████╗ ███████╗███╗   ███╗ ██████╗ ███████╗
██╔══██╗██╔══██╗██╔════╝██║██╔════╝       ██╔══██╗██╔════╝████╗ ████║██╔═══██╗██╔════╝
██████╔╝███████║███████╗██║██║            ██║  ██║█████╗  ██╔████╔██║██║   ██║███████╗
██╔══██╗██╔══██║╚════██║██║██║            ██║  ██║██╔══╝  ██║╚██╔╝██║██║   ██║╚════██║
██████╔╝██║  ██║███████║██║╚██████╗       ██████╔╝███████╗██║ ╚═╝ ██║╚██████╔╝███████║
╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝ ╚═════╝       ╚═════╝ ╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚══════╝                                                                             
*/

-- DROP DATABASE IF EXISTS basicdemos;
-- CREATE DATABASE basicdemos;

CREATE TABLE customers  (
                        customer VARCHAR(20) NOT NULL 
							PRIMARY KEY,
                        country VARCHAR(20) NULL
                        );

CREATE TABLE items		(
                        item VARCHAR(20) NOT NULL 
							PRIMARY KEY
                        );

CREATE TABLE orders		(
						orderid INTEGER NOT NULL 
							PRIMARY KEY,
						orderdate DATE NOT NULL,
						customer VARCHAR(20) NOT NULL 
							REFERENCES customers(customer) 
						);

CREATE TABLE orderitems (
                        orderid INTEGER NOT NULL 
							REFERENCES orders(orderid),
                        item VARCHAR(20) NOT NULL 
							REFERENCES items(item),
                        quantity INTEGER NOT NULL 
							CHECK (quantity > 0),
                        price DECIMAL(9,2) NOT NULL 
							CHECK (price >=0),
                        PRIMARY KEY (orderid, item)
                        );

INSERT INTO customers (customer, country)
VALUES ('Dave', 'USA'), ('John', 'USA'), ('Gerald', 'Canada'), ('Jose', 'Peru'), ('Tim', NULL);

INSERT INTO items (item)
VALUES  ('Pencil'), ('Pen'), ('Marker'), ('Notebook'), ('Ruler');

INSERT INTO orders (orderid, orderdate, customer)
VALUES  (1, '20180101', 'Dave'), (2, '20180102', 'John'), (3, '20180103', 'Gerald'), (4, '20180109', 'John');

INSERT INTO orderitems (orderid, item, quantity, price)
VALUES  (1, 'Pen', 2, 1.5), (1, 'Pencil', 1, 0.75),
        (2, 'Marker', 3, 3),
        (3, 'Pen', 1, 1.5), (3, 'Marker', 1, 3),
        (4, 'Pen', 4, 1.5), (4, 'Pencil', 2, 1.25), (4, 'Ruler', 2, 3);

