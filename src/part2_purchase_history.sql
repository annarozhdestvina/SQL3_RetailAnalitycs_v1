-- output data

CREATE TABLE IF NOT EXISTS Purchase_history_View (
    Customer_ID
    Transaction_ID
    Transaction_DateTime TIMESTAMP without time zone,
    Group_ID 
    Group_Cost INT NOT NULL,
    Group_Summ INT NOT NULL,
    Group_Summ_Paid INT NOT NULL,


);