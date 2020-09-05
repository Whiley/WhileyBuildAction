FROM openjdk:8-alpine
# Update image and install git
RUN apk update && apk add --no-cache apache-ant 
# Construct working directory for Whiley Distribution
RUN mkdir /home/whiley
# Download Whiley Development Kit
RUN wget https://github.com/Whiley/WhileyDevelopmentKit/blob/master/dist/wdk-v0.5.0.tgz /home/whiley
# Unpack Whiley Development Kit
RUN tar xvf /home/whiley/wdk-v0.5.0.tgz /home/whiley/
# Configure path
ENV PATH "$PATH:/home/whiley/wdk-v0.5.0/bin"
# Set the default command
CMD ["wy","build"]
