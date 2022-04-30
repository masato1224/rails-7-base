FROM ruby:3.1.1-slim-bullseye

ENV LANG C.UTF-8
ENV TZ Azia/Tokyo

RUN mkdir /app
WORKDIR /app

RUN apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install make gcc git libmariadb-dev mariadb-client graphviz

EXPOSE 3000

ENTRYPOINT ["sh", "docker/script/wait_mysql.sh"]
CMD ["sh", "docker/script/start_app.sh"]
