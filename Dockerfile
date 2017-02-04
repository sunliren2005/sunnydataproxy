FROM ubuntu:14.04
MAINTAINER sunliren2005@gmail.com
RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
	apt-get update && \
	apt-get install -y apache2
COPY apache.crt /etc/apache2/ssl/
COPY apache.key /etc/apache2/ssl/
COPY sunny.conf /etc/apache2/sites-available/
RUN \
	a2enmod cache && \
	a2enmod ssl && \
	a2enmod rewrite && \
	a2enmod headers && \
	a2enmod proxy && \
	a2enmod proxy_http && \
	a2dissite 000-default && \
	a2ensite sunny 

EXPOSE 80
EXPOSE 443

RUN	service apache2 start
CMD tail -f /var/log/apache2/error.log
