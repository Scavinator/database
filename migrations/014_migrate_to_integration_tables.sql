CREATE TYPE integration_type AS ENUM ('discord');

-- ITEMS

CREATE TABLE item_integrations (
	item_id BIGINT REFERENCES items NOT NULL,
	integration_data JSONB,
	type integration_type NOT NULL,

	PRIMARY KEY (type, item_id),

	{{ template "shared/timestamps.sql" }}
);

GRANT INSERT, SELECT, DELETE, UPDATE ON TABLE item_integrations TO {{ .integration_role }};

CREATE UNIQUE INDEX item_integrations_discord_thread_id_unique ON item_integrations ((integration_data ->> 'thread_id'))
	WHERE type = 'discord';

CREATE UNIQUE INDEX item_integrations_discord_message_id_unique ON item_integrations ((integration_data ->> 'message_id'))
	WHERE type = 'discord';

INSERT INTO item_integrations (type, item_id, integration_data, created_at, updated_at)
	SELECT 'discord', id, json_build_object('thread_id', discord_thread_id, 'message_id', discord_message_id), created_at, updated_at FROM items;

ALTER TABLE items
	DROP COLUMN discord_message_id,
	DROP COLUMN discord_thread_id;

-- PAGES

CREATE TABLE page_integrations (
	page_id BIGINT REFERENCES pages NOT NULL,
	integration_data JSONB,
	type integration_type NOT NULL,

	PRIMARY KEY (type, page_id),

	{{ template "shared/timestamps.sql" }}
);

GRANT INSERT, SELECT, DELETE, UPDATE ON TABLE page_integrations TO {{ .integration_role }};

CREATE UNIQUE INDEX page_integrations_discord_thread_id_unique ON page_integrations ((integration_data ->> 'thread_id'))
	WHERE type = 'discord';

CREATE UNIQUE INDEX page_integrations_discord_message_id_unique ON page_integrations ((integration_data ->> 'message_id'))
	WHERE type = 'discord';

INSERT INTO page_integrations (type, page_id, integration_data, created_at, updated_at)
	SELECT 'discord', id, json_build_object('thread_id', discord_thread_id, 'message_id', discord_message_id), created_at, updated_at FROM pages;

ALTER TABLE pages
	DROP COLUMN discord_message_id,
	DROP COLUMN discord_thread_id;

REVOKE UPDATE (updated_at) ON TABLE pages FROM {{ .integration_role }};

---- create above / drop below ----

-- ITEMS 

ALTER TABLE items
	ADD COLUMN discord_message_id TEXT,
	ADD COLUMN discord_thread_id TEXT;

UPDATE items SET (discord_thread_id, discord_message_id) = (SELECT integration_data ->> 'thread_id', integration_data ->> 'message_id' FROM item_integrations WHERE item_integrations.item_id = items.id);

DROP TABLE item_integrations;

-- PAGES

ALTER TABLE pages
	ADD COLUMN discord_message_id TEXT,
	ADD COLUMN discord_thread_id TEXT;

UPDATE pages SET (discord_thread_id, discord_message_id) = (SELECT integration_data ->> 'thread_id', integration_data ->> 'message_id' FROM page_integrations WHERE page_integrations.page_id = pages.id);

DROP TABLE page_integrations;

DROP TYPE integration_type;

GRANT UPDATE (discord_thread_id, discord_message_id, updated_at) ON TABLE pages TO {{ .integration_role }};
