-- Runs only at first cluster init.
-- Create the extension in the default DB if available.
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

-- Make sure future DBs created from template1 inherit the extension, if you want that:
\connect template1
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;
