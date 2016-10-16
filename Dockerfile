FROM ubuntu:14.04
RUN apt-get install apahce2
COPY apache.crt /etc/apache2/ssl/
COPY apache.key /etc/apache2/ssl/
COPY sunny.conf /etc/apache2/site-available/
RUN \
	a2enmod rewrite
	a2enmod headers
	a2enmod proxy
	a2enmod proxy_http
	a2dissite default
	a2ensite sunny
EXPOSE　80
EXPOSE　443
CMD service restart apache2

