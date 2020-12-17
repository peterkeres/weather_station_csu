'''
Peter Keres
sep 29 2019
weather station project
this text files from a weather station, extract all the data and put into our data base
'''

import sqlite3
from sqlite3 import Error


def Main():
    print("Starting the weather text file reader program");
    print("==============================================");
    print("==============================================");

    print();
    print();

    print("Connecting to the database file weather_station_db_test.db")
    conn = create_connection("weather_station_db_test.db")

    filename = "OXBOW_one_min_20190217.txt";
    print("Opening file name: " + filename);

    print();
    print();

    print("adding all record in file to the database");
    FileReader(filename,conn);


    print("==============================================");
    print("==============================================");
    print("END of program");



# this reads each line of the file and adds information needed to the database
# PRAM:
#   filename - the file name of the file we are opening to add to the database
#   conn - the connection to the database
def FileReader(filename,conn):

    # opens file
    file = open(filename,"r");

    # gets header line that holds station info and adds to database
    firstLine = file.readline();
    station = create_station(firstLine, "first station", " by cct bulding");
    station_id = add_station(conn, station);

    # saves changes to the database
    conn.commit();


    #skips over the columb title lines in the file
    file.readline();
    file.readline();
    file.readline();

    #reads each record of the file and puts into the database
    for line in file:

        record = create_record(line, station_id);
        record_id = add_record(conn, record);

    # saves records to the database
    conn.commit();

    #close the file
    file.close();

    return None;


# this takes a line read from the file and makes a station array
# parts of station are as follows
# Name / location /Some Encoding thing / Name of the Datalogger / DataLogger Model / ? / ? / Data Logger Program name and path
# PARM:
#   line- first line of the file that holds the station information
#   name - the name we are giving this station
#   location - where the station is physically located
# RETURN:
#   the array of a station items
def create_station(line, name, location):
    split = line.split(',');

    station = [name, location];

    for part in split:
        station.append(part.strip('"'));

    return station;



# takes a line read from the file and creates it into a record array object
# trims off unnessary data / characters
# PRAM:
#   line - the indivual record read from the file
# RETURN:
#   the array of a record items
def create_record(line, station_id):

    split = line.split(',');

    record = [station_id,];

    for part in split:

        temp = part.strip('"');

        # looks for a data
        if ":" in temp:
            dataSplit = temp.split(' ');
            record.append(dataSplit[0]);
            record.append(dataSplit[1]);
        else:
            record.append(temp);

    '''
    # debug
    for part in record:
        print(part);
    '''

    return record



# this puts a record into the database
# PARM:
#   conn - the connection to the database
#   record - the array of items that form a record object
# RETURN:
#   the id of the record that gets added

def add_record(conn, record):

    sql = '''INSERT INTO WEATHER_RECORD(station_id,dateTaken,timeTaken,record_number,battery_bolts,temperature,
                                        relative_humidity,solar_wind_speed,resfront_wind_speed,wind_direction,
                                        wind_stand_deviation,peak_gust,date_peak_gust,time_peak_gust,parometic_pressure,rainfall)
            VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)'''

    cur = conn.cursor()
    cur.execute(sql, record)

    return cur.lastrowid


# this puts a station into the database
# PARM:
#   conn - the connection to the database
#   station - the array of items that form a station object
# RETURN:
#   the id of the station that gets added
def add_station(conn, station):

    sql = '''INSERT INTO WEATHER_STATION(name,location,encoding_thing, name_datalogger, model, unknown_1, unknown_2, program_name_path, unknown_3, unknown_4)
            VALUES(?,?,?,?,?,?,?,?,?,?)'''

    cur = conn.cursor()
    cur.execute(sql, station)

    return cur.lastrowid



# creates a connection to a sql light database
# PARAM:
#   db_file - the file path to the sql light database
# RETURN
#   the connection object to the database
def create_connection(db_file):
    """ create a database connection to a SQLite database """
    try:
        conn = sqlite3.connect(db_file)
        print(sqlite3.version)
        print("Connected")
        return conn
    except Error as e:
        print(e)

    return None


Main();
