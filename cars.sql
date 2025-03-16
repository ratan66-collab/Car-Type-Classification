#Car Type Classification Project:  
#This project is a practice on data involves categorizing cars into different types (SUV, Convertible, Coupe, Sedan, Hatchback)  
#to classify them based on their features.  
#SQL is used for managing metadata, storing image file paths, and tracking model predictions.  
CREATE DATABASE CarDB;
USE CarDB;

-- Cars Table
CREATE TABLE Cars (
    car_id INT PRIMARY KEY AUTO_INCREMENT,
    model_name VARCHAR(100) NOT NULL,
    brand VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Car Performance Table
CREATE TABLE CarPerformance (
    car_id INT PRIMARY KEY,
    top_speed INT NOT NULL,
    acceleration DECIMAL(4,2) NOT NULL, -- 0-100 km/h time
    fuel_efficiency DECIMAL(4,1), -- km/l or kWh/100km
    safety_rating DECIMAL(2,1) NOT NULL,
    FOREIGN KEY (car_id) REFERENCES Cars(car_id) ON DELETE CASCADE
);

-- Fuel Efficiency Table
CREATE TABLE FuelEfficiency (
    car_id INT PRIMARY KEY,
    city_mileage DECIMAL(4,1) NOT NULL,
    highway_mileage DECIMAL(4,1) NOT NULL,
    avg_mileage DECIMAL(4,1) NOT NULL,
    FOREIGN KEY (car_id) REFERENCES Cars(car_id) ON DELETE CASCADE
);

-- Maintenance Table
CREATE TABLE Maintenance (
    car_id INT PRIMARY KEY,
    avg_annual_cost INT NOT NULL,
    maintenance_type ENUM('Low', 'Medium', 'High') NOT NULL,
    FOREIGN KEY (car_id) REFERENCES Cars(car_id) ON DELETE CASCADE
);

-- Reviews Table
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    car_id INT NOT NULL,
    user_name VARCHAR(100) NOT NULL,
    rating DECIMAL(2,1) NOT NULL,
    review_text TEXT,
    FOREIGN KEY (car_id) REFERENCES Cars(car_id) ON DELETE CASCADE
);

INSERT INTO Cars (car_id, model_name, brand, year, price) VALUES
(1, 'Model S', 'Tesla', 2022, 80000),
(2, 'Mustang GT', 'Ford', 2021, 55000),
(3, 'C-Class', 'Mercedes', 2023, 60000),
(4, '911 Turbo', 'Porsche', 2022, 150000);

-- Inserting data into CarPerformance table
INSERT INTO CarPerformance (car_id, top_speed, acceleration, fuel_efficiency, safety_rating) VALUES
(1, 220, 7.5, 15.2, 4.8),
(2, 250, 4.5, 9.0, 4.7),
(3, 230, 5.2, 12.0, 4.9),
(4, 320, 2.1, NULL, 5.0);

-- Inserting data into FuelEfficiency table
INSERT INTO FuelEfficiency (car_id, city_mileage, highway_mileage, avg_mileage) VALUES
(1, 6.5, 7.2, 6.8),  -- Tesla (kWh/100km)
(2, 10, 12, 11),  -- Mustang GT (km/l)
(3, 9, 11, 10), 
(4, 7, 9, 8);

-- Inserting data into Maintenance table
INSERT INTO Maintenance (car_id, avg_annual_cost, maintenance_type) VALUES
(1, 5000, 'Low'),
(2, 15000, 'High'),
(3, 12000, 'Medium'),
(4, 20000, 'High');

-- Inserting data into Reviews table
INSERT INTO Reviews (car_id, user_name, rating, review_text) VALUES
(1, 'Aman Singh', 4.8, 'Amazing electric car with insane acceleration.'),
(2, 'Simran Kaur', 4.5, 'Classic muscle car feel, but fuel efficiency could be better.'),
(3, 'Rohan Sharma', 4.7, 'A perfect blend of power and luxury.'),
(4, 'Priya Verma', 4.9, 'Supercar performance with premium comfort.');


SELECT model_name, acceleration 
FROM CarPerformance 
JOIN Cars ON CarPerformance.car_id = Cars.car_id 
ORDER BY acceleration ASC 
LIMIT 1;

SELECT model_name, safety_rating 
FROM CarPerformance 
JOIN Cars ON CarPerformance.car_id = Cars.car_id 
ORDER BY safety_rating DESC;



