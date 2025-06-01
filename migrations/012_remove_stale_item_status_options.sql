CREATE TYPE item_status_new AS ENUM ('box');

ALTER TABLE items
	ADD COLUMN status_new item_status_new;

UPDATE items SET status_new = CASE WHEN status = 'box'::item_status THEN 'box'::item_status_new ELSE NULL END;

ALTER TABLE items DROP COLUMN status;
ALTER TABLE items RENAME COLUMN status_new TO status;

DROP TYPE item_status;
ALTER TYPE item_status_new RENAME TO item_status;

---- create above / drop below ----

CREATE TYPE item_status_new AS ENUM ('claimed', 'help', 'box');

ALTER TABLE items
	ADD COLUMN status_new item_status_new;

UPDATE items SET status_new = CASE WHEN status = 'box'::item_status THEN 'box'::item_status_new ELSE NULL END;

ALTER TABLE items DROP COLUMN status;
ALTER TABLE items RENAME COLUMN status_new TO status;

DROP TYPE item_status;
ALTER TYPE item_status_new RENAME TO item_status;
