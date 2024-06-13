<<<<<<< HEAD
﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/c4neS7
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- air_pollution

SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [annual_aqi_by_county] (
    [Year] int  NOT NULL ,
    [State] varchar(255)  NOT NULL ,
    [County] varchar(255)  NOT NULL ,
    [Days With AQI] int  NOT NULL ,
    [Good Days] int  NOT NULL ,
    [Moderate Days] int  NOT NULL ,
    [Unhealthy for Sensitive Groups Days] int  NOT NULL ,
    [Unhealthy Days] int  NOT NULL ,
    [Very Unhealthy Days] int  NOT NULL ,
    [Hazardous Days] int  NOT NULL ,
    [Max AQI] int  NOT NULL ,
    [90th Percentile AQI] int  NOT NULL ,
    [Median AQI] int  NOT NULL ,
    [Days CO] int  NOT NULL ,
    [Days NO2] int  NOT NULL ,
    [Days Ozone] int  NOT NULL ,
    [Days PM2.5] int  NOT NULL ,
    [Days PM10] int  NOT NULL ,
    CONSTRAINT [PK_annual_aqi_by_county] PRIMARY KEY CLUSTERED (
        [Year] ASC,[State] ASC,[County] ASC
    )
)

CREATE TABLE [annual_conc_by_monitor_3] (
    -- "Index" PK
    [State Code] varchar(50)  NOT NULL ,
    [County Code] varchar(50)  NOT NULL ,
    [Site Num] varchar(50)  NOT NULL ,
    [Parameter Code] varchar(50)  NOT NULL ,
    [POC] varchar(50)  NOT NULL ,
    [Latitude] float  NOT NULL ,
    [Longitude] float  NOT NULL ,
    [Datum] varchar(50)  NOT NULL ,
    [Parameter Name] varchar(255)  NOT NULL ,
    [Sample Duration] varchar(255)  NOT NULL ,
    [Pollutant Standard] varchar(255)  NOT NULL ,
    [Metric Used] varchar(255)  NOT NULL ,
    [Method Name] varchar(255)  NOT NULL ,
    [Year] int  NOT NULL ,
    [State Name] varchar(255)  NOT NULL ,
    [County Name] varchar(255)  NOT NULL ,
    [Units of Measure] varchar(255)  NOT NULL ,
    [Event Type] varchar(50)  NOT NULL ,
    [Observation Count] int  NOT NULL ,
    [Observation Percent] int  NOT NULL ,
    [Completeness Indicator] varchar(10)  NOT NULL ,
    [Valid Day Count] int  NOT NULL ,
    [Required Day Count] int  NOT NULL ,
    [Exceptional Data Count] int  NOT NULL ,
    [Null Data Count] int  NOT NULL ,
    [Primary Exceedance Count] varchar(10)  NOT NULL ,
    [Secondary Exceedance Count] varchar(10)  NOT NULL ,
    [Certification Indicator] varchar(50)  NOT NULL ,
    [Num Obs Below MDL] int  NOT NULL ,
    [Arithmetic Mean] float  NOT NULL ,
    [Arithmetic Standard Dev] float  NOT NULL ,
    [1st Max Value] varchar(50)  NOT NULL ,
    [1st Max DateTime] timestamp  NOT NULL ,
    [2nd Max Value] varchar(50)  NOT NULL ,
    [2nd Max DateTime] timestamp  NOT NULL ,
    [3rd Max Value] varchar(50)  NOT NULL ,
    [3rd Max DateTime] timestamp  NOT NULL ,
    [4th Max Value] varchar(50)  NOT NULL ,
    [4th Max DateTime] timestamp  NOT NULL ,
    [99th Percentile] varchar(50)  NOT NULL ,
    [98th Percentile] varchar(50)  NOT NULL ,
    [95th Percentile] varchar(50)  NOT NULL ,
    [90th Percentile] varchar(50)  NOT NULL ,
    [75th Percentile] varchar(50)  NOT NULL ,
    [50th Percentile] varchar(50)  NOT NULL ,
    [10th Percentile] varchar(50)  NOT NULL ,
    [Local Site Name] varchar(255)  NOT NULL ,
    [Address] varchar(255)  NOT NULL ,
    [City Name] varchar(255)  NOT NULL ,
    [CBSA Name] varchar(255)  NOT NULL 
)

CREATE TABLE [farm_count_2] (
    [Year] int  NOT NULL ,
    [State] varchar(255)  NOT NULL ,
    [County] varchar(255)  NOT NULL ,
    [State Code] VARCHAR(50)  NOT NULL ,
    [County Code] VARCHAR(50)  NOT NULL ,
    [State County Code] VARCHAR(50)  NOT NULL ,
    [Farm Count] varchar(255)  NOT NULL ,
    CONSTRAINT [PK_farm_count_2] PRIMARY KEY CLUSTERED (
        [Year] ASC,[State] ASC,[County] ASC
    )
)

ALTER TABLE [annual_aqi_by_county] WITH CHECK ADD CONSTRAINT [FK_annual_aqi_by_county_Year_State_County] FOREIGN KEY([Year], [State], [County])
REFERENCES [annual_conc_by_monitor_3] ([Year], [State Name], [County Name])

ALTER TABLE [annual_aqi_by_county] CHECK CONSTRAINT [FK_annual_aqi_by_county_Year_State_County]

ALTER TABLE [farm_count_2] WITH CHECK ADD CONSTRAINT [FK_farm_count_2_Year_State_County] FOREIGN KEY([Year], [State], [County])
REFERENCES [annual_aqi_by_county] ([Year], [State], [County])

ALTER TABLE [farm_count_2] CHECK CONSTRAINT [FK_farm_count_2_Year_State_County]

=======
﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/c4neS7
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- air_pollution

SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [annual_aqi_by_county] (
    [Year] int  NOT NULL ,
    [State] varchar(255)  NOT NULL ,
    [County] varchar(255)  NOT NULL ,
    [Days With AQI] int  NOT NULL ,
    [Good Days] int  NOT NULL ,
    [Moderate Days] int  NOT NULL ,
    [Unhealthy for Sensitive Groups Days] int  NOT NULL ,
    [Unhealthy Days] int  NOT NULL ,
    [Very Unhealthy Days] int  NOT NULL ,
    [Hazardous Days] int  NOT NULL ,
    [Max AQI] int  NOT NULL ,
    [90th Percentile AQI] int  NOT NULL ,
    [Median AQI] int  NOT NULL ,
    [Days CO] int  NOT NULL ,
    [Days NO2] int  NOT NULL ,
    [Days Ozone] int  NOT NULL ,
    [Days PM2.5] int  NOT NULL ,
    [Days PM10] int  NOT NULL ,
    CONSTRAINT [PK_annual_aqi_by_county] PRIMARY KEY CLUSTERED (
        [Year] ASC,[State] ASC,[County] ASC
    )
)

CREATE TABLE [annual_conc_by_monitor_3] (
    -- "Index" PK
    [State Code] varchar(50)  NOT NULL ,
    [County Code] varchar(50)  NOT NULL ,
    [Site Num] varchar(50)  NOT NULL ,
    [Parameter Code] varchar(50)  NOT NULL ,
    [POC] varchar(50)  NOT NULL ,
    [Latitude] float  NOT NULL ,
    [Longitude] float  NOT NULL ,
    [Datum] varchar(50)  NOT NULL ,
    [Parameter Name] varchar(255)  NOT NULL ,
    [Sample Duration] varchar(255)  NOT NULL ,
    [Pollutant Standard] varchar(255)  NOT NULL ,
    [Metric Used] varchar(255)  NOT NULL ,
    [Method Name] varchar(255)  NOT NULL ,
    [Year] int  NOT NULL ,
    [State Name] varchar(255)  NOT NULL ,
    [County Name] varchar(255)  NOT NULL ,
    [Units of Measure] varchar(255)  NOT NULL ,
    [Event Type] varchar(50)  NOT NULL ,
    [Observation Count] int  NOT NULL ,
    [Observation Percent] int  NOT NULL ,
    [Completeness Indicator] varchar(10)  NOT NULL ,
    [Valid Day Count] int  NOT NULL ,
    [Required Day Count] int  NOT NULL ,
    [Exceptional Data Count] int  NOT NULL ,
    [Null Data Count] int  NOT NULL ,
    [Primary Exceedance Count] varchar(10)  NOT NULL ,
    [Secondary Exceedance Count] varchar(10)  NOT NULL ,
    [Certification Indicator] varchar(50)  NOT NULL ,
    [Num Obs Below MDL] int  NOT NULL ,
    [Arithmetic Mean] float  NOT NULL ,
    [Arithmetic Standard Dev] float  NOT NULL ,
    [1st Max Value] varchar(50)  NOT NULL ,
    [1st Max DateTime] timestamp  NOT NULL ,
    [2nd Max Value] varchar(50)  NOT NULL ,
    [2nd Max DateTime] timestamp  NOT NULL ,
    [3rd Max Value] varchar(50)  NOT NULL ,
    [3rd Max DateTime] timestamp  NOT NULL ,
    [4th Max Value] varchar(50)  NOT NULL ,
    [4th Max DateTime] timestamp  NOT NULL ,
    [99th Percentile] varchar(50)  NOT NULL ,
    [98th Percentile] varchar(50)  NOT NULL ,
    [95th Percentile] varchar(50)  NOT NULL ,
    [90th Percentile] varchar(50)  NOT NULL ,
    [75th Percentile] varchar(50)  NOT NULL ,
    [50th Percentile] varchar(50)  NOT NULL ,
    [10th Percentile] varchar(50)  NOT NULL ,
    [Local Site Name] varchar(255)  NOT NULL ,
    [Address] varchar(255)  NOT NULL ,
    [City Name] varchar(255)  NOT NULL ,
    [CBSA Name] varchar(255)  NOT NULL 
)

CREATE TABLE [farm_count_2] (
    [Year] int  NOT NULL ,
    [State] varchar(255)  NOT NULL ,
    [County] varchar(255)  NOT NULL ,
    [State Code] VARCHAR(50)  NOT NULL ,
    [County Code] VARCHAR(50)  NOT NULL ,
    [State County Code] VARCHAR(50)  NOT NULL ,
    [Farm Count] varchar(255)  NOT NULL ,
    CONSTRAINT [PK_farm_count_2] PRIMARY KEY CLUSTERED (
        [Year] ASC,[State] ASC,[County] ASC
    )
)

ALTER TABLE [annual_aqi_by_county] WITH CHECK ADD CONSTRAINT [FK_annual_aqi_by_county_Year_State_County] FOREIGN KEY([Year], [State], [County])
REFERENCES [annual_conc_by_monitor_3] ([Year], [State Name], [County Name])

ALTER TABLE [annual_aqi_by_county] CHECK CONSTRAINT [FK_annual_aqi_by_county_Year_State_County]

ALTER TABLE [farm_count_2] WITH CHECK ADD CONSTRAINT [FK_farm_count_2_Year_State_County] FOREIGN KEY([Year], [State], [County])
REFERENCES [annual_aqi_by_county] ([Year], [State], [County])

ALTER TABLE [farm_count_2] CHECK CONSTRAINT [FK_farm_count_2_Year_State_County]

>>>>>>> 123a23a40dedda9b3e2cd65bb27b913dd3e7afac
COMMIT TRANSACTION QUICKDBD