/*  peter Keres
    sep 28 2019

    this is some smaple data to check recorders database for weather station project v0.3

    creates 2 stations and 2 sensors. along with 2 records, each one created by
    a different station. finally, updating the sensor list accordingly with one
    sensor on each station
*/


--creating 2 weather stations
INSERT INTO WEATHER_STATION
  (name, location, encoding_thing, name_datalogger, model, unknown_1, unknown_2,program_name_path, unknown_3, unknown_4)
VALUES
  ("test station 1", "over by cct building", "what ever the encoding thing is","logger55","model 2.0", "what ever this is", "whatever this si 2", "/mnt/desktop/user", "nope", "nope"),
  ("test station 2", "on top of the gym", "dont really know what this is","logger8898","model 1.5", "not sure 1", "not sure 2", "/etc/weather/records", "nope", "nope")
;

--creating 2 sensros
INSERT INTO SENSORS
  (name, type,description, notes)
VALUES
  ("sensor for rain", "rain", "model number 2245, version 2", "has a chip on right side. not sure if damaged or still works."),
  ("sensor for wind", "wind", "model number 33, version 5","")
;

--creating 2 weather records. one taken by each weather station
INSERT INTO WEATHER_RECORD
  (station_id, dateTaken, timeTaken, record_number, battery_bolts, temperature, relative_humidity,
  solar_wind_speed, resfront_wind_speed, wind_direction, wind_stand_deviation, peak_gust, time_peak_gust,
  parometic_pressure, rainfall)
VALUES
  (
    (select station_id from WEATHER_STATION WHERE station_id = 1),
    '2019-12-24','03:40:20',22,12.22,78.60,44.66,
    67.444, 2.3, 33, 0, 44, '14:20:22',
    22.22,0
  ),
  (
    (select station_id from WEATHER_STATION WHERE station_id = 2),
    '2019-12-24','03:40:20',22,12.22,78.60,44.66,
    67.444, 2.3, 33, 0, 44, '14:20:22',
    22.22,0
  )
;

--ties 2 senors to each station
INSERT INTO SENSOR_LIST
  (sensor_id, station_id, active_date, is_active)
VALUES
  (
      (select sensor_id from SENSORS where sensor_id = 1),
      (select station_id from WEATHER_STATION where station_id = 1),
      '2019-02-01',1
  ),
  (
      (select sensor_id from SENSORS where sensor_id = 2),
      (select station_id from WEATHER_STATION where station_id = 2),
      '2019-03-22',1
  )
;
