FROM tomcat:6-jre8

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/mkyong.war /usr/local/tomcat/webapps/mkyong.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
