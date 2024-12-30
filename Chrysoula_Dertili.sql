SET NAMES UTF8MB4;
DROP DATABASE IF EXISTS hotelreservations;
CREATE DATABASE hotelreservations;
USE hotelreservations;

CREATE TABLE rooms
(
	roomid INTEGER NOT NULL,
    beds INTEGER NOT NULL,
    size FLOAT NOT NULL,
    roomview ENUM('Mountain', 'Pool', 'Garden', 'Sea') NOT NULL,
    price_pernight DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_rooms PRIMARY KEY (roomid)
)ENGINE=InnoDB  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE customers
(
	customerid INTEGER NOT NULL,
    firstname  VARCHAR(50) NOT NULL,
    lastname   VARCHAR(50) NOT NULL,
    id      VARCHAR(50)    NOT NULL,
    street  VARCHAR(50)    NOT NULL,
    snumber  NUMERIC(6) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    mobilenumber VARCHAR(10) NOT NULL,
    creditcardnumber VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL,
    CONSTRAINT pk_customers PRIMARY KEY (customerid)
)ENGINE=InnoDB  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE reservations
(
	reservationid INTEGER NOT NULL,
    customerid INTEGER NOT NULL,
    roomid INTEGER NOT NULL,
	checkindate DATE,
    checkoutdate DATE,
    finalprice DECIMAL(10,2),
    CONSTRAINT pk_reservations PRIMARY KEY (reservationid),
    FOREIGN KEY (customerid) REFERENCES customers(customerid),
    FOREIGN KEY (roomid) REFERENCES rooms(roomid)
)ENGINE=InnoDB  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE purchases
(
	purchasesid INTEGER NOT NULL,
    reservationid INTEGER NOT NULL,
    customerid INTEGER NOT NULL,
	purchasedate DATE,
    item VARCHAR(255),
    amount DECIMAL(10,2),
    CONSTRAINT pk_purchases PRIMARY KEY (purchasesid),
    FOREIGN KEY (customerid) REFERENCES customers(customerid),
    FOREIGN KEY (reservationid) REFERENCES reservations(reservationid)
)ENGINE=InnoDB  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

INSERT INTO rooms VALUES (101,2,18,'Mountain',85);
INSERT INTO rooms VALUES (102,2,18,'Pool',85);
INSERT INTO rooms VALUES (103,3,20,'Garden',90);
INSERT INTO rooms VALUES (201,2,18,'Sea',90);
INSERT INTO rooms VALUES (202,2,18,'Mountain',90);
INSERT INTO rooms VALUES (203,3,20,'Pool',95);
INSERT INTO rooms VALUES (301,2,20,'Garden',100);
INSERT INTO rooms VALUES (302,2,18,'Sea',100);
INSERT INTO rooms VALUES (303,3,20,'Mountain',110);
INSERT INTO rooms VALUES (304,3,20,'Garden',110);

INSERT INTO customers values (1,'Μαρία','Παπαδοπούλου','AK456201','Θεσσαλίας',45,'Πετρούπολη','Ελλάδα','6984562310','1520 1232 5498 2035','mariap@gmail.com');
INSERT INTO customers values (2,'Δημήτρης','Αλεξίου','ΑΛ758946','Αγίου Δημητρίου',52,'Αργυρούπολη','Ελλάδα','6984526310','2562 1235 1256 1249','dimitrisa@gmail.com');
INSERT INTO customers values (3,'Αμάντα','Θεοτοκάτου','ΑΜ457896','Μάρκου Μπότσαρη',89,'Ίλιον','Ελλάδα','6987524110','5642 2646 2354 1365','amantath@gmail.com');
INSERT INTO customers values (4,'Βασίλης','Περρής','ΑΚ547931','Θράκης',23,'Περιστέρι','Ελλάδα','6984756210','1205 2658 2456 1287','vasilisp@gmail.com');
INSERT INTO customers values (5,'Δέσποινα','Αθανασίου','ΑΛ103256','Βαλτετσίου',105,'Πλάκα','Ελλάδα','6925456230','1545 6898 5235 1204','despoinath@gmail.com');
INSERT INTO customers values (6,'Χριστίνα','Νικοπολίτη','ΑΜ106160','Βορείου Ηπείρου',228,'Δάφνη','Ελλάδα','6902356520','2301 5640 2365 2045','christinan@gmail.com');
INSERT INTO customers values (7,'Ανδρέας','Βίσκας','ΑΚ403256','Ναϊάδων',15,'Χαλκίδα','Ελλάδα','6945627120','2013 1548 6585 1289','andreasv@gmail.com');
INSERT INTO customers values (8,'Ηλίας','Αγγελίνας','ΑΛ568032','Κώστα Βάρναλη',105,'Πάτρα','Ελλάδα','6978623150','1032 5879 2016 0321','iliasa@gmail.com');
INSERT INTO customers values (9,'Αργύρης','Βλάσσης','ΑΛ560321','Υψηλάντου',18,'Καλαμάτα','Ελλάδα','6920134560','2569 0325 1456 0258','argyrisvl@gmail.com');
INSERT INTO customers values (10,'Παύλος','Αρβανιτάκης','ΑΚ120302','Κύπρου',49,'Λαμία','Ελλάδα','6974562130','0213 5489 5678 0214','pavlosa@gmail.com');

INSERT INTO reservations VALUES (1001,5,304,'2024-06-24','2024-06-30',660);
INSERT INTO reservations VALUES (1002,8,203,'2024-02-24','2024-02-29',475);
INSERT INTO reservations VALUES (1003,9,101,'2024-03-19','2024-03-26',595);
INSERT INTO reservations VALUES (1004,4,203,'2023-07-24','2023-08-04',1045);
INSERT INTO reservations VALUES (1005,1,103,'2023-08-10','2023-08-20',900);
INSERT INTO reservations VALUES (1006,2,304,'2023-09-24','2023-09-28',440);
INSERT INTO reservations VALUES (1007,6,102,'2024-01-02','2024-01-06',340);
INSERT INTO reservations VALUES (1008,3,203,'2023-12-24','2023-12-30',570);
INSERT INTO reservations VALUES (1009,10,201,'2023-12-24','2023-12-30',540);
INSERT INTO reservations VALUES (1010,7,301,'2024-04-25','2024-04-30',500);

INSERT INTO purchases VALUES (2001,1001,5,'2024-06-26','chips',3.5);
INSERT INTO purchases VALUES (2002,1002,8,'2024-02-26','champagne',80);
INSERT INTO purchases VALUES (2003,1003,9,'2024-03-19','peanuts',3);
INSERT INTO purchases VALUES (2004,1004,4,'2023-07-27','cake',5);
INSERT INTO purchases VALUES (2005,1002,8,'2024-02-26','strawberries',5);
INSERT INTO purchases VALUES (2006,1001,5,'2024-06-28','chips',3);
INSERT INTO purchases VALUES (2007,1009,10,'2023-12-26','champagne',80);
INSERT INTO purchases VALUES (2008,1006,2,'2023-09-26','wine',20);
INSERT INTO purchases VALUES (2009,1008,3,'2023-12-25','chicken nuggets',15);
INSERT INTO purchases VALUES (2010,1005,1,'2023-08-11','wine',20);

CREATE VIEW Available_rooms AS
SELECT roomid,roomview,price_pernight
FROM rooms
WHERE roomid NOT IN (SELECT roomid FROM reservations WHERE checkindate <= current_date AND checkoutdate >= current_date);

CREATE VIEW Todays_reservations AS
SELECT r.reservationid, c.firstname, c.lastname, c.id, c.email
FROM customers c LEFT JOIN reservations r ON r.customerid=c.customerid
WHERE r.checkindate <= current_date AND r.checkoutdate >= current_date;

CREATE TABLE additional_expenses (
	expenseid INTEGER AUTO_INCREMENT NOT NULL,
    customerid INTEGER NOT NULL, 
    reservationid INTEGER NOT NULL,
    expense_date DATE DEFAULT (CURRENT_DATE),
    amount DECIMAL(10,2),
    expense_type VARCHAR(255),
	CONSTRAINT pk_additional_expenses PRIMARY KEY (expenseid),
    FOREIGN KEY (customerid) REFERENCES customers(customerid),
    FOREIGN KEY (reservationid) REFERENCES reservations(reservationid)
)ENGINE=InnoDB  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

INSERT INTO additional_expenses(reservationid, customerid, expense_date, amount, expense_type) VALUES (1001,5,'2024-06-26',3.50,'chips');
INSERT INTO additional_expenses(reservationid, customerid, expense_date, amount, expense_type) VALUES (1002,8,'2024-02-26',80.00,'champagne');
INSERT INTO additional_expenses(reservationid, customerid, expense_date, amount, expense_type) VALUES (1003,9,'2024-03-19',3.00,'peanuts');
INSERT INTO additional_expenses(reservationid, customerid, expense_date, amount, expense_type) VALUES (1004,4,'2023-07-27',5.00,'cake');
INSERT INTO additional_expenses(reservationid, customerid, expense_date, amount, expense_type) VALUES (1002,8,'2024-02-26',10.00,'strawberries');
INSERT INTO additional_expenses(reservationid, customerid, expense_date, amount, expense_type) VALUES (1001,5,'2024-06-28',6.00,'chips');
INSERT INTO additional_expenses(reservationid, customerid, expense_date, amount, expense_type) VALUES (1009,10,'2023-12-26',80.00,'champagne');
INSERT INTO additional_expenses(reservationid, customerid, expense_date, amount, expense_type) VALUES (1006,2,'2023-09-26',20.00,'wine');
INSERT INTO additional_expenses(reservationid, customerid, expense_date, amount, expense_type) VALUES (1008,3,'2023-12-25',30.00,'chicken nuggets');
INSERT INTO additional_expenses(reservationid, customerid, expense_date, amount, expense_type) VALUES (1005,1,'2023-08-11',15.00,'wine');

CREATE VIEW Additional_expenses_view AS
SELECT r.reservationid, a.expense_type, a.amount, a.expense_date
FROM reservations r LEFT JOIN additional_expenses a ON r.reservationid = a.reservationid;

DELIMITER $$
CREATE TRIGGER CheckForDiscount BEFORE INSERT ON reservations
FOR EACH ROW
BEGIN
    DECLARE totalDaysLastYear INT;
    DECLARE daysStaying INT;
    DECLARE roomPrice DECIMAL(10,2);
    DECLARE startDate DATE;
    DECLARE endDate DATE;

    SET startDate = DATE_SUB(NEW.checkindate, INTERVAL 1 YEAR);
    SET endDate = NEW.checkindate;

    # Υπολογισμός συνολικού αριθμού ημερών διαμονής του πελάτη το τελευταίο έτος
    SELECT SUM(DATEDIFF(LEAST(checkoutdate, endDate), GREATEST(checkindate, startDate))) INTO totalDaysLastYear
    FROM reservations
    WHERE customerID = NEW.customerID
      AND checkindate < endDate AND checkoutdate > startDate;

    # Υπολογισμός αριθμού ημερών διαμονής για τη νέα κράτηση
    SET daysStaying = DATEDIFF(NEW.checkoutdate, NEW.checkindate);

    # Ανάκτηση τιμής δωματίου
    SELECT price INTO roomPrice FROM rooms WHERE roomid = NEW.roomid;

    # Ελέγχος αν ο πελάτης έχει διαμείνει τουλάχιστον 10 ημέρες το προηγούμενο έτος
    IF totalDaysLastYear >= 10 THEN
        # Εφαρμόζουμε 10% έκπτωση στην τιμή του δωματίου για τη νέα κράτηση και πολλαπλασιάζουμε με το διάστημα διαμονής
        SET NEW.finalprice = roomPrice * 0.9 * daysStaying;
    ELSE
        # Κανονική τιμή χωρίς έκπτωση, πολλαπλασιασμένη με το διάστημα διαμονής
        SET NEW.finalprice = roomPrice * daysStaying;
    END IF;
END$$
DELIMITER ;

CREATE TABLE stats
(
	sdate DATE NOT NULL,
    dsum DOUBLE NOT NULL
)ENGINE=InnoDB  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

DROP EVENT IF EXISTS p_daily
DELIMITER |
CREATE EVENT p_daily
    ON SCHEDULE EVERY 1 DAY
      STARTS CURRENT_TIMESTAMP()
      ENDS CURRENT_TIMESTAMP() + INTERVAL 5 MINUTE
    DO
      BEGIN
        INSERT INTO stats(sdate, dsum)
          SELECT DATE(NOW() - INTERVAL 1 DAY) AS sdate, SUM(finalprice) AS dsum
            FROM reservations
            WHERE DATE(checkindate) = DATE(NOW() - INTERVAL 1 DAY);
      END |
DELIMITER ;

CREATE OR REPLACE VIEW customerbilldetails AS
SELECT r.customerid, c.firstname, c.lastname, c.id, c.street, c.snumber, c.city, c.country, c.email, r.roomid, 
    rooms.price_pernight AS room_price_per_night,
    DATEDIFF(r.checkoutdate, r.checkindate) AS nights_stayed,
    (rooms.price_pernight * DATEDIFF(r.checkoutdate, r.checkindate)) AS total_room_cost,
    COALESCE(p.total_purchases, 0) AS total_purchases,
    COALESCE(ae.total_additional_expenses, 0) AS total_additional_expenses,
    (rooms.price_pernight * DATEDIFF(r.checkoutdate, r.checkindate)) + COALESCE(p.total_purchases, 0) + COALESCE(ae.total_additional_expenses, 0) AS total_cost
FROM reservations r INNER JOIN rooms ON r.roomid = rooms.roomid
INNER JOIN customers c ON r.customerid = c.customerid
LEFT JOIN 
(SELECT reservationid, SUM(amount) AS total_purchases FROM purchases GROUP BY reservationid) p ON r.reservationid = p.reservationid
LEFT JOIN 
(SELECT reservationid, SUM(amount) AS total_additional_expenses FROM additional_expenses GROUP BY reservationid) ae ON r.reservationid = ae.reservationid
GROUP BY r.reservationid
ORDER BY r.customerid;