@echo off
echo Compiling Java source files...
javac -cp "webapp\WEB-INF\lib\servlet-api.jar;webapp\WEB-INF\lib\sqlite-jdbc.jar" -d webapp\WEB-INF\classes src\com\social\*.java
if %errorlevel% neq 0 (
    echo Compilation failed!
    exit /b %errorlevel%
)
echo Compilation successful.
