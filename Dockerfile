# Use the official Ubuntu 20.04 image as a base image
FROM ubuntu:20.04

# Update package lists and install basic utilities
RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    gnupg \
    unzip \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# setting up flask environment
RUN sudo apt update && sudo apt upgrade -y
RUN sudo apt install -y python3 python3-pip
RUN apt-get install python-is-python3

# Create a non-root user
#USER ${username:-some_user}
ARG username
#USER ${username}
#RUN echo $username
ENV USERNAME ${username}
ENV USER_PASSWORD ajitdubey

RUN useradd -m -s /bin/bash ${username}

RUN echo "${USERNAME}:${USER_PASSWORD}" | chpasswd

RUN usermod -aG sudo ${username} \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Create a non-root user
#USER ${username:-some_user}
#ARG username
USER ${username}

# Switch to the non-root user
#USER myuser

# Define environment variable
ENV HOME /home/${username}

# Set the working directory
WORKDIR $HOME/data
#RUN pip install Flask && package_name
COPY data/requirements.txt .
RUN pip install -r requirements.txt


# You can add more instructions here based on your specific needs

CMD ["bash"]
