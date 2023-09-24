--  Cteate table Personal Data
CREATE TABLE IF NOT EXISTS Personal_Data (
    Customer_ID SERIAL PRIMARY KEY,
    Customer_Name VARCHAR(25) NOT NULL,
    Customer_Surname VARCHAR(50) NOT NULL,
    Customer_Primary_Email VARCHAR(50) NOT NULL,
    Customer_Primary_Phone VARCHAR(50) NOT NULL,

    CONSTRAINT persinfo_customer_id_pkey PRIMARY KEY (customer_id),
    CONSTRAINT persinfo_name_check CHECK (customer_name ~ '^[A-ZА-Я][a-zа-яё -]+$'),
    CONSTRAINT persinfo_surname_check CHECK (customer_surname ~ '^[A-ZА-Я][a-zа-яё -]+$'),
    CONSTRAINT persinfo_email_check CHECK (customer_primary_email ~ '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'),
    CONSTRAINT persinfo_phone_check CHECK (customer_primary_phone ~ '^[+][7][0-9]{10}')
);

CREATE TABLE IF NOT EXISTS Cards (
    Customer_Card_ID SERIAL PRIMARY KEY,
    Customer_ID INT NOT NULL,

    CONSTRAINT cards_customer_card_id_pkey PRIMARY KEY (Customer_Card_ID),
    CONSTRAINT customer_id_fkey FOREIGN KEY (Customer_ID) references Personal_Data(Customer_ID)
);

CREATE TABLE IF NOT EXISTS Transactions (
    Transaction_ID SERIAL PRIMARY KEY,
    Customer_Card_ID INT NOT NULL,
    Transaction_Summ NUMERIC NOT NULL,
    Transaction_DateTime TIMESTAMP NOT NULL,
    Transaction_Store_ID INT NOT NULL,

    CONSTRAINT transactions_transaction_id_pkey PRIMARY KEY (Transaction_ID),
    CONSTRAINT transactions_customer_card_id_fkey FOREIGN KEY Cards(Customer_Card_ID),
    CONSTRAINT transactions_summ_check CHECK (Transaction_Summ >= 0)
);

CREATE TABLE IF NOT EXISTS Checks (
    Transaction_ID SERIAL PRIMARY KEY,
    SKU_ID SERIAL PRIMARY KEY,
    SKU_Amount INT NOT NULL,
    SKU_Summ NUMERIC NOT NULL,
    SKU_Summ_Paid NUMERIC NOT NULL,
    SKU_Discount NUMERIC NOT NULL,

    CONSTRAINT checks_sku_id_pkey PRIMARY KEY (SKU_ID),
    CONSTRAINT checks_sku_summ_paid_id_fkey FOREIGN KEY Transactions(Transaction_Summ)

);

CREATE TABLE IF NOT EXISTS Product_Grid (
    SKU_ID SERIAL PRIMARY KEY,
    SKU_Name VARCHAR(50) NOT NULL,
    Group_ID INT NOT NULL,

    CONSTRAINT produduct_grid_sku_id_pkey PRIMARY KEY (SKU_ID),
    

);