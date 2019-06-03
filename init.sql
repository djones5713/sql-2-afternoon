SELECT * 
FROM invoice i 
JOIN invoice_line il ON il.invoice_id = i.invoice_id
WHERE il.unit_price > 0.99;

SELECT i.invoice_date, c.first_name, c.last_name, i.total
FROM invoice i 
JOIN customer c ON i.customer_id = c.customer_id;

SELECT c.first_name, c.last_name, s.first_name, s.last_name
FROM customer c 
JOIN employee e ON c.support_rep_id = e.employee_id;

SELECT al.title, ar.name
FROM album al
JOIN artist ar ON al.artist_id = ar.artist_id;

SELECT pt.track_id 
FROM playlist_track pt 
JOIN playlist p ON p.playlist_id = pt.playlist_id
WHERE p.name = 'Music';

SELECT t.name
FROM track t
JOIN playlist_track pt ON t.track_id = t.track_id 
WHERE pt.playlist_id = 5;


SELECT t.name, p.name
FROM track t
JOIN playlist_track pt ON t.track_id = pt.track_id 
JOIN playlist p ON pt.playlist_id = p.playlist_id;

SELECT t.name, a.title
FROM track t
JOIN album a ON t.album_id = a.album_id
JOIN genre g ON g.genre_id = t.genre_id
WHERE g.name = Alternative & Punk




SELECT * 
FROM invoice
JOIN invoice_id IN ( SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99);

SELECT *
FROM playlist_track
JOIN playlist_id IN (SELECT playlist_id FROM playlist WHERE name = 'Music');

SELECT * 
FROM name
JOIN track_id IN (SELECT track_id FROM playlist_track WHERE playlist_id = 5);


SELECT * 
FROM track
JOIN genre_id IN (SELECT genre_id FROM genre  WHERE name = 'Comedy');

SELECT * 
FROM track
JOIN album_id IN (SELECT album_id FROM ablum WHERE title = 'Fireball');

SELECT * 
FROM track
JOIN album_id  IN (
    SELECT album_id  FROM ablum WHERE artist_id IN (
        SELECT artist_id FROM artist WHERE name = 'Queen'
    ));




UPDATE customer
SET fax = null
WHERE fax IS NOT NULL; 

UPDATE customer
SET company = 'Self'
WHERE company IS NULL; 

UPDATE customer 
SET last_name = 'Thompson'
WHERE first_name = 'Julia' AND last_name 'Barnett';

UPDATE customer 
SET support_rep_id = 4
WHERE email = luisrojas@yahoo.cl;

UPDATE track
SET composer = "The darkness around us"
WHERE genre_id = (SELECT genre_id FROM genre WHERE name = 'Metal' )
AND WHERE composer IS NULL;



SELECT COUNT(*), g.name 
FROM track t
JOIN genre g ON t.genre_id = g.genre_id
GROUP BY g.name;

SELECT COUNT(*), g.name
FROM track t
JOIN genre g ON g.genre_id = t.genre_id
WHERE g.name = 'Pop' OR g.name = 'Rock'
GROUP BY g.name;

SELECT ar.name, COUNT(*)
FROM album al
JOIN artist ar ON ar.artist_id = al.artist_id
GROUP BY ar.name;



SELECT DISTINCT composer
FROM track

SELECT DISTINCT billing_postal_code
FROM invoice

SELECT DISTINCT company
FROM customer


CREATE TABLE practice_delete ( name TEXT, type TEXT, value INTEGER );
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'silver', 100);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'silver', 100);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);

SELECT * FROM practice_delete;

DELETE FROM practice_delete
WHERE type = 'bronze';

DELETE FROM practice_delete
WHERE type = 'silver';

DELETE FROM practice_delete
WHERE value =  150;


CREATE TABLE users (
    user_id serial primary key,
    name text NOT NULL,
    email varchar(30) NOT NULL,
    orders_id references orders(order_id)
)
-- PARENT
CREATE TABLE products (
    product_id serial primary key,
    name text NOT NULL ,
    price integer NOT NULL, 
)

-- CHILD
CREATE TABLE orders (
    order_id serial primary key,
    product_id references products(product_id),
    quantity integer NOT NULL
)

INSERT INTO users (name, email) values ('Jane Doe', jane@gmail.com), ('Maddison Walt', maddie@aol.com), ('Jacob Lee', jacob@gmail.com);
INSERT INTO products (name, price) values ('macbook', 1050), ('Windows PC', 800), ('Ipad', 1000);
INSERT INTO orders (order_id, product_id, quantity) values (1, SELECT product_id FROM products WHERE name='macbook', 2), (2, SELECT product_id FROM products WHERE name='Windows PC', 8 ), (3, )(2, SELECT product_id FROM products WHERE name='Ipad', 5);


SELECT * FROM orders;

SELECT SUM( quantity)
FROM orders 
WHERE id = 1;

ALTER TABLE orders add column user_id references users(user_id);

SELECT * FROM orders WHERE user_id = 2;


SELECT SUM(orders)
FROM users
WHERE id = 3;
