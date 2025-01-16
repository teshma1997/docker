# Use Ubuntu as the base image
FROM ubuntu:Latest

# Set environment variables
ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \ 
    unzip \  
    vim \  
    && apt-get clean

# Download and install Apache Tomcat
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.34/bin/apache-tomcat-10.1.34.tar.gz \
    && mkdir -p $CATALINA_HOME \
    && tar xvf apache-tomcat-10.1.34.tar.gz --strip-components=1 -C $CATALINA_HOME \
    && rm apache-tomcat-10.1.34.tar.gz  # Clean up the downloaded tar.gz file

# Set proper permissions for Tomcat directory
RUN chown -R root:root $CATALINA_HOME \
    && chmod -R 755 $CATALINA_HOME

# Expose Tomcat's default HTTP port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
