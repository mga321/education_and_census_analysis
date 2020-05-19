-- Create database
CREATE TABLE census_statistics (
  zip_code    CHAR(5),
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
  state_code,
  state_name
);



CREATE TABLE schools (
  school_id,
  school_name,
  street_address,
  city,
  state_code,
  zip_code,
  locale_code
);



CREATE TABLE school_statistics (
  school_id,
  pct_proficient_math,
  pct_proficient_reading,
  pct_white,
  pct_black,
  pct_asian	pct_hispanic,
  pct_amerindian,
  pct_nativehawaii,
  pct_tworaces
);



CREATE TABLE schools_and_states (
  school_id,
  state_code
);
