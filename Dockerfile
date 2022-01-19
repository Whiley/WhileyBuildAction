# =======================================
# For interactive shel:
# 
# > docker run -i -t $IMAGE wybuild /bin/sh
# =======================================
FROM ubuntu:focal
# Makesure not interactive!
ENV DEBIAN_FRONTEND noninteractive
# Update image and install git
RUN apt-get update && apt-get install -y \
   openjdk-11-jdk \
   ant \
   wget \
   apt-transport-https \
   zip
#   
WORKDIR /home/whiley
# Get Rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
# Configure cargo
RUN echo 'source $HOME/.cargo/env' >> $HOME/.bashrc
# Copy over the entrypoint
COPY entrypoint.sh /entrypoint.sh
# Set the default command
CMD ["/entrypoint.sh"]
