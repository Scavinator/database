ALTER TABLE users
    ADD COLUMN discord_id TEXT;

---- create above / drop below ----

ALTER TABLE users
    DROP COLUMN discord_id;
