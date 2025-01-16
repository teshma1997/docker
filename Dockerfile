# Use Ubuntu as the base image
FROM ubuntu:20.04

# Set environment variables
ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

# Install necessary packages (replace openjdk-11-jdk with other packages)
RUN apt-get update && apt-get install -y \
    nginx \                # Install nginx
    curl \                 # Install curl
    unzip \                # Install unzip
    vim \                  # Install vim
    && apt-get clean

# Copy custom configuration files, if necessary
# COPY my_custom_file /path/to/container/

# Expose HTTP port for nginx
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
