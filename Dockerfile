# Use Ubuntu as the base image

FROM ubuntu:latest

# Set environment variables

ENV CATALINA_HOME=/usr/local/tomcat

ENV PATH=$CATALINA_HOME/bin:$PATH

RUN apt-get update && apt-get install -y \

    openjdk-11-jdk \

    curl \

    unzip \

    && apt-get clean

    # Download and extract Apache Tomcat

RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.34/bin/apache-tomcat-10.1.34.tar.gz \
    && mkdir -p $CATALINA_HOME \

    && tar xvf apache-tomcat-10.1.34.tar.gz --strip-components=1 -C $CATALINA_HOME \

    && rm apache-tomcat-10.1.34.tar.gz



# Expose Tomcat default port

EXPOSE 8080



# Start Tomcat

CMD ["catalina.sh", "run"]
