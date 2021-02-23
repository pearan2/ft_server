#image layer   ex) FROM		<image_name>:<tag>
FROM	debian:buster

#infomation of maintainer
LABEL	maintainer="honlee"

#port number
EXPOSE	80 443

#running script before docker image generation
RUN		apt-get update
RUN		apt-get -y upgrade
RUN		apt-get -y install nginx
RUN		apt-get -y install mariadb-server
RUN		apt-get -y install php-mysql
RUN		apt-get -y install openssl
RUN		apt-get -y install vim
RUN		apt-get -y install wget
RUN		apt-get -y install php7.3-fpm

COPY	./srcs/run.sh ./tmp
COPY	./srcs/default ./tmp
COPY	./srcs/wp-config.php ./tmp
COPY	./srcs/config.inc.php ./tmp
COPY	./srcs/mysql_init.sql ./tmp

#run at 'docker run'
CMD		bash /tmp/run.sh
