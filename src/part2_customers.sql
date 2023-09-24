-- creation output data
--  Table Customer View

CREATE TABLE IF NOT EXISTS Customer_View (
    Customer_ID SERIAL PRIMARY KEY,
    Customer_Average_Check INT NOT NULL,
    Customer_Average_Check_Segment VARCHAR(50) NOT NULL,
    Customer_Frequency INT NOT NULL,
    Customer_Frequency_Segment VARCHAR(50) NOT NULL,
    Customer_Inactive_Period INT NOT NULL,
    Customer_Churn_Rate INT NOT NULL,
    Customer_Churn_Segment VARCHAR(50) NOT NULL,
    Customer_SegmentINT NOT NULL,
    Customer_Primary_Store 

);