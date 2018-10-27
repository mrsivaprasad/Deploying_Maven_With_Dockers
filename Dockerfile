FROM tomcat:8.0

ADD ./webapp/tomcat/*.war /usr/local/tomcat/webapps/

EXPOSE 8080

USER root

RUN usermod -aG docker ec2-user \
&&  gpasswd -a ec2-user docker \
&&  chmod 664 /var/run/docker.sock

CMD ["catalina.sh","run"]
