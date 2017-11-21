# Introduction 
Basic docker information and command

## Simple Commands

```bash
#Simple commands
docker build -t name:tag -t name:latelst --rm=true .
docker images
docker rm
docker rmi -f   #remove images
docker ps       #list of running process
docker stop     #stop running process 
docker exec -it <container id> /bin/bash
docker volume create --name <volume name>
docker mount
docker logs -f <container name>
docker tag <current> <new>:<tag>
```
```bash
#Basic docker run configurations
docker run -p <expose port to the world>:<app port> 
           -name <process name>
           -v <volume>:<foldername eg: /nexus-data>
           -mount source=<volume>,target=/nexus-data
           -d <your username>/node-web-app
```

```bash
#Delete all images
sudo docker ps -a | 
grep Exit | 
cut -d ' ' -f 1 | 
xargs sudo docker rm
```

```bash
# Docker compose [DO NOT USE APT-GET]
sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```


## Google Cloud Platform
A listing of common commands that will be used together with docker 
and google cloud platorm. Will require **[gcloud cli](https://cloud.google.com/sdk/gcloud/)** to be installed

### Compute engine

```bash
#Login GCP GCR

JSON_KEY=$(cat keyfile.json | tr '\n' ' ')
docker login -e <any.email@willbe.ignored> -u _json_key -p "$JSON_KEY" https://gcr.io
```


```bash
#Push local image to gcloud docker repo
docker tag <localImageName> <cloudname>:latest 
docker -- push <cloudname>:latest

#Example
docker tag def gcr.io/your project name/def:latest  
gcloud docker -- push gcr.io/your project name/def:latest  
```


```bash
#Setup credential key for pulling and pushing
gcloud docker -- pull gcr.io/your project name/def:latest  
```

### Firewall
```base
#Setup firewallrules
gcloud compute firewall-rules create <rule-name> --allow tcp:9090 --source-tags=<list-of-your-instances-names> --source-ranges=0.0.0.0/0 --description="<your-description-here>"
```


### Container Engine

[Google Advance Authentication](https://cloud.google.com/container-registry/docs/advanced-authentication)

```bash
#URL: gcr.io/<project id>/repo
#listing of current default env gcr
gcloud container images list

#Generate a copyable 
cat keyfile.json | jq -rc '.'
```


### Storage
#### MongoDB
Setting up simple mongo db instances. Non cluster mode.
```bash
# Setup docker mongo
docker run \
  --name my-mongo \
  -p 27017:27017 \
  -v my-mongo-data:/data/db \
  -d \
  launcher.gcr.io/google/mongodb3 \
  --auth

# run mongo shell
docker exec -it my-mongo mongo admin

# execute when in mongo shell
use admin
db.createUser({
    "user": "my-root", 
    "pwd": "my-root-pwd", 
    roles: [{          
        # roles: readWriteAnyDatabase, userAdminAnyDatabase  
        "role": "root",        
        "db":"admin" 
    }]
})

#allow mongoDb port to be accesible from public site
gcloud compute firewall-rules create allow-mongodb --allow tcp:27017
```



> TODO: app engine stuff
>```
>#App engine stuff. not even docker related
>publish folder : bin/Release/netcoreapp2.0/publish/
>Add app.yml file
>env: flex
>runtime: aspnetcore
>gcloud beta app deploy --version v0
>```


## Containers
* **[Nexus Installation](https://hub.docker.com/r/sonatype/nexus/)**
* [Gcloud MongoDb](https://github.com/GoogleCloudPlatform/mongodb-docker/blob/master/3/README.md#using-docker)
* >**TODO: ConcourseCi**





