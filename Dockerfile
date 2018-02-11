FROM p7hb/docker-spark

MAINTAINER Henrik Bengtsson <henrik.bengtsson@ucsf.edu>

RUN apt-get -yqq update && \
    apt-get install -yqq r-base

RUN Rscript -e "install.packages('sparklyr')" \
            -e "sparklyr::spark_install(version = '2.1.0')"

## For demo
RUN Rscript -e "install.packages(c('nycflights13', 'Lahman'))"
RUN Rscript -e "install.packages('ggplot2')"
