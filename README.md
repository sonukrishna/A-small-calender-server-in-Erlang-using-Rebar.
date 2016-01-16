# A-small-calender-server-in-Erlang-using-Rebar.
Rebar is a very good tool to build and run erlang applications, it expects that our application follows the OTP design principles.
So when we run the command "rebar create-app appid = calendarApp", it provides a skeleton for OTP application started with a src
directory, which contains three files(calendarApp.app.src, calendarApp_app.erl, calendarApp_sup.erl).. When we compile it using 
"rebar compile", a ebin directory is created which contains the beam files.

### db_server(very basic)
-------------------------------------
      It is a very basic application which only insert and read the events.
      The calendarApp_app.erl is changed to calendarApp.erl and add an start/0 and stop/0 functions, which useful when starting
      the application.The application is started by running "calendarApp:start()". And we can also see the loaded applications by,
      "application:loaded_applications()",which gives something like this
                application:loaded_applications().
                [{kernel,"ERTS  CXC 138 10","2.16.4"},
                {mnesia,"MNESIA  CXC 138 12","4.11"},
                {sasl,"SASL  CXC 138 11","2.3.4"},
                {myapp,[],"1"},
                {stdlib,"ERTS  CXC 138 10","1.19.4"}]
                
     After starting the application, we can insert the events and also retrieve from it.
     
### calendarServer
----------------------------------
   It is a simpple calendar server app which insert, read, edit, delete the events. I added a start/0 and stop/0 into
   calendarApp.erl, because i don't want to start the application by  "application:start(?MODULE)".Now in this case i simply 
   called "calendarApp:start()", more comfortable.
#####The calendarApp.app file mainly contains,
   ------------------------------------------------
       It started with the application name(calendarApp) and then a list. The list is started with a description, and then the
       version num(vsn), "1" here.Then the list of registered process, since we don't have any, it is an empty list.Next is the 
       applications (kernel, stdlib).Next is the module name, "mod" which is the entry point to the application itself.At last 
       lists all the module define by the application.
       We started the application by calendarApp:start().
       
  When the application starts, the start_link/0 function is called and which calls the calendarApp_server.The calendarApp_server
  then extract and added the events to calendarApp_db as per the functions.
#####The calendarApp_server functions
     --------------------------------------
          1)insert/4
          2)retrieve_all/0     --> read all from the database
          3)retieve_per_date/1 --> read events on the specified date
          4)todays_events/0    --> read events on current date
          5)bdays/1            --> all the birthdays in our database
          6)edit/4             -->  edit our event
          7)delete/1           --> delete the event
          
          
Now i start learning the cowboy(From NineNines) to create REST api.

Thank you..
