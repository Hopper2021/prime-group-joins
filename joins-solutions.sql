-- 1. Get all customers and their addresses.
SELECT * from "customers" AS "c"
JOIN "addresses" AS "a" ON "c"."id" = "a"."customer_id"

-- 2. Get all orders and their line items (orders, quantity and product).


-- 3. Which warehouses have cheetos?


-- 4. Which warehouses have diet pepsi?


-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.


-- 6. How many customers do we have?


-- 7. How many products do we carry?


-- 8. What is the total available on-hand quantity of diet pepsi?


--------------------------------------------
CREATE TABLE "person" (
	"id" SERIAL PRIMARY KEY,
	"first_name" VARCHAR(25)
);

INSERT INTO "person" ("first_name")
VALUES ('Chris'), ('Jess'), ('Ahmed'), ('Danny'), ('Ian'), ('Anwar'), ('Greg'), ('Phaydara');

CREATE TABLE "hobby" (
	"id" SERIAL PRIMARY KEY,
	"description" VARCHAR(100)
);

INSERT INTO "hobby" ("description")
VALUES ('Rock Climbing'), ('Soccer'),('Sewing'), ('Music');

CREATE TABLE "person_hobby" (
	"id" SERIAL PRIMARY KEY, -- optional on juntion tables
	"person_id" INT REFERENCES "person", -- FK (Foreign Key)
	"hobby_id" INT REFERENCES "hobby", -- FK
	"skill" INT
);

INSERT INTO "person_hobby" ("person_id", "hobby_id", "skill")
VALUES (1, 1, 3), (1, 2, 1), (2, 3, 5), (2, 2, 1), (3, 2, 5), (4, 4, 1), (1, 1, 2), (3, 2, 1);

-- as is an Alias (e.g. "p"."first_name")
SELECT * FROM "person" as "p"
JOIN "person_hobby" as "ph" ON "p"."id" = "ph"."person_id"
JOIN "hobby" as "h" ON "h"."id" = "ph"."hobby_id";

SELECT "p"."first_name", "h"."description", "ph"."skill" 
FROM "person" as "p"
JOIN "person_hobby" as "ph" ON "p"."id" = "ph"."person_id"
JOIN "hobby" as "h" ON "h"."id" = "ph"."hobby_id";

SELECT "h"."description", avg("ph"."skill")
FROM "person" as "p"
JOIN "person_hobby" as "ph" ON "p"."id" = "ph"."person_id"
JOIN "hobby" as "h" ON "h"."id" = "ph"."hobby_id"
GROUP BY "h"."description";

SELECT "h"."description", avg("ph"."skill"), count("p"."id")
FROM "person" as "p"
JOIN "person_hobby" as "ph" ON "p"."id" = "ph"."person_id"
JOIN "hobby" as "h" ON "h"."id" = "ph"."hobby_id"
GROUP BY "h"."description";