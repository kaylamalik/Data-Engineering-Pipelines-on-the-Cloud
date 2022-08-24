CREATE DATABASE IF NOT EXISTS gans; 

USE gans;
select * from arrivals;

DROP TABLE IF EXISTS cities;
CREATE TABLE IF NOT EXISTS cities (
    City VARCHAR(200),
    Country varchar(200),
    Population TEXT, 
    ISO varchar(2),
	City_Country varchar(200),
    PRIMARY KEY(City_Country)
); 

select * from cities;
describe cities;


drop table if exists weather; 
create table if not exists weather (
	Weather_ID int auto_increment, 
    Date_Time datetime, 
    Temperature float, 
    Wind float, 
    Prob_Percipitation float, 
    Rain float, 
    Snow integer, 
    City_Country varchar(200),
    primary key(weather_id), 
    foreign key (City_Country) references cities(City_Country)
);
-- select * from weather;

drop table if exists cities_airports;
create table if not exists cities_airports(
    Airport text, 
    City_Country varchar(200), 
    ICAO varchar(4),
    primary key(ICAO),
    foreign key (City_Country) references cities(City_Country)
);
-- select * from airports;

drop table if exists arrivals; 
create table if not exists arrivals(
	arrivals_id int auto_increment, 
    Departure_City text, 
    Arrival_Time datetime, 
    Terminal integer, 
    Status text, 
	Flight text, 
    ICAO varchar(4),
    primary key (arrivals_id), 
    foreign key (ICAO) references cities_airports(ICAO)
);

select * from arrivals;