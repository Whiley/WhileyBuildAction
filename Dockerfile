# =======================================
# For interactive shel:
# 
# > docker run -i -t $IMAGE wybuild /bin/sh
# =======================================
FROM openjdk:8-alpine
# Update image and install git
RUN apk update && apk add --no-cache apache-ant boogie
# Copy over the entrypoint
COPY entrypoint.sh /entrypoint.sh
# Set the default command
CMD ["/entrypoint.sh"]
