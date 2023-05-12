--Schema for crowdfunding_db which creates table structure to import four related csvs
--filename: crowdfunding_db_schema.sql
--Import csv's in this order: category, contacts, subcategory, campgain

--Drop tables if exists
--The drop table order must be retained due to db constraints
DROP TABLE IF EXISTS campaign;
DROP TABLE IF EXISTS subcategory;
DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS category;

--The create table order must be retained due to db constraints

--Create subcategory table
CREATE TABLE subcategory (
  subcategory_id VARCHAR(10) PRIMARY KEY,
  subcategory VARCHAR(25) NOT NULL UNIQUE
);

--Create contacts table
CREATE TABLE contacts (
  contact_id INTEGER PRIMARY KEY,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  email VARCHAR(60) NOT NULL
);

--Create category table
CREATE TABLE category (
  category_id VARCHAR(5) PRIMARY KEY,
  category VARCHAR(25) NOT NULL
);

--Create campaign table
CREATE TABLE campaign (
  cf_id INTEGER PRIMARY KEY,
  contact_id INTEGER,
  FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
  company_name VARCHAR(40) NOT NULL,
  description  VARCHAR(75) NOT NULL,
  goal FLOAT NOT NULL,
  pledged FLOAT NOT NULL,
  outcome VARCHAR(15) NOT NULL,
  backers_count INTEGER,
  country VARCHAR(2) NOT NULL,
  currency VARCHAR(3) NOT NULL,
  launched_date DATE,
  end_date DATE,
  category_id VARCHAR(5),
  FOREIGN KEY (category_id) REFERENCES category(category_id),
  subcategory_id VARCHAR(10),
  FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);





