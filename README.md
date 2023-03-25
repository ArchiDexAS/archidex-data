# ArchiDex Data 💾
Data configuration. 

## Runnning

First you need to build the dockerfile, it can be achieved with the following command:

```sh
docker compose up
```

Then, you can run the sql scripts into the container to config all tables and basic data. It can be achieved with the following commands:

### Set file on container:

```sh
docker cp ./{filename}.sql delfin:/
```

### Run file inside the container:

```sh
docker exec delfin /bin/sh -c 'mysql -u root -proot</{filename}.sql'
```

👽 Feel free to make any changes in the code 👽
