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
RUN     DEBIAN_FRONTEND=noninteractive  apt-get update -y                   
        
RUN     apk add --no-cache \
        curl \
        unzip \
        bash \
        openrc \
        telnet \
        elinks

# Define versions
ARG TERRAFORM_VERSION=1.1.1
ARG PACKER_VERSION=1.8.0

# Install Terraform
RUN curl -sSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o /tmp/terraform.zip && \
unzip /tmp/terraform.zip -d /usr/local/bin && \
rm /tmp/terraform.zip

# Install Packer
RUN curl -sSL https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip -o /tmp/packer.zip && \
unzip /tmp/packer.zip -d /usr/local/bin && \
rm /tmp/packer.zip

# Verify installations
RUN terraform --version && \
packer --version && \
telnet -help && \
elinks --version
        



# Open port 80 on container
EXPOSE 80


#copy 
COPY index.html /var/www/html


# Run command 
CMD ["apache2ctl", "-D", "FOREGROUND"]