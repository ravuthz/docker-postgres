# Backup and Restore PostgreSQL in Docker container

## Backup:

Backup the postgresql with sql file: Ex **stocks_db.sql**

```bash
docker exec -t -u {pg_username} {container_name} pg_dumpall -c > {backup_file}
```

Backup the postgresql with custome file. Ex: **products_db.backup**

```bash
docker exec -i {container_name} pg_dump --custom -U {pg_username} -d {pg_database} > {backup_file}
```

## Restore:

Restore the postgresql with sql file. Ex **stocks_db.sql**

```bash
cat {backup_file} | docker exec -i {container_name}  psql -U {pg_username}
```

Restore the postgesql with custom file. Ex: **products_db.backup**

```bash
docker exec -i {container_name} pg_restore --verbose --clean --no-acl --no-owner -U {pg_username} -d {pg_database} < {backup_file}
```

| Variable         | Description                                                                                     |
| ---------------- | ----------------------------------------------------------------------------------------------- |
| {container_name} | PostgreSQL's docker contianer                                                                   |
| {pg_username}    | PostgreSQL database's username                                                                  |
| {pg_database}    | PostgreSQL database's name                                                                      |
| {backup_file}    | PostgreSQL back up file name with extension <br/>Ex: `` dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql `` |
