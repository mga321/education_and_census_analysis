-- Create database
CREATE TABLE census_statistics (
  zip_code,
  state_code,
  pop_total,
  median_household_income,
  pct_edu_hs,
  pct_edu_somecollege_under1yr
  pct_edu_somecollege_1plusyrs,
  pct_edu_attain_assoc,
  pct_edu_attain_bach,
  pct_edu_attain_master,
  pct_edu_attain_prof,
  pct_edu_attain_doct
  pct_white	pct_black,
  pct_asian,
  pct_hispanic,
  pct_amerindian,
  pct_nativehawaii,
  pct_tworaces,
  pct_otherrace
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
