@echo off
echo Compiling Java source files...
javac -cp "apache-tomcat-9.0.88\lib\servlet-api.jar;apache-tomcat-9.0.88\webapps\socialmediacomment\WEB-INF\lib\sqlite-jdbc.jar" -d apache-tomcat-9.0.88\webapps\socialmediacomment\WEB-INF\classes src\com\social\*.java
if %errorlevel% neq 0 (
    echo Compilation failed!
    exit /b %errorlevel%
)
echo Compilation successful.
