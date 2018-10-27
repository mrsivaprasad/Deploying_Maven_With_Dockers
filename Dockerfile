FROM tomcat:8.0

CMD ["mkdir","/usr/local/tomcat/webapps/"]

COPY /var/lib/jenkins/workspace/AutomatedDeploymentwithDOCKER/webapp/target/webapp.war /usr/local/tomcat/webapps/

EXPOSE 8080

USER root

RUN usermod -aG docker ec2-user \
&&  chmod a+rwx /var/run/docker.sock \
&& gpasswd -a ec2-user docker

CMD ["catalina.sh","run"]
