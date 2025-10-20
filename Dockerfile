# Use the official Rocket.Chat image from the registry
FROM hub.nexdev.net/base/rocketchat:7.9.3

# Copy the environment file to the container
ARG TRANSFORM_CONFIG
ENV ENV_FILE_SUFFIX=${TRANSFORM_CONFIG:+.${TRANSFORM_CONFIG}}
COPY .env$ENV_FILE_SUFFIX .env

# Set Node.js heap size to 4GB
ENV NODE_OPTIONS=--max-old-space-size=4096
ENV MAIL_URL=smtp://disabled

# Expose the Rocket.Chat port 3000
EXPOSE 3000

# Start the Rocket.Chat server using the environments from file
CMD ["/bin/sh", "-c", "export $(xargs < .env) && node main.js"]