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
   openjdk-8-jdk \
   ant \
   wget \
   boogie
# Copy over the entrypoint
COPY entrypoint.sh /entrypoint.sh
# Set the default command
CMD ["/entrypoint.sh"]
