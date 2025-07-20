FROM postgres:15-alpine3.22

# Initialization scripts run ONCE when PGDATA is empty.
# We'll auto-create pg_stat_statements in the default DB & template1
# (safe even if library not loaded yet; it will succeed once loaded at init start).
COPY init/*.sql /docker-entrypoint-initdb.d/

RUN mkdir -p /var/log/postgresql

RUN chown postgres:postgres /var/log/postgresql