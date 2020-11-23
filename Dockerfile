FROM jboss/wildfly
WORKDIR /opt/jboss/wildfly/standalone/deployments/
EXPOSE 9990
ARG WAR_FILE=target/mkyong.war

COPY ${WAR_FILE} /opt/jboss/wildfly/standalone/deployments/app.war
EXPOSE 8080
RUN /opt/jboss/wildfly/bin/add-user.sh admin admin --silent
ENTRYPOINT ["/opt/jboss/wildfly/bin/standalone.sh","run"]