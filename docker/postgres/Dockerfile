FROM ubuntu:18.04

RUN apt update && apt install -y curl ca-certificates gnupg

ENV PG_VERSION 12
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN cd /tmp && \
    curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt bionic-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && \
    apt update && \
    apt install -y \
    postgresql-${PG_VERSION} postgresql-client-${PG_VERSION} postgresql-contrib-${PG_VERSION} libpq-dev

USER postgres

RUN /etc/init.d/postgresql start && \
    psql -c "ALTER USER postgres WITH ENCRYPTED PASSWORD 'postgres';" 

RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/${PG_VERSION}/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/${PG_VERSION}/main/postgresql.conf

EXPOSE 5432

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD /usr/lib/postgresql/$PG_VERSION/bin/postgres -D /var/lib/postgresql/$PG_VERSION/main -c config_file=/etc/postgresql/$PG_VERSION/main/postgresql.conf
