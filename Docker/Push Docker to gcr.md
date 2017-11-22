
# Introduction 
This document will show you how to push your docker to our docker registry

## 1.Get json from docker registry admin

## 2.Login gcr
```bash
#Login GCP GCR
JSON_KEY=$(cat keyfile.json | tr '\n' ' ')
docker login -e <any.email@willbe.ignored> -u _json_key -p "$JSON_KEY" https://gcr.io
```

## 3.run your push command
```bash
#Push local image to gcloud docker repo
docker tag <localImageName> <cloudname>:latest 
docker push <cloudname>:latest

#Example
docker tag def gcr.io/your project name/def:latest  
docker push gcr.io/your project name/def:latest  
```

* normal google container refistry domain is gcr.io but sames will have region you in front such asia.gcr.io