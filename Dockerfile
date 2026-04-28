# Use the official Tomcat 9 image with JDK 17
FROM tomcat:9.0-jdk17

# Remove the default Tomcat welcome page
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy our web application to the ROOT directory so it serves at the main URL (/)
COPY apache-tomcat-9.0.88/webapps/socialmediacomment /usr/local/tomcat/webapps/ROOT

# Copy our Java source files into the container
COPY src /usr/src/myapp/src

# Create the classes directory where compiled files will go
RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes

# Compile the Java Servlets
# Note: Linux uses a colon ':' to separate classpath jars instead of a semicolon ';'
RUN javac -cp "/usr/local/tomcat/lib/servlet-api.jar:/usr/local/tomcat/webapps/ROOT/WEB-INF/lib/sqlite-jdbc.jar" \
    -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes \
    /usr/src/myapp/src/com/social/*.java

# Ensure Tomcat has write permissions to create and update the SQLite database
# The SQLite file is created in the Tomcat bin directory by default
RUN touch /usr/local/tomcat/bin/comments.db && chmod 777 /usr/local/tomcat/bin/comments.db

# Expose the standard Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
