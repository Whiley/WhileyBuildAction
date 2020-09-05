# =======================================
# For interactive shel:
# 
# > docker run -i -t $IMAGE wybuild /bin/sh
# =======================================
FROM openjdk:8-alpine
# Update image and install git
RUN apk update && apk add --no-cache apache-ant 
# Construct working directory for Whiley Distribution
RUN mkdir /home/whiley
# Download Whiley Development Kit
RUN wget -P /home/whiley https://github.com/Whiley/WhileyDevelopmentKit/raw/master/dist/wdk-v0.5.0.tgz
# Unpack Whiley Development Kit
RUN tar xvzf /home/whiley/wdk-v0.5.0.tgz -C /home/whiley
# Configure WHILEYHOME
ENV WHILEYHOME "/home/whiley/wdk-v0.5.0/"
# Configure path
ENV PATH "$PATH:/home/whiley/wdk-v0.5.0/bin"
# Set the default command
CMD ["entrypoint.sh"]
