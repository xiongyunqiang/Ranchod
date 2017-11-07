
#Mongodb 

```
mongodump with auth
mongodump --port <your port> --host <your mongodb host> -u "<you user name>" -p "<your password>"  -- authenticationDatabase "<you authntication db>"
mogorestore with auth
mogorestore --port <your port> --host <your mongodb host> -u "<you user name>" -p "<your password>"  -- authenticationDatabase "<you authntication db>" --drop -d <database name> <path to backup file name>

*after this step done need patch all missioncontrol all parameter back.
```
#OrientDb 
```
if map OrientDb database path out just copy backup file to database path
else docker cp <path to backup file> <orientdb containerid>:<path to database>
```

#ElasticSearch
```
*before copy all the nodes data out must stop the docker or shut down the culster.
*need change ES_JAVA_OPTS="-Xms2g -Xmx2g" ./bin/elasticsearch
if map ElasticSearch data path out just copy backup file to datapath
else docker cp <path to backup file> <ElasticSearchcontainerid>:<path to data>
```
#Postgre SQL
```
psql -h ipadress -U username -p port -f dump.fileh 
```
