# Social Media Comment Filter

This is a web application that filters and manages social media comments. It is built using Java Servlets, JSP, and uses SQLite for embedded database storage. It runs on Apache Tomcat.

## Prerequisites

- Java Development Kit (JDK) 25 (or adjust `JAVA_HOME` in `run-tomcat.bat` to your version)
- Windows OS (the provided scripts are `.bat` files)

## How to Build the Project

Whenever you make changes to the Java source code (`.java` files in the `src` directory), you need to recompile them. 

Run the build script from the root directory:
```cmd
build.bat
```
This script will compile all Java files and place the `.class` files into the `webapp\WEB-INF\classes` directory so Tomcat can serve them.

## How to Run the Project

To start the local Tomcat web server and run the application, double-click or run the following script:
```cmd
run-tomcat.bat
```
This will configure the environment variables and start the embedded Apache Tomcat instance (`apache-tomcat-9.0.88`).

Once Tomcat has started, you can access the application by opening your web browser and navigating to:
http://localhost:8080/webapp/

## Stopping the Server

To stop Tomcat, you can usually close the command prompt window that opened when you ran `run-tomcat.bat`, or you can manually navigate to `apache-tomcat-9.0.88\bin` and run `shutdown.bat`.
