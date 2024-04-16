CREATE TABLE farm_acres_10yrs (
	"Year" INTEGER,
	"State Code" VARCHAR(50),
    "County Code" VARCHAR(50),
	"State" VARCHAR(255),
    "County" VARCHAR(255),
	"State County Code" VARCHAR(50),
	"Farm Count" VARCHAR(255),
	PRIMARY KEY ("Year", "State", "County")
);

SELECT * FROM farm_acres_10yrs;