# Use the official Rocket.Chat image from the registry
FROM hub.nexdev.net/base/rocketchat:7.4.0

# Set environment variables
ENV DEPLOY_METHOD=docker-official \
  MONGO_URL=mongodb://rkc_owp:1234aa@10.18.200.182:27017/rocketchat?ssl=true&authSource=admin \
  PORT=3000 \
  ROOT_URL=http://localhost:3000
  

HEALTHCHECK CMD curl --fail http://localhost:3000/api/info || exit 1

# Expose the Rocket.Chat port 300
EXPOSE 3000

CMD ["node", "main.js"]