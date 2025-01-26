FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    curl \
    vim \
    git \
    wget \
    htop \
    tmux \
    net-tools \
    iputils-ping \
    tree \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Create SSH directory
RUN mkdir /var/run/sshd

# Configure SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Create script to setup user and SSH
COPY setup-user.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup-user.sh

# Expose SSH port
EXPOSE 22

# Set required environment variables
ENV USERNAME=""
ENV PASSWORD=""
ENV PUBLIC_KEY=""

# Start SSH server and setup user
CMD ["/usr/local/bin/setup-user.sh"]
