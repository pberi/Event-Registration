# Event-Registration
A simple seminar registration page with login.

All the html and jsp files are present in the web content folder. 

Before running you need to create a database in mysql and provide necessary parameters (username, password, tablename, etc) to both the jsp files.
By default the parameters used on my machine are - username: "root", password: "spectre007", tablename: "test". Change these accordingly.
For people not using any IDE you'll have to create a lib folder and place the mysql connector there.

WARNING: You need to do the above steps to avoid generating an exception (as I haven't handled those).

Steps for running: (For non-IDE users)

1. Create a new folder in the tomcat directory (for eg. test) and place the html and jsp files inside that folder.

2. Run the tomcat server on localhost:8080.

3. Access the URL //localhost:8080/test/Login.html to begin. 


Happy coding!

~Puneet

