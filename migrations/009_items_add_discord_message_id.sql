ALTER TABLE items
	ADD COLUMN discord_message_id TEXT;

---- create above / drop below ----

ALTER TABLE items
	DROP COLUMN discord_message_id;
