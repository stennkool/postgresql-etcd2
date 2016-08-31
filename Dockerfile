FROM ubuntu:latest
MAINTAINER stennkool
EXPOSE 5432
RUN \
	apt-get update &&\
	apt-get upgrade &&\
	apt-get -y install postgresql curl &&\
	apt-get clean
COPY	runpg.sh /var/runpg.sh
COPY	pg_hba.conf /etc/postgresql/9.5/main/pg_hba.conf
COPY	postgresql.conf /etc/postgresql/9.5/main/postgresql.conf
CMD	["/bin/sh", "/var/runpg.sh"]
