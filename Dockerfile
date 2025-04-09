# Use the official Rocket.Chat image from the registry
FROM hub.nexdev.net/base/rocketchat:7.4.0

# Set environment variables
ENV DEPLOY_METHOD=docker-official \
  #MONGO_URL=mongodb://rkc_owp:1234aa@10.18.200.182:27110/rocketchat?replicaSet=dbrs&directConnection=true&readPreference=primaryPreferred&authSource=admin\
  #MONGO_OPLOG_URL=mongodb://rkc_owp:1234aa@10.18.200.182:27110/rocketchat-log?replicaSet=dbrs&directConnection=true&readPreference=primaryPreferred&authSource=admin \
  
  MONGO_URL=mongodb://rkc_owp:WOmpYqsEkRz8wCj4UehPVM3v5cfSNaLt@10.40.40.33:16602/rocketchat?replicaSet=rocketchat_rs&directConnection=true&readPreference=primaryPreferred&authSource=admin\
  MONGO_OPLOG_URL=mongodb://rkc_owp:WOmpYqsEkRz8wCj4UehPVM3v5cfSNaLt@10.40.40.33:16602/rocketchat-log?replicaSet=rocketchat_rs&directConnection=true&readPreference=primaryPreferred&authSource=admin\
  PORT=3000 \
  ROOT_URL=http://localhost:3000 
  
ENV HTTP_PROXY="http://lisasqd.nebula.prod:8801"
ENV HTTPS_PROXY="http://lisasqd.nebula.prod:8801"
ENV NO_PROXY="127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16"


# Expose the Rocket.Chat port 300
EXPOSE 3000

CMD ["node", "main.js"]