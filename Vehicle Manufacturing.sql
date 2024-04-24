select *
from vehicle;

select price from vehicle
group by price;
select Brand, Year, Price, Location from vehicle;

-- What is the average price of cars in the dataset?
SELECT Price,
avg(price)
from vehicle
GROUP BY price;
SELECT avg(price)
from vehicle;

-- How many unique brands are present in the dataset?
SELECT Brand, count(*) as
num_unique_brand
from vehicle
group by brand;

-- Which brand has the highest average price?
SELECT Brand, count(*) as
highest_avg_price
from vehicle
group by brand;

-- What is the distribution of car colors in the dataset?
SELECT color, COUNT(*)
FROM vehicle GROUP BY
color;

--  Can we identify any trends in the average mileage of cars over the years?
SELECT Year, count(*) as
num_avg_mileage
from vehicle
group by Year;

--  Which location has the highest number of cars for sale?
SELECT Location, count(*) as
num_highest_cars
from vehicle
group by Location;

-- Is there any correlation between the year of the car and its price?
SELECT 
    (
        (COUNT(price) * SUM(price * year) - SUM(price) * SUM(year)) 
        / 
        (SQRT((COUNT(price) * SUM(price * price) - POW(SUM(price), 2)) * (COUNT(year) * SUM(year * year) - POW(SUM(year), 2))))
    ) AS correlation_coefficient
FROM 
    vehicle;
    
	-- What is the most common model among the cars in the dataset?
   SELECT model, COUNT(*) AS num_highest_cars
FROM vehicle
GROUP BY model
ORDER BY num_highest_cars DESC;

-- How does the average price vary across different car models?
SELECT model, AVG(price) AS average_price
FROM vehicle
GROUP BY model;

-- What is the overall distribution of car prices?
SELECT
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    AVG(price) AS avg_price,
    (
        SELECT AVG(price) 
        FROM (
            SELECT price 
            FROM vehicle 
            ORDER BY price 
        ) AS median_price
    ) AS median_price,
    COUNT(*) AS total_cars
FROM
    vehicle;


-- What is the most popular car color in each location?
SELECT Color, Location, COUNT(*) AS num_highest_cars
FROM vehicle
GROUP BY Color, Location 
ORDER BY num_highest_cars DESC;

-- How does the average mileage differ between different car brands?
SELECT v1.brand AS brand1,
       v2.brand AS brand2,
       AVG(v1.mileage) - AVG(v2.mileage) AS mileage_difference
FROM vehicle v1
JOIN vehicle v2 ON v1.brand < v2.brand
GROUP BY v1.brand, v2.brand;

-- Is there any relationship between mileage and price for specific brands?
SELECT Brand, Price, Mileage
FROM vehicle
WHERE Price IN (SELECT Price FROM vehicle GROUP BY Price HAVING COUNT(*) > 1)
AND Mileage IN (SELECT Mileage FROM vehicle GROUP BY Mileage HAVING COUNT(*) > 1)
AND Brand IN ('Ford', 'Toyota', 'Honda', 'Chevrolet', 'Hyundai');

-- Can we identify any seasonal trends in car prices based on the model year?
SELECT model, year, Price
FROM vehicle
GROUP BY model, year, Price
ORDER BY model, year, Price;

-- What is the distribution of cars based on their model years?
SELECT Model, year, COUNT(*)
FROM vehicle GROUP BY
model, year;


-- Are there any geographical patterns in the distribution of car brands?
SELECT
    brand,
    COUNT(*) AS total_sales,
    Location
FROM
    vehicle
GROUP BY
    Brand, Location
ORDER BY
    brand, total_sales DESC;

-- Can we predict the price of a car based on its mileage and model year?
SELECT
    model, year,
    AVG(mileage) AS avg_mileage,
    AVG(price) AS avg_price
FROM
    vehicle
GROUP BY
    model, year;
SELECT
    1273.98702484 AS beta0,
    0.3863 AS beta1;

-- Predict the price for a car with mileage 150,000
SELECT
    1273.98702484 + (0.3863 * 150000) AS predicted_price;
    
    
   -- How has the average price of cars changed over the years?
   SELECT
    Year,
    AVG(price) AS average_price
FROM
    vehicle
GROUP BY
    year
ORDER BY
    year;
    
    
   -- What is the most expensive and least expensive car in the dataset?
   -- Most expensive car
SELECT Brand, Price
FROM vehicle
WHERE price = (SELECT MAX(price) FROM vehicle);

-- Least expensive car
SELECT Brand, Price
FROM vehicle
WHERE price = (SELECT MIN(price) FROM vehicle);



 














