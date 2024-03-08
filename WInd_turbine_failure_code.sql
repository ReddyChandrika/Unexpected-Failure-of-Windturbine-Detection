-- creating a new database
create database windturbine;

-- using the database
use windturbine;

-- checking out the table
select * from windturbine;

-- checking no of coloumns in the dataset
SELECT COUNT(*) AS NumberOfColumns FROM information_schema.columns WHERE table_name = 'windturbine';

-- checking no of rows in total in the dataset    
select count(*) as NumberOfRows from windturbine;

-- bearing temperature coloumn name is different so need to change it 
-- ALTER TABLE windturbine CHANGE COLUMN `Bearing_temperature)` Bearing_temperature datatype;


-- check for missing values
SELECT * FROM windturbine WHERE Wind_speed IS NULL OR TRIM(Wind_speed) = '';

SELECT * FROM windturbine WHERE Power IS NULL OR TRIM(Power) = '';

SELECT * FROM windturbine WHERE Nacelle_ambient_temperature IS NULL OR TRIM(Nacelle_ambient_temperature) = '';

SELECT * FROM windturbine WHERE Generator_speed  IS NULL OR TRIM(Generator_speed ) = '';
    
SELECT * FROM windturbine WHERE Yaw_angle IS NULL OR TRIM(Yaw_angle) = '';

SELECT * FROM windturbine WHERE Gear_box_inlet_temperature IS NULL OR TRIM(Gear_box_inlet_temperature) = '';

-- Replace NULL or empty values in Wind_speed with the minimum/inimum value of Wind_speed
UPDATE windturbine SET Wind_speed = (SELECT MIN(Wind_speed) FROM windturbine WHERE Wind_speed IS NOT NULL AND TRIM(Wind_speed) != '') WHERE Wind_speed IS NULL OR TRIM(Wind_speed) = '';

-- Replace NULL or empty values in Power with the maximum/minimum value of Power
UPDATE windturbine SET Power = (SELECT MAX(Power) FROM windturbine WHERE Power IS NOT NULL AND TRIM(Power) != '') WHERE Power IS NULL OR TRIM(Power) = '';

-- Replace NULL or empty values in Nacelle_ambient_temperature with the maximum/minimum value of Nacelle_ambient_temperature 
UPDATE windturbine SET Nacelle_ambient_temperature = (SELECT MAX(Nacelle_ambient_temperature) FROM windturbine WHERE Power IS NOT NULL AND TRIM(Nacelle_ambient_temperature) != '') WHERE Power IS NULL OR TRIM(Nacelle_ambient_temperature) = '';

-- Replace NULL or empty values in Generator_speed with the maximum/minimum value of Generator_speed
UPDATE windturbine SET Generator_speed = (SELECT MAX(Generator_speed) FROM windturbine WHERE Power IS NOT NULL AND TRIM(Generator_speed) != '') WHERE Power IS NULL OR TRIM(Generator_speed) = '';

-- Replace NULL or empty values in Yaw_angle with the maximum/minimum value of Yaw_angle
UPDATE windturbine SET Yaw_angle = (SELECT MAX(Yaw_angle) FROM windturbine WHERE Power IS NOT NULL AND TRIM(Yaw_angle) != '') WHERE Yaw_angle IS NULL OR TRIM(Yaw_angle) = '';

-- Replace NULL or empty values in Gear_box_inlet_temperature with the maximum value of Gear_box_inlet_temperature
UPDATE windturbine SET Gear_box_inlet_temperature = (SELECT MAX(Gear_box_inlet_temperature) FROM windturbine WHERE Gear_box_inlet_temperature IS NOT NULL AND TRIM(Gear_box_inlet_temperature) != '') WHERE Gear_box_inlet_temperature IS NULL OR TRIM(Gear_box_inlet_temperature) = '';

##  Explore Data Distribution
SELECT Wind_speed, COUNT(*) FROM windturbine GROUP BY Wind_speed;
SELECT Power, COUNT(*) FROM windturbine GROUP BY Power;
SELECT Nacelle_ambient_temperature, COUNT(*) FROM windturbine GROUP BY Nacelle_ambient_temperature;
SELECT Generator_bearing_temperature, COUNT(*) FROM windturbine GROUP BY Generator_bearing_temperature;
SELECT Gear_oil_temperature, COUNT(*) FROM windturbine GROUP BY Gear_oil_temperature;
SELECT Ambient_temperature , COUNT(*) FROM windturbine GROUP BY Ambient_temperature ;
SELECT Rotor_Speed, COUNT(*) FROM windturbine GROUP BY Rotor_Speed;
SELECT Nacelle_temperature, COUNT(*) FROM windturbine GROUP BY Nacelle_temperature;
SELECT Bearing_Temperature, COUNT(*) FROM windturbine GROUP BY Bearing_Temperature;
SELECT Generator_Speed, COUNT(*) FROM windturbine GROUP BY Generator_Speed;
SELECT Yaw_angle, COUNT(*) FROM windturbine GROUP BY Yaw_angle;
SELECT Wind_direction, COUNT(*) FROM windturbine GROUP BY Wind_direction;
SELECT Wheel_hub_Temperature , COUNT(*) FROM windturbine GROUP BY Wheel_hub_Temperature ;
SELECT Gear_box_inlet_temperature, COUNT(*) FROM windturbine GROUP BY Gear_box_inlet_temperature;

##  Calculating mean
SELECT AVG(Wind_speed), MIN(Wind_speed), MAX(Wind_speed) FROM windturbine;
SELECT AVG(Power), MIN(Power), MAX(Power) FROM windturbine;
SELECT AVG(Nacelle_ambient_temperature), MIN(Nacelle_ambient_temperature), MAX(Nacelle_ambient_temperature) FROM windturbine;
SELECT AVG(Generator_bearing_temperature), MIN(Generator_bearing_temperature), MAX(Generator_bearing_temperature) FROM windturbine;
SELECT AVG(Gear_oil_temperature), MIN(Gear_oil_temperature), MAX(Gear_oil_temperature) FROM windturbine;
SELECT AVG(Ambient_temperature), MIN(Ambient_temperature), MAX(Ambient_temperature) FROM windturbine;
SELECT AVG(Rotor_Speed), MIN(Rotor_Speed), MAX(Rotor_Speed) FROM windturbine;
SELECT AVG(Nacelle_temperature), MIN(Nacelle_temperature), MAX(Nacelle_temperature) FROM windturbine;
SELECT AVG(Bearing_Temperature), MIN(Bearing_Temperature), MAX(Bearing_Temperature) FROM windturbine;
SELECT AVG(Generator_Speed), MIN(Generator_Speed), MAX(Generator_Speed) FROM windturbine;
SELECT AVG(Yaw_angle), MIN(Yaw_angle), MAX(Yaw_angle) FROM windturbine;
SELECT AVG(Wind_direction), MIN(Wind_direction), MAX(Wind_direction) FROM windturbine;
SELECT AVG(Wheel_hub_Temperature ), MIN(Wheel_hub_Temperature ), MAX(Wheel_hub_Temperature ) FROM windturbine;
SELECT AVG(Gear_box_inlet_temperature), MIN(Gear_box_inlet_temperature), MAX(Gear_box_inlet_temperature) FROM windturbine;

-- calculating Standard deviation
SELECT STDDEV(Wind_speed) AS Wind_speed_Standard_Deviation FROM windturbine;
SELECT STDDEV(Power) AS Power_Standard_Deviation FROM windturbine;
SELECT STDDEV(Nacelle_ambient_temperature) AS Nacalle_ambient_temperature_Standard_Deviation FROM windturbine;
SELECT STDDEV(Generator_bearing_temperature) AS Generator_bearing_temperature_Standard_Deviation FROM windturbine;
SELECT STDDEV(Gear_oil_temperature) AS Gear_oil_temperature_Standard_Deviation FROM windturbine;
SELECT STDDEV(Ambient_temperature) AS Ambient_temperature_Standard_Deviation FROM windturbine;
SELECT STDDEV(Rotor_speed) AS Rotor_speed_Standard_Deviation FROM windturbine;
SELECT STDDEV(Nacelle_temperature) AS Nacalle_temperature_Standard_Deviation FROM windturbine;
SELECT STDDEV(Generator_speed) AS Generator_speed_Standard_Deviation FROM windturbine;
SELECT STDDEV(Yaw_angle) AS Yaw_angle_Standard_Deviation FROM windturbine;
SELECT STDDEV(Wind_direction) AS Wind_direction_Standard_Deviation FROM windturbine;
SELECT STDDEV(Wheel_hub_temperature) AS Wheel_hub_temperature_Standard_Deviation FROM windturbine;
SELECT STDDEV(Gear_box_inlet_temperature) AS Gear_box_inlet_temperature_Standard_Deviation FROM windturbine;

-- missing values updation
-- Update missing values with the minimum or maximum value of Power
-- UPDATE windturbine SET Power = CASE WHEN Power IS NULL THEN (SELECT MIN(Power) FROM windturbine) ELSE Power END WHERE Power IS NULL;

-- outlier detection and removing them
-- Detect and replace outliers with minimum and maximum values
-- Calculate the lower and upper bounds for outliers detection
SELECT @LowerBound := MIN(Power), @UpperBound := MAX(Power) FROM windturbine;

-- Detect and replace outliers with minimum and maximum values
UPDATE windturbine SET Power = CASE WHEN Power < @LowerBound THEN @LowerBound WHEN Power > @UpperBound THEN @UpperBound ELSE Power END;
UPDATE windturbine SET Wind_speed = CASE WHEN Power < @LowerBound THEN @LowerBound WHEN Wind_speed > @UpperBound THEN @UpperBound ELSE Wind_speed END;
UPDATE windturbine SET Nacalle_ambient_temperature = CASE WHEN Nacalle_ambient_temperature < @LowerBound THEN @LowerBound WHEN Nacalle_ambient_temperature > @UpperBound THEN @UpperBound ELSE Nacalle_ambient_temperature END;
UPDATE windturbine SET Generator_bearing_temperature = CASE WHEN Generator_bearing_temperature < @LowerBound THEN @LowerBound WHEN Generating_bearing_temperature > @UpperBound THEN @UpperBound ELSE Generator_bearing_temperature END;
UPDATE windturbine SET Gear_oil_temperature = CASE WHEN Gear_oil_temperature < @LowerBound THEN @LowerBound WHEN Gear_oil_temperature > @UpperBound THEN @UpperBound ELSE Gear_oil_temperature END;
UPDATE windturbine SET Ambient_temperature = CASE  WHEN Ambient_temperature < @LowerBound THEN @LowerBound WHEN Ambient_temperature > @UpperBound THEN @UpperBound ELSE Ambient_temperature END;
UPDATE windturbine SET Nacalle_temperature = CASE WHEN Nacalle_temperature < @LowerBound THEN @LowerBound WHEN Nacalle_temperature > @UpperBound THEN @UpperBound ELSE Nacalle_temperature END;
-- UPDATE windturbine SET Bearing_temperature) = CASE WHEN Power < @LowerBound THEN @LowerBound WHEN Bearing_temperature) > @UpperBound THEN @UpperBound ELSE Bearing_temperature) END;
UPDATE windturbine SET Generator_speed = CASE WHEN Generator_speed < @LowerBound THEN @LowerBound WHEN generator_speed > @UpperBound THEN @UpperBound ELSE Generator_speed END;
UPDATE windturbine SET Yaw_angle = CASE WHEN Yaw_angle < @LowerBound THEN @LowerBound WHEN Yaw_angle > @UpperBound THEN @UpperBound ELSE Yaw_angle END;
UPDATE windturbine SET Wind_direction = CASE WHEN Wind_direction < @LowerBound THEN @LowerBound WHEN Wind_direction > @UpperBound THEN @UpperBound ELSE Wind_direction END;
UPDATE windturbine SET Wheel_hub_temperature = CASE WHEN Wheel_hub_temperature < @LowerBound THEN @LowerBound WHEN Wheel_hub_temperature > @UpperBound THEN @UpperBound ELSE Wheel_hub_temperature END;
UPDATE windturbine SET Gear_box_inlet_temperature = CASE WHEN Gear_box_inlet_temperature < @LowerBound THEN @LowerBound WHEN Gear_box_inlet_temperature > @UpperBound THEN @UpperBound ELSE Gear_box_inlet_temperature END;

-- checking whether missing values got replaced or not
SELECT
    'Wind_speed' AS Column_Name,
    COUNT(*) AS Missing_Values_Count
FROM
    windturbine
WHERE
    Wind_speed IS NULL
UNION ALL
SELECT
    'Power' AS Column_Name,
    COUNT(*) AS Missing_Values_Count
FROM
    windturbine
WHERE
    Power IS NULL
-- Repeat similar queries for other columns
-- (Nacelle_ambient_temperature, Generator_speed, Yaw_angle, Gear_box_inlet_temperature)

-- IQR method
SELECT 'Wind_speed' AS Column_Name,
    (SELECT COUNT(*) FROM windturbine) AS Total_Count,
    Q1.Wind_speed AS Q1,
    Q3.Wind_speed AS Q3,
    (Q3.Wind_speed - Q1.Wind_speed) AS IQR,
    (Q1.Wind_speed - 1.5 * (Q3.Wind_speed - Q1.Wind_speed)) AS Lower_Bound,
    (Q3.Wind_speed + 1.5 * (Q3.Wind_speed - Q1.Wind_speed)) AS Upper_Bound,
    (SELECT COUNT(*) FROM windturbine WHERE Wind_speed < Q1.Wind_speed - 1.5 * (Q3.Wind_speed - Q1.Wind_speed) OR Wind_speed > Q3.Wind_speed + 1.5 * (Q3.Wind_speed - Q1.Wind_speed)) AS Outliers_Count
FROM 
    (SELECT Wind_speed FROM windturbine ORDER BY Wind_speed LIMIT 1 OFFSET FLOOR((SELECT COUNT(*) FROM windturbine) * 0.25)) AS Q1,
    (SELECT Wind_speed FROM windturbine ORDER BY Wind_speed LIMIT 1 OFFSET FLOOR((SELECT COUNT(*) FROM windturbine) * 0.75)) AS Q3;


-- skewness calculation
SELECT
    'Power' AS COL,
    MIN(Power) AS MIN,
    MAX(Power) AS MAX,
    AVG(Power) AS AVG,
    (SELECT Power FROM windturbine GROUP BY Power ORDER BY COUNT(*) DESC LIMIT 1) AS MODE,
    STDDEV(Power) AS STD_DEV,
    (COUNT(Power) / ((COUNT(Power) - 1) * (COUNT(Power) - 2))) *
        SUM(POW(Power - (SELECT AVG(Power) FROM windturbine), 3)) /
        POW(STDDEV(Power), 3) AS Skewness
FROM
    windturbine;

-- Kurtosis Calculation
SELECT 
    'Power' AS COL,
    (SUM(POW(Power - (SELECT AVG(Power) FROM windturbine), 4)) / COUNT(Power)) / POW(STDDEV(Power), 4) - ((3 * POW((COUNT(Power) - 1), 2)) / ((COUNT(Power) - 2) * (COUNT(Power) - 3))) AS Kurtosis FROM windturbine;
