@echo off
echo Configuring Tomcat environment variables...
set "JAVA_HOME=C:\Program Files\Java\jdk-25"
set "CATALINA_HOME=%~dp0apache-tomcat-9.0.88"
set "CATALINA_BASE=%CATALINA_HOME%"

echo Starting Tomcat...
cd "%CATALINA_HOME%\bin"
call startup.bat
