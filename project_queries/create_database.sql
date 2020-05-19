-- Create database with tables, columns, and primary keys
CREATE TABLE census_statistics (
  zip_code    CHAR(5)   PRIMARY KEY,
  state_code    CHAR(2),
  pop_total   INT,
  median_household_income   MONEY,
  pct_edu_hs    DECIMAL(7, 4),
  pct_edu_somecollege_under1yr    DECIMAL(7, 4),
  pct_edu_somecollege_1plusyrs    DECIMAL(7, 4),
  pct_edu_attain_assoc    DECIMAL(7, 4),
  pct_edu_attain_bach    DECIMAL(7, 4),
  pct_edu_attain_master    DECIMAL(7, 4),
  pct_edu_attain_prof    DECIMAL(7, 4),
  pct_edu_attain_doct    DECIMAL(7, 4),
  pct_white	pct_black    DECIMAL(7, 4),
  pct_asian    DECIMAL(7, 4),
  pct_hispanic    DECIMAL(7, 4),
  pct_amerindian    DECIMAL(7, 4),
  pct_nativehawaii    DECIMAL(7, 4),
  pct_tworaces    DECIMAL(7, 4),
  pct_otherrace    DECIMAL(7, 4)
);



CREATE TABLE states (
  state_code    CHAR(2)   PRIMARY KEY,
  state_name    CHAR(15)
);



CREATE TABLE schools (
  school_id   CHAR(15)   PRIMARY KEY,
  school_name   VARCHAR(50),
  street_address    VARCHAR(50),
  city    VARCHAR(40),
  state_code    CHAR(2),
  zip_code    CHAR(5),
  locale_code   CHAR(2)
);



CREATE TABLE school_statistics (
  school_id   CHAR(15)   PRIMARY KEY,
  pct_proficient_math   DECIMAL(7, 4),
  pct_proficient_reading    DECIMAL(7, 4),
  pct_white   DECIMAL(7, 4),
  pct_black   DECIMAL(7, 4),
  pct_asian   DECIMAL(7, 4),
  pct_hispanic    DECIMAL(7, 4),
  pct_amerindian    DECIMAL(7, 4),
  pct_nativehawaii    DECIMAL(7, 4),
  pct_tworaces    DECIMAL(7, 4)
);





-- Add foreign keys to existing tables





-- Add check constriants to existing tables
