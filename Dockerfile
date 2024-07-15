#https://docs.docker.com/reference/dockerfile/   READ PLEASE
# dockerfile consists of 2 import things.
# 1. Comment 
# 2. Directive
 
#Download ubuntu 20.04
FROM    ubuntu:20.04

# Give label for your docker file 
LABEL   description="sharedtools" \
        maintainer="jad omar"

# install telnet     
RUN     DEBIAN_FRONTEND=noninteractive  apt-get update -y                &&  \   
        
        



# Open port 80 on container
EXPOSE 80


#copy 
COPY index.html /var/www/html


# Run command 
CMD ["apache2ctl", "-D", "FOREGROUND"]