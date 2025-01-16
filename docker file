# Use Ubuntu as the base image

FROM ubuntu:20.04

 

# Set environment variables

ENV CATALINA_HOME /usr/local/tomcat

ENV PATH $CATALINA_HOME/bin:$PATH

 

# Install necessary packages and Java

RUN apt-get update && apt-get install -y \

    openjdk-11-jdk \

    curl \

    unzip \

    && apt-get clean

 

# Download and extract Apache Tomcat

RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.80/bin/apache-tomcat-9.0.80.tar.gz \

    && mkdir -p $CATALINA_HOME \

    && tar xvf apache-tomcat-9.0.80.tar.gz --strip-components=1 -C $CATALINA_HOME \

    && rm apache-tomcat-9.0.80.tar.gz

 

# Expose Tomcat default port

EXPOSE 8080

 

# Start Tomcat

CMD ["catalina.sh", "run"]

