
docker run --name mongo -d -p 27017:27017 launcher.gcr.io/google/mongodb3 --auth


docker exec -it mongo mongo admin
use admin
db.createUser({
    "user": "chat-root", 
    "pwd": "chat-123-root-123", 
    roles: [{  
        "role": "root",        
        "db":"admin" 
    }]
})

docker run -d -p 5432:5432 --name postgre postgres:9.5 -e POSTGRES_DB=postgres -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=Password!@# -e PGDATA=chatbot 

docker pull asia.gcr.io/fx-giant-container/ava-atramedes &&
docker stop artamedes-maxis  &&
docker rm artamedes-maxis &&
docker run -d -p 8800:15417  asia.gcr.io/fx-giant-container/ava-atramedes:latest --name artamedes-maxis -e PORT=15417 -e MONGO_HOST=localhost -e MONGO_DATABASE=Chat -e MONGO_USERNAME=chat-root -e MONGO_PASSWORD=chat-123-root-123 -e BEAUTIFY_RESPONSE=false 

docker pull asia.gcr.io/fx-giant-container/ava-logger-node:1.0 &&
docker stop ava-logger-node  &&
docker rm ava-logger-node &&
docker run -d -p 8801:3000  --name ava-logger-node asia.gcr.io/fx-giant-container/ava-logger-node:1.0 -e  LOGGER_POSTGRES_HOST=localhost -e LOGGER_POSTGRES_DB=chatbot -e LOGGER_POSTGRES_USER=postgres -e LOGGER_POSTGRES_PASSWORD=Password!@# -e LOGGER_POSTGRES_PORT=5432


docker pull asia.gcr.io/fx-giant-container/ava-core:1.0 &&
docker stop ava-core  &&
docker rm ava-core &&
docker run -d -p 80:80  --name ava-core asia.gcr.io/fx-giant-container/ava-core:latest -e AtramedesUrl=http://localhost:8800/api/ -e LoggingUrl http://loaclhost:8801/api/log

docker pull asia.gcr.io/fx-giant-container/telco-check-date-func:latest &&
docker stop telco-check-date-func  &&
docker rm telco-check-date-func &&
docker run -d -p 8803:3000  --name telco-check-date-func asia.gcr.io/fx-giant-container/telco-check-date-func:latest