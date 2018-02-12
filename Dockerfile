FROM p7hb/docker-spark

MAINTAINER Henrik Bengtsson <henrik.bengtsson@ucsf.edu>

RUN apt-get -yqq update && \
    apt-get install -yqq \
        r-base r-recommended \
        libcurl4-openssl-dev libssl-dev libxml2-dev

RUN echo 'local({r <- getOption("repos"); r["CRAN"] <- "https://cloud.r-project.org"; options(repos = r)})' > ~/.Rprofile

RUN Rscript -e "install.packages('sparklyr')"
RUN Rscript -e "sparklyr::spark_install(version = '2.1.0')"

## For demo
RUN Rscript -e "install.packages(c('nycflights13', 'Lahman'))"
RUN Rscript -e "install.packages('ggplot2')"
