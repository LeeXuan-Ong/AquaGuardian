create database Aquaguardian;

CREATE TABLE Sensors (
    sensor_id INT AUTO_INCREMENT PRIMARY KEY,
    sensor_name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    UNIQUE KEY unique_sensor (sensor_name)
);

CREATE TABLE SensorData (
    data_id INT AUTO_INCREMENT PRIMARY KEY,
    sensor_id INT,
    timestamp DATETIME NOT NULL,
    value FLOAT NOT NULL,
    FOREIGN KEY (sensor_id) REFERENCES Sensors(sensor_id)
);


CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'user') NOT NULL
);

CREATE TABLE Register(
    register_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Login(
    login_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


CREATE TABLE Notifications(
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    sensor_id INT NOT NULL,
    VARCHAR(255) NOT NULL
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (sensor_id) REFERENCES Sensors(sensor_id)
);

CREATE TABLE SensorThresholds(
    threshold_id INT AUTO_INCREMENT PRIMARY KEY,
    sensor_id INT NOT NULL,
    min_value FLOAT NOT NULL,
    max_value FLOAT NOT NULL,
    FOREIGN KEY (sensor_id) REFERENCES Sensors(sensor_id)
);




-- CREATE TABLE SensorDataHistory(
--     data_id INT AUTO_INCREMENT PRIMARY KEY,
--     sensor_id INT,
--     timestamp DATETIME NOT NULL,
--     value FLOAT NOT NULL,
--     FOREIGN KEY (sensor_id) REFERENCES Sensors(sensor_id)
-- );



-- Sample data for the "Sensors" table
INSERT INTO Sensors (sensor_id, sensor_name, location)
VALUES
    (1,'Temperature Sensor', 'Bathroom Shower'),
    (2,'TDS Sensor', 'Bathroom Sink'),
    (3,'Turbidity Sensor', 'Kitchen Sink'),
    (4,'GPS Module', 'Outdoor Garden');


-- Sample data for the "SensorData" table with data_id
INSERT INTO SensorData (data_id, sensor_id, timestamp, value)
VALUES
    (1, 1, '2023-10-26 08:00:00', 25.5),
    (2, 2, '2023-10-26 09:30:00', 60.2),
    (3, 3, '2023-10-26 11:15:00', 1005.3),
    (4, 4, '2023-10-26 12:45:00', 800),
    (5, 1, '2023-10-26 14:00:00', 26.0),
    (6, 2, '2023-10-26 15:30:00', 59.8),
    (7, 3, '2023-10-26 17:15:00', 1004.9),
    (8, 4, '2023-10-26 18:45:00', 810);

INSERT INTO Users (user_id, name, username, email, password, role) VALUES
    (1, 'John Murphy', 'john_m', 'john01@gmail.com', 'password123', 'admin'),
    (2, 'Jane Burns', 'jane_b', 'jane02@yahoo.com', 'userpass456', 'user'),
    (3, 'Alice Johnson', 'alice_j', 'alice03@yahoo.com', 'securePwd789', 'user'),
    (4, 'Matthew Brady', 'matthew_b', 'matthew04@gmail.com', 'topSecret101', 'admin');

