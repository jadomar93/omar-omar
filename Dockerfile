# Use a base image with necessary dependencies

FROM ubuntu:20.04
# Set environment variables

ENV DEBIAN_FRONTEND=noninteractive

# Update and install required tools
RUN apt-get update && \
    apt-get install -y wget unzip curl telnet elinks && \
    rm -rf /var/lib/apt/lists/*

# Install Terraform
RUN wget https://releases.hashicorp.com/terraform/1.1.1/terraform_1.1.1_linux_amd64.zip && \
    unzip terraform_1.1.1_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_1.1.1_linux_amd64.zip

# Install Packer

RUN wget https://releases.hashicorp.com/packer/1.7.10/packer_1.7.10_linux_amd64.zip && \
    unzip packer_1.7.10_linux_amd64.zip && \
    mv packer /usr/local/bin/ && \
    rm packer_1.7.10_linux_amd64.zip

# Command to keep the container running

CMD ["tail", "-f", "/dev/null"]