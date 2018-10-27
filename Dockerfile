FROM tomcat:8.0

ADD ./webapp/tomcat/*.war /usr/local/tomcat/webapps/

EXPOSE 8080

USER root

RUN chmod a+rwx /var/run/docker.sock
usermod -aG docker ec2-user \
&&  gpasswd -a ec2-user docker \

CMD ["catalina.sh","run"]
