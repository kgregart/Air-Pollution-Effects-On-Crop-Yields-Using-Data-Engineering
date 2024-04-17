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

SELECT * FROM annual_conc_by_monitor_3;

SELECT 
DISTINCT "Year"
FROM 
annual_conc_by_monitor_3;

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

SELECT 
DISTINCT Year
FROM 
annual_aqi_by_county
ORDER BY Year;

SELECT * FROM annual_aqi_by_county;

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


ALTER TABLE annual_conc_by_monitor_3
ADD FOREIGN KEY ("State Name", "County Name", "Year") REFERENCES annual_aqi_by_county(State, County, Year);

--comment for now: ALTER TABLE annual_conc_by_monitor_3 ADD PRIMARY KEY ();

SELECT * FROM annual_conc_by_monitor_3
WHERE "State Name" = 'Ohio' AND  "County Name" = 'Adams' AND "Year" = '1997';

DELETE FROM annual_conc_by_monitor_3
WHERE "State Name" = 'Ohio' AND  "County Name" = 'Adams' AND "Year" = '1997';

--Deleted all rows that had State Name = Ohio AND County Name = Adams as this does not exist in the aqi by county data

SELECT * FROM annual_conc_by_monitor_3
WHERE "State Name" = 'Ohio' AND  "County Name" = 'Adams';

DELETE FROM annual_conc_by_monitor_3
WHERE "State Name" = 'Ohio' AND  "County Name" = 'Adams';

--created a new combined table from a query
CREATE TABLE combine_aqu_conc AS (
SELECT * FROM annual_conc_by_monitor_3 JOIN annual_aqi_by_county 
ON annual_conc_by_monitor_3."State Name" =  annual_aqi_by_county.State 
AND annual_conc_by_monitor_3."County Name" =  annual_aqi_by_county.County
AND annual_conc_by_monitor_3."Year" =  annual_aqi_by_county.Year);

SELECT * FROM combine_aqu_conc;

--trying to add farm data, but this only outputs limited data
SELECT DISTINCT Year FROM combine_aqu_conc JOIN farm_count_2
ON combine_aqu_conc."Year" =  farm_count_2."Year"
AND combine_aqu_conc."State Name" =  farm_count_2."State"
AND combine_aqu_conc."County Name" =  farm_count_2."County";

--
SELECT 
DISTINCT "Year"
FROM 
combine_aqu_conc
ORDER BY "Year";
