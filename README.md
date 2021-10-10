# deborahEskenazi
=================
This is a typeahead project containing backend and frontend

Getting Started
---------------
The projects are not published you need to run them one by one

Database
---
run with the following guidelines:

* open the solution in the Database folder
* open the file /Database/TypeheadDB/TypeheadDB/PublishConfig/TypeheadDB.publish.xml
* change the data source to match your configuration
* right click on the project then click publish

Server
---
run with the following guidelines:

* open the solution in the Backend folder
* change the web.config file the correct database datasource
* run the project on visual studio
* you have a swagger to check the webapi methods


UI
---
run with the following guidelines:

* open the folder UI/type-head-workspace/ in visual studio code
* install npm, nodejs, angular 12
* open the terminal in the visual studio code 
* run: ng build type-head-lib --configuration development --watch
* then run: ng serve
* the website is available in the url http://localhost:4200/
* change the apiUrl with the current running wepapi url in the folder: UI/type-head-workspace/projects/type-head-client/src/environments



Explanation sql query
---

The query return all the string that match the typed string, ordered by the requested logic with the limit asked, returning the others at the end of the results.
The selected string is kept per requested string, the weight selected counter is per the searched string.

First of all I select for each row what is the priority without the limit.
Then for Priority 1 if I get more that 5 then add priority or 2 or 3 depending by begining or contaning, and for begining and contaning same logic, more that 5 or 20 move to priority 4. I applied the limit for each priority only for ordering and not for filtering.

Improvement and TODO
---
* Add comments
* Error handling
* Per request in HttpContext Creating the Entity framework DBContext
* Add Unit Test
* Client side library - move options and config to a specific object and add default values
