create database hayadb;
use hayadb;

-- Table 1: Servers 
CREATE TABLE Servers ( 
    server_id INT PRIMARY KEY, 
    server_name VARCHAR(50), 
    region VARCHAR(50) 
); 
INSERT INTO Servers VALUES 
(1, 'web-server-01', 'us-east'), 
(2, 'db-server-01', 'us-east'), 
(3, 'api-server-01', 'eu-west'), 
(4, 'cache-server-01', 'us-west'); 
-- Table 2: Alerts 
CREATE TABLE Alerts ( 
    alert_id INT PRIMARY KEY, 
    server_id INT, 
    alert_type VARCHAR(50), 
    severity VARCHAR(20) 
); 
INSERT INTO Alerts VALUES 
(101, 1, 'CPU Spike', 'High'), 
(102, 2, 'Disk Failure', 'Critical'), 
(103, 2, 'Memory Leak', 'Medium'), 
(104, 5, 'Network Latency', 'Low'); -- Invalid server_id (edge case) 
-- Table 3: AI Models 
CREATE TABLE AI_Models ( 
    model_id INT PRIMARY KEY, 
    model_name VARCHAR(50), 
    use_case VARCHAR(50) 
); 
INSERT INTO AI_Models VALUES 
(201, 'AnomalyDetector-v2', 'Alert Prediction'), 
(202, 'ResourceForecaster', 'Capacity Planning'), 
(203, 'LogParser-NLP', 'Log Analysis'); 

-- Table 4: ModelDeployments 
CREATE TABLE ModelDeployments ( 
    deployment_id INT PRIMARY KEY, 
    server_id INT, 
    model_id INT, 
    deployed_on DATE 
); 
 
INSERT INTO ModelDeployments VALUES 
(301, 1, 201, '2025-06-01'), 
(302, 2, 201, '2025-06-03'), 
(303, 2, 202, '2025-06-10'), 
(304, 3, 203, '2025-06-12'); 
---------------------------------------------------------------
--show the tables 
select * from ModelDeployments;
select * from AI_Models;
select * from Alerts;
select * from Servers;
------------------------------------------------------------------
--Task 1: INNER JOIN 
--List all alerts with the corresponding server name. 

SELECT Alerts.alert_id, Alerts.alert_type, Alerts.severity, Servers.server_name
FROM Alerts
INNER JOIN Servers ON Alerts.server_id = Servers.server_id;

--Task 2: LEFT JOIN 
--List all servers and any alerts they might have received. 

SELECT Servers.server_id, Servers.server_name, Alerts.alert_type, Alerts.severity
FROM Servers
LEFT JOIN Alerts ON Servers.server_id = Alerts.server_id;

--Task 3: RIGHT JOIN 
--Show all alerts and the server name that triggered them, including alerts without a matching server. 
SELECT Alerts.alert_id, Alerts.alert_type, Alerts.severity, Servers.server_name
FROM Servers
RIGHT JOIN Alerts ON Servers.server_id = Alerts.server_id;

--Task 4: FULL OUTER JOIN 
--List all servers and alerts, including unmatched ones on both sides.
SELECT Servers.server_name, Alerts.alert_type, Alerts.severity
FROM Servers
FULL OUTER JOIN Alerts ON Servers.server_id = Alerts.server_id;

--Task 5: CROSS JOIN 
--Pair every AI model with every server (e.g., simulation of possible deployments).
SELECT Servers.server_name, AI_Models.model_name
FROM Servers
CROSS JOIN AI_Models;

--Task 6: INNER JOIN with Filter 
--List all critical alerts with the server name. 
SELECT Alerts.alert_id, Alerts.alert_type, Servers.server_name
FROM Alerts
INNER JOIN Servers ON Alerts.server_id = Servers.server_id
WHERE Alerts.severity = 'Critical';

--Task 7: LEFT JOIN with NULL filter 
--Find servers that do not have any AI models deployed. 
SELECT Servers.server_name
FROM Servers
LEFT JOIN ModelDeployments ON Servers.server_id = ModelDeployments.server_id
WHERE ModelDeployments.deployment_id IS NULL;

--Task 8: CROSS JOIN with WHERE 
--Simulate possible deployments for EU region servers only. 
 SELECT Servers.server_name, AI_Models.model_name
FROM Servers
CROSS JOIN AI_Models
WHERE Servers.region LIKE 'eu%';