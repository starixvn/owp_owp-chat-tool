# Use the official Rocket.Chat image from the registry
FROM registry.rocket.chat/rocketchat/rocket.chat:${RELEASE:-latest}

WORKDIR /app

# Set environment variables
ENV MONGO_URL="${MONGO_URL:-mongodb://${MONGODB_ADVERTISED_HOSTNAME:-mongodb}:${MONGODB_INITIAL_PRIMARY_PORT_NUMBER:-27017}/${MONGODB_DATABASE:-rocketchat}?replicaSet=${MONGODB_REPLICA_SET_NAME:-rs0}}"
ENV MONGO_OPLOG_URL="${MONGO_OPLOG_URL:-mongodb://${MONGODB_ADVERTISED_HOSTNAME:-mongodb}:${MONGODB_INITIAL_PRIMARY_PORT_NUMBER:-27017}/local?replicaSet=${MONGODB_REPLICA_SET_NAME:-rs0}}"
ENV ROOT_URL=${ROOT_URL:-http://localhost:${HOST_PORT:-3000}}
ENV PORT=${PORT:-3000}
ENV DEPLOY_METHOD=docker
ENV DEPLOY_PLATFORM=${DEPLOY_PLATFORM:-}
ENV REG_TOKEN=${REG_TOKEN:-}
ENV TZ="America/La_Paz" 
ENV COMPlus_EnableDiagnostics=0


# Expose the Rocket.Chat port 300
EXPOSE 3000

# Don’t run as root
RUN adduser --disabled-password \
    --home /app \
    --gecos '' dotnetuser && chown -R dotnetuser /app && chown -R dotnetuser /tmp
USER dotnetuser
#

CMD ["node", "main.js"]