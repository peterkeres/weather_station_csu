/*  peter Keres
    oct 17 2019

    this is the creation of the test data for the users database for the weather station project
    v0.3

    this creates 3 users, 3 groups, 4 rights, and 1 event
*/


-- adds in 3 users to the system
INSERT INTO USERS
  (group_id, name, username, address, active, phone, email,password)
VALUES
  (NULL, "peter keres", "pkeres_csu", "110 greenville street", 1, 7705566678, "pkeres@gmail.com", "aa345Bde$#%"),
  (NULL, "jack robert", "jrobert_csu", "6780 north street", 1, 7064487756, "jrobert@gmail.com", "password"),
  (NULL, "sam barlow", "sbarlow_csu", "20 mort lake drive", 0, 404998765, "sbarlow@gmail.com", "8894TGW")
;


-- adds 3 differetn groups to the system
INSERT INTO GROUPS
  (name, description, created_date, created_time, created_by)
VALUES
  ("admin", "this is the super user of the system.", '2019-12-24', '05:40:00',
    (select user_id from USERS WHERE name = "peter keres")),
  ("student", "this is for stutends at CSU.", '2019-12-24', '06:33:00',
    (select user_id from USERS WHERE name = 'peter keres')),
  ("general", "any user on the system.", '2019-12-24', '08:01:00',
    (select user_id from USERS WHERE name = "jack robert"))
;


-- sets groups to the 3 users
UPDATE USERS
SET group_id = (select group_id from GROUPS where name = "admin")
WHERE name = "peter keres"
;

UPDATE USERS
SET group_id = (select group_id from GROUPS where name = "admin")
WHERE name = "jack robert"
;

UPDATE USERS
SET group_id = (select group_id from GROUPS where name = "general")
WHERE name = "sam barlow"
;



-- adds in 4 different rights that groups can do on the system
INSERT INTO RIGHTS
  (name, description, active, created_date, created_time, created_by)
VALUES
  ("delete user", " this allows someone to set a users active field to 0", 1, '2020-03-01', '13:20:00',
    (select user_id from USERS WHERE name = 'peter keres')),
  ("add user", "this allows someone to add a user to the system", 1, '2020-03-01', '13:20:00',
    (select user_id from USERS WHERE name = 'peter keres')),
  ("view records", " this allows someone to view records on the system", 1, '2020-03-01', '13:20:00',
    (select user_id from USERS WHERE name = 'peter keres')),
  ("delete records", " this allows someone to delete records on the system", 1, '2020-03-01', '13:20:00',
    (select user_id from USERS WHERE name = 'peter keres'))
;

-- ties the what ever rights to a group
INSERT INTO RIGHT_LIST
  (group_id, right_id, created_date, created_time, created_by)
VALUES
  ((select group_id from GROUPS WHERE name = 'admin'),
    (select right_id from RIGHTS WHERE name = 'delete user'),
    '2020-03-01', '13:20:00',(select user_id from USERS WHERE name = 'peter keres'))
  ,
  ((select group_id from GROUPS WHERE name = 'admin'),
    (select right_id from RIGHTS WHERE name = 'add user'),
    '2020-03-01', '13:20:00',(select user_id from USERS WHERE name = 'peter keres'))
  ,
  ((select group_id from GROUPS WHERE name = 'admin'),
    (select right_id from RIGHTS WHERE name = 'view records'),
    '2020-03-01', '13:20:00',(select user_id from USERS WHERE name = 'peter keres'))
  ,
  ((select group_id from GROUPS WHERE name = 'admin'),
    (select right_id from RIGHTS WHERE name = 'delete records'),
    '2020-03-01', '13:20:00',(select user_id from USERS WHERE name = 'peter keres'))
  ,
  ((select group_id from GROUPS WHERE name = 'student'),
    (select right_id from RIGHTS WHERE name = 'add user'),
    '2020-03-01', '13:20:00',(select user_id from USERS WHERE name = 'peter keres'))
  ,
    ((select group_id from GROUPS WHERE name = 'student'),
      (select right_id from RIGHTS WHERE name = 'view records'),
      '2020-03-01', '13:20:00',(select user_id from USERS WHERE name = 'peter keres'))
  ,
  ((select group_id from GROUPS WHERE name = 'general'),
    (select right_id from RIGHTS WHERE name = 'view records'),
    '2020-03-01', '13:20:00',(select user_id from USERS WHERE name = 'peter keres'))
;


-- adds another user to show an even example
INSERT INTO USERS
  (group_id, name, username, address, active, phone, email,password)
VALUES
  (NULL, "jessica baerk", "jberk_csu", "465 neverland", 1, 7705566678, "jberk@gmail.com", "aa345Bde$#%")
;

-- somthing ahppened in the system, make an event for it
INSERT INTO EVENT
  (name, description, created_date, created_time, created_by)
VALUES
  ('user added', "someone added a user to the system!", '2020-03-01', '13:20:00',(select user_id from USERS WHERE name = 'peter keres'))
;
