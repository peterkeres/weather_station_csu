/*  peter Keres
    oct 12 2019

    this is the creation of the users database for the weather station project
    v0.3
        odds are how size of data types might change to make more effecent.

    tables created:
      user
      groups
      right_list
      rights
      event
*/


--creates a table tha will hold information about each user in the weather station project
CREATE TABLE USERS(
      user_id                 INTEGER         PRIMARY KEY,            --AUTO_INCREMENT
      group_id                INT             NULL,
      name                    VARCHAR(100)    NOT NULL,
      username                VARCHAR(100)    NOT NULL,
      address                 VARCHAR(150)    NOT NULL,
      is_active               BINARY          NOT NULL,
      phone                   INT(10)         NOT NULL,
      email                   VARCHAR(150)    NOT NULL,
      password                VARCHAR(150)    NOT NULL,
      CONSTRAINT              USR_GROUP_PK    FOREIGN KEY(group_id)
                              REFERENCES      GROUPS(group_id)
);



--creates a table tha will hold information about each group in the weather station project
--use groups to tie multiple rights to them and then say a user is apart of the group
CREATE TABLE GROUPS(
      group_id                 INTEGER         PRIMARY KEY,           --AUTO_INCREMENT
      name                     VARCHAR(200)    NOT NULL,
      description              VARCHAR(500)    NOT NULL,
      created_date             DATE            NOT NULL,
      created_time             TIME            NOT NULL,
      created_by               INT             NOT NULL,
      CONSTRAINT               GRO_USER_PK     FOREIGN KEY(created_by)
                               REFERENCES      USERS(user_id)
);


--creates a table tha will hold information about what rights are tied to what group in the weather station project
CREATE TABLE RIGHTS_LIST(
      right_list_id            INTEGER         PRIMARY KEY,           --AUTO_INCREMENT
      group_id                 INT             NOT NULL,
      right_id                 INT             NOT NULL,
      created_date             DATE            NOT NULL,
      created_time             TIME            NOT NULL,
      created_by               INT             NOT NULL,
      CONSTRAINT               RLIS_USER_PK    FOREIGN KEY(created_by)
                               REFERENCES      USERS(user_id),
      CONSTRAINT               GRO_RLIS_PK     FOREIGN KEY(group_id)
                                REFERENCES      GROUPS(group_id),
      CONSTRAINT               RIT_RLIS_PK      FOREIGN KEY(right_id)
                                REFERENCES      RIGHTS(right_id)
);


--creates a table tha will hold information about each right in the weather station project
CREATE TABLE RIGHTS(
      right_id                 INTEGER         PRIMARY KEY,           --AUTO_INCREMENT
      name                     VARCHAR(200)    NOT NULL,
      description              VARCHAR(500)    NOT NULL,
      is_active                BINARY          NOT NULL,
      created_date             DATE            NOT NULL,
      created_time             TIME            NOT NULL,
      created_by               INT             NOT NULL,
      CONSTRAINT               RLIS_USER_PK    FOREIGN KEY(created_by)
                               REFERENCES      USERS(user_id)
);


--creates a table tha will hold information about each event that happens in the weather station project
CREATE TABLE EVENT(
      event_id                 INTEGER         PRIMARY KEY,           --AUTO_INCREMENT
      name                     VARCHAR(200)    NOT NULL,
      description              VARCHAR(500)    NOT NULL,
      created_date             DATE            NOT NULL,
      created_time             TIME            NOT NULL,
      created_by               INT             NOT NULL,
      CONSTRAINT               RLIS_USER_PK    FOREIGN KEY(created_by)
                               REFERENCES      USERS(user_id)
);
