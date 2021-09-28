-- 1. Get all customers and their addresses.
SELECT * from "customers" AS "c"
JOIN "addresses" AS "a" ON "c"."id" = "a"."customer_id"

-- 2. Get all orders and their line items (orders, quantity and product).
SELECT * FROM "orders" AS "o"
JOIN "line_items" AS "l" ON "o"."id" = "l"."order_id"
JOIN "products" AS "p" ON "l"."product_id" = "p"."product_id"

-- 3. Which warehouses have cheetos?
SELECT "description", "warehouse" FROM "products" AS "p"
JOIN "warehouse_product" AS "wp" ON "wp"."product_id" = "p"."id"
JOIN "warehouse" AS "w" ON "wp"."warehouse_id" = "w"."id"
WHERE "description" = 'cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT "description", "warehouse" FROM "products" AS "p"
JOIN "warehouse_product" AS "wp" ON "wp"."product_id" = "p"."id"
JOIN "warehouse" AS "w" ON "wp"."warehouse_id" = "w"."id"
WHERE "description" = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "c"."id", "c"."first_name", count("o"."id") AS "order_count" FROM "customers" as "c"
JOIN "addresses" AS "a" ON "c"."id" = "a"."customer_id"
LEFT JOIN "orders" AS "o" ON "a"."id" = "o"."address_id"
GROUP BY "c"."id";

-- 6. How many customers do we have?
SELECT count(*) FROM "customers"

-- 7. How many products do we carry?
SELECT count(*) FROM "products"

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT "p"."id", "p"."description", sum("wp"."on_hand") FROM "products" AS "p"
JOIN "warehouse_product" AS "wp" ON "p"."id" = "wp"."product_id"
WHERE "p"."description" = 'diet pepsi'
GROUP BY "p"."id", "p"."description";

--------------------------------------------
