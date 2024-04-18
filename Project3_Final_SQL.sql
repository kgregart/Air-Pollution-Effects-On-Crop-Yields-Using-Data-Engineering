------------Create annual conc monitor table, this is the larger dataset--------------
CREATE TABLE annual_conc_by_monitor_3 (
    "State Code" VARCHAR(50),
    "County Code" VARCHAR(50),
    "Site Num" VARCHAR(50),
    "Parameter Code" VARCHAR(50),
    "POC" VARCHAR(50),
    "Latitude" FLOAT,
    "Longitude" FLOAT,
    "Datum" VARCHAR(50),
    "Parameter Name" VARCHAR(255),
    "Sample Duration" VARCHAR(255),
    "Pollutant Standard" VARCHAR(255),
    "Metric Used" VARCHAR(255),
    "Method Name" VARCHAR(255),
    "Year" INTEGER,
    "Units of Measure" VARCHAR(255),
    "Event Type" VARCHAR(50),
    "Observation Count" INTEGER,
    "Observation Percent" INTEGER,
    "Completeness Indicator" VARCHAR(10),
    "Valid Day Count" INTEGER,
    "Required Day Count" INTEGER,
    "Exceptional Data Count" INTEGER,
    "Null Data Count" INTEGER,
    "Primary Exceedance Count" VARCHAR(10),
    "Secondary Exceedance Count" VARCHAR(10),
    "Certification Indicator" VARCHAR(50),
    "Num Obs Below MDL" INTEGER,
    "Arithmetic Mean" FLOAT,
    "Arithmetic Standard Dev" FLOAT,
    "1st Max Value" VARCHAR(50),
    "1st Max DateTime" TIMESTAMP,
    "2nd Max Value" VARCHAR(50),
    "2nd Max DateTime" TIMESTAMP,
    "3rd Max Value" VARCHAR(50),
    "3rd Max DateTime" TIMESTAMP,
    "4th Max Value" VARCHAR(50),
    "4th Max DateTime" TIMESTAMP,
    "99th Percentile" VARCHAR(50),
    "98th Percentile" VARCHAR(50),
    "95th Percentile" VARCHAR(50),
    "90th Percentile" VARCHAR(50),
    "75th Percentile" VARCHAR(50),
    "50th Percentile" VARCHAR(50),
    "10th Percentile" VARCHAR(50),
    "Local Site Name" VARCHAR(255),
    "Address" VARCHAR(255),
    "State Name" VARCHAR(255),
    "County Name" VARCHAR(255),
    "City Name" VARCHAR(255),
    "CBSA Name" VARCHAR(255)
);
--NOTE: Primary key for the above table is the index 

SELECT * FROM annual_conc_by_monitor_3;
--confirm all years loaded into the table
SELECT 
DISTINCT "Year"
FROM 
annual_conc_by_monitor_3;

------------------Create annual aqi table----------------
CREATE TABLE annual_aqi_by_county (
    State VARCHAR(255),
    County VARCHAR(255),
    Year INTEGER,
    "Days with AQI" INTEGER,
    "Good Days" INTEGER,
    "Moderate Days" INTEGER,
    "Unhealthy for Sensitive Groups Days" INTEGER,
    "Unhealthy Days" INTEGER,
    "Very Unhealthy Days" INTEGER,
    "Hazardous Days" INTEGER,
    "Max AQI" INTEGER,
    "90th Percentile AQI" INTEGER,
    "Median AQI" INTEGER,
    "Days CO" INTEGER,
    "Days NO2" INTEGER,
    "Days Ozone" INTEGER,
    "Days PM2.5" INTEGER,
    "Days PM10" INTEGER,
	PRIMARY KEY (State, County, Year)
);

SELECT * FROM annual_aqi_by_county;
--check to see if all years loaded
SELECT 
DISTINCT Year
FROM 
annual_aqi_by_county
ORDER BY Year;

---------------create farm count table, only loaded 2013-2023 (10 years)------------
CREATE TABLE farm_count_2 (
	"Year" INTEGER,
	"State Code" VARCHAR(50),
    "County Code" VARCHAR(50),
	"State" VARCHAR(255),
    "County" VARCHAR(255),
	"State County Code" VARCHAR(50),
	"Farm Count" VARCHAR(255),
	PRIMARY KEY ("State", "County","Year")
);
SELECT * FROM farm_count_2;

SELECT 
DISTINCT "Year"
FROM 
farm_count_2;


---------------Create a new combined table from a query that contains aqi and conc monitor data--------------
--Joining tables on State, County, and Year
CREATE TABLE combine_aqu_conc AS (
SELECT * FROM annual_conc_by_monitor_3 JOIN annual_aqi_by_county 
ON annual_conc_by_monitor_3."State Name" =  annual_aqi_by_county.State 
AND annual_conc_by_monitor_3."County Name" =  annual_aqi_by_county.County
AND annual_conc_by_monitor_3."Year" =  annual_aqi_by_county.Year);

SELECT * FROM combine_aqu_conc;

--quick check to see if year columns are equal before dropping "year"
SELECT *
FROM combine_aqu_conc
WHERE Year != year;
--drop duplicate year column
ALTER TABLE combine_aqu_conc DROP COLUMN year;

--rename Year, state, county, state code and county code columns to avoid dup names
ALTER TABLE combine_aqu_conc RENAME COLUMN "Year" TO Year_Final;
ALTER TABLE combine_aqu_conc RENAME COLUMN "state" TO "state_2";
ALTER TABLE combine_aqu_conc RENAME COLUMN "county" TO "county_2";
ALTER TABLE combine_aqu_conc RENAME COLUMN "State Code" TO "State_Code_2";
ALTER TABLE combine_aqu_conc RENAME COLUMN "County Code" TO "County_Code_2";

----------Add farm data to make one larger database and save as final_table---------
--Joining tables on State, County, and Year
CREATE TABLE final_table AS (
SELECT * FROM combine_aqu_conc FULL OUTER JOIN farm_count_2
ON combine_aqu_conc.Year_Final =  farm_count_2."Year"
AND combine_aqu_conc."State Name" =  farm_count_2."State"
AND combine_aqu_conc."County Name" =  farm_count_2."County");

--drop duplicate columns to clean up dataset
ALTER TABLE final_table DROP COLUMN "State";
ALTER TABLE final_table DROP COLUMN "County";
ALTER TABLE final_table DROP COLUMN "Year";
ALTER TABLE final_table DROP COLUMN "State Code";
ALTER TABLE final_table DROP COLUMN "County Code";
ALTER TABLE final_table DROP COLUMN "State County Code";
ALTER TABLE final_table DROP COLUMN "state_2";
ALTER TABLE final_table DROP COLUMN "county_2";

--remove Puerto Rico and Virgin Islands from dataset
DELETE FROM final_table
WHERE "State_Code_2" IN ('72', '78');
SELECT * FROM final_table;

--rename columns to clean them up for final table
ALTER TABLE final_table RENAME COLUMN "State_Code_2" TO "State_Code";
ALTER TABLE final_table RENAME COLUMN "County_Code_2" TO "County_Code";
ALTER TABLE final_table RENAME COLUMN "year_final" TO "Year";
SELECT * FROM final_table;

--check to see all dataset by year is present
SELECT 
DISTINCT "Year"
FROM 
final_table
ORDER BY "Year";
