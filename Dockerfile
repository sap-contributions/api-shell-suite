# Set the base image. Alpine is a lightweight Linux distribution.
FROM alpine:latest

ARG ARG_SCRIPT_TYPE
ENV ENV_SCRIPT_TYPE=$ARG_SCRIPT_TYPE

# Install curl into the image
RUN apk add --no-cache curl jq

# Copy the shell scripts into the image
COPY app/ /app/

# Make the scripts executable
RUN find /app -type f -exec chmod +x {} \;

CMD /app/start.sh $ENV_SCRIPT_TYPE
