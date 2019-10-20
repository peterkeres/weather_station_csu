/*  peter Keres
    sep 28 2019

    this is the creation of the weather rec database for the weather station project
    v0.3
        odds are how size of data types might change to make more effecent.

        tables:
          weather station
          SENSORS
          sensor list
          record

*/


--creates a table tha will hold information about each wweather station in the system
CREATE TABLE WEATHER_STATION(
      station_id              INTEGER         PRIMARY KEY,            --AUTO_INCREMENT
      name                    VARCHAR(200)    NOT NULL,
      location                VARCHAR(500)    NOT NULL,
      encoding_thing          VARCHAR(150)    NOT NULL,
      name_datalogger         VARCHAR(150)    NOT NULL,
      model                   VARCHAR(150)    NOT NULL,
      unknown_1               VARCHAR(150)    NOT NULL,
      unknown_2               VARCHAR(150)    NOT NULL,
      program_name_path       VARCHAR(150)    NOT NULL,
      unknown_3               VARCHAR(150)    NOT NULL,
      unknown_4               VARCHAR(150)    NOT NULL
);


--creates the table that will hold the sensors of the system
CREATE TABLE SENSORS(
      sensor_id               INTEGER         PRIMARY KEY,            --AUTO_INCREMENT
      name                    VARCHAR(150)    NOT NULL,
      type                    VARCHAR(150)    NOT NULL,
      description             VARCHAR(500)    NULL,
      notes                   VARCHAR(800)    NULL
);


--creates the table that will hold a list of sensors tieing them back to a station. aka joining table
CREATE TABLE SENSOR_LIST(
      sensor_list_id        INTEGER             PRIMARY KEY,            --AUTO_INCREMENT
      sensor_id             INT                 NOT NULL,
      station_id            INT                 NOT NULL,
      active_date           DATE                NOT NULL,
      is_active             BINARY              NOT NULL,
      de_avtive_date        DATE                NULL,
      CONSTRAINT            LIS_SENSOR_PK       FOREIGN KEY(sensor_id)
                            REFERENCES          SENSORS(sensor_id),
      CONSTRAINT            LIS_STATION_PK      FOREIGN KEY(station_id)
                            REFERENCES          WEATHER_STATION(station_id)
);

--creats the table that will hold the each record from the weather station
CREATE TABLE WEATHER_RECORD(
      record_id               INTEGER           PRIMARY KEY,          --AUTO_INCREMENT
      station_id              INT               NOT NULL,
      dateTaken               DATE              NOT NULL,
      timeTaken               TIME              NOT NULL,
      record_number           INTEGER(10)       NULL,
      battery_bolts           DOUBLE(6,3)       NULL,
      temperature             DOUBLE(6,3)       NULL,
      relative_humidity       DOUBLE(6,3)       NULL,
      solar_wind_speed        DOUBLE(6,3)       NULL,
      resfront_wind_speed     DOUBLE(6,3)       NULL,
      wind_direction          DOUBLE(6,3)       NULL,
      wind_stand_deviation    DOUBLE(6,3)       NULL,
      peak_gust               DOUBLE(6,3)       NULL,
      time_peak_gust          TIME              NULL,
      parometic_pressure      DOUBLE(6,3)       NULL,
      rainfall                DOUBLE(6,3)       NULL,
      CONSTRAINT              REC_STATION_PK    FOREIGN KEY(station_id)
                              REFERENCES        WEATHER_STATION(station_id)
);
