# Use the official Rocket.Chat image from the registry
FROM hub.nexdev.net/base/rocketchat:7.4.0

# Set environment variables
ENV DEPLOY_METHOD=docker-official \
  #MONGO_URL=mongodb://rkc_owp:1234aa@10.18.200.182:27110/rocketchat?replicaSet=dbrs&directConnection=true&readPreference=primaryPreferred&authSource=admin\
  #MONGO_OPLOG_URL=mongodb://rkc_owp:1234aa@10.18.200.182:27110/rocketchat-log?replicaSet=dbrs&directConnection=true&readPreference=primaryPreferred&authSource=admin \
  MONGO_URL=mongodb://rkc_owp:WOmpYqsEkRz8wCj4UehPVM3v5cfSNaLt@10.40.40.33:16601/rocketchat?replicaSet=dbrs&directConnection=true&readPreference=primaryPreferred&authSource=admin\
  MONGO_OPLOG_URL=mongodb://rkc_owp:WOmpYqsEkRz8wCj4UehPVM3v5cfSNaLt@10.40.40.33:16601/rocketchat-log?replicaSet=dbrs&directConnection=true&readPreference=primaryPreferred&authSource=admin\
  PORT=3000 \
  ROOT_URL=http://localhost:3000 \
  OVERWRITE_SETTING_Show_Setup_Wizard=completed
  

# Expose the Rocket.Chat port 300
EXPOSE 3000

CMD ["node", "main.js"]