-- DEFINE YOUR DATABASE SCHEMA HERE
DROP TABLE IF EXISTS town_health_records;

CREATE TABLE town_health_records (
  id SERIAL PRIMARY KEY,
  town varchar(100),
  total_pop INT,
  pop_0_to_19 INT,
  pop_over_65 INT,
  income MONEY,
  persons_below_poverty INT,
  all_persons_below_poverty INT,
  prenatal_care INT,
  c_sections_deliveries INT,
  numb_infants_death INT,
  infant_mortality_rate INT,
  low_birthweight INT,
  multiple_births INT,
  publicly_prenatal_care INT,
  teen_births INT
);
