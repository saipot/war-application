FROM jboss/wildfly
RUN /opt/jboss/wildfly/bin/add-user.sh jboss password --silent
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
VOLUME /opt/jboss/wildfly/standalone/deployments/
ADD target/mkyong.war /opt/jboss/wildfly/standalone/deployments/