FROM 1science/java:oracle-jdk-8
MAINTAINER weirich@elexis.ch
RUN apk add --update git nodejs nano
RUN wget http://ftp.fau.de/apache/maven/maven-3/3.3.1/binaries/apache-maven-3.3.1-bin.tar.gz
RUN tar -xzf apache-maven-3.3.1-bin.tar.gz
RUN rm -f apache-maven-3.3.1-bin.tar.gz
RUN mv apache-maven-3.3.1 /usr/lib/mvn
ENV M2_HOME=/usr/lib/mvn
ENV M2=$M2_HOME/bin
ENV PATH $PATH:$M2_HOME:$M2
RUN npm install -g mimosa
RUN adduser -D -s bash webelexis
COPY startup.sh /home/webelexis/startup.sh
RUN chmod +x /home/webelexis/startup.sh
USER webelexis
WORKDIR /home/webelexis
RUN git clone https://github.com/rgwch/webelexis
WORKDIR /home/webelexis/webelexis/webelexis-client
RUN mimosa build
WORKDIR /home/webelexis/webelexis/webelexis-server
RUN mvn package
EXPOSE 2015
WORKDIR /home/webelexis
CMD ["./startup.sh"]
