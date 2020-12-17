# Database for Microclimate Mesonet Research
This repo holds files that are needed to create, fill, and test the database for the microclimate mesonet project

![Users database](Resources/Database%20design%20users.png)
![Weather Records database](Resources/Database%20design%20weather%20records.png)

# Whats a Mesonet
A network of weather sensing devices that can record the weather information around them. This collecting of data can be used to track weather movements on a accurate scale. Tracking the sudden creation and change in tornados and other weather forces are now possible with a mesonet.

# What is this project
The purpose of this project is to present an overview of the construction efforts, instruments, real-time network,
and database used on the tower as well as the collaborations that allowed the development of a website. The website would be a statistical summary of the validation efforts and
highlights of interesting weather events.

in short, we wanted to create instructions so others could create there own mesonet and an accompanying website to view the weather data being recorded. 

# Publishing
Our work is being published by [Springer publishing](http://link-springer-com-443.webvpn.fjmu.edu.cn/chapter/10.1007%2F978-3-030-44038-1_3) ~~and is being presented at the [2020 AINA International Conference](http://voyager.ce.fit.ac.jp/conf/aina/2020/) in Caserta, Italy on april 15.~~ 

For your convince, i provided a link to the published work: [Published Work](Resources/published_work.pdf)

## Covid-19 update:
Due to the Covid-19 outbreak, the AINA 2020 conference has been canceled. The paper is still being published by Springer publishing. 

### Official statement:
> Dear AINA-2020 Authors.
The situation of COVID-19 in Italy is worsening. The Italian government has declared Italy as exclusion zone. After discussing with Local Organizers and Steering Committee, we decided to cancel AINA-2020. However by our contract with Springer, we will publish all papers in AINA-2020 and WAINA-2020 Proceedings. The proceedings will be published in Springer Series "Advances in Intelligent Systems and Computing". You will be able to download the proceedings for free in AINA-2020 Website between April 1, 2020 and April 30, 2020.
You can download the receipt of registration payment from EDAS. If you need a receipt with signature from AINA-2020 Organizing Committee, please inform us by e-mail.

# The Team
## Project Advisor:
Jianhua Yang
## Project Leader:
James Robertson
## Earth and Science Advisor:
W. Scoot Gunter
## Front-end Developer:
Thomas Wingate
## Back-end Developer:
Anthony Obando
## Database Developer:
[Peter Keres](https://github.com/peterkeres)
# What is in this repository
Is a collections of files that are used to create the database for the mesonet project.

### Files:
* OXBOW_one_min_20190217.txt
    *  Output from one weather sensor over a few hour period. 
* weather_file_reader.py
    * is a python script that reads in the weather station output file to extract the data. The data input into the test database.
* weather_records_data_test.sql
    * Creates random test data to be placed into the weather records tables
* weather_records_db.sql
    * creates the tables for the records potation of the database. 
* weather_station_db_test.db
    * is the in place test database.
* weather_users_data_test.sql
    * creates random test data to be placed in the users tables. 
* weather_users_db.sql
    * creates the tables for the users potation of the database. 

