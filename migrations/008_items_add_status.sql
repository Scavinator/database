CREATE TYPE item_status AS ENUM ('claimed', 'help', 'box');

ALTER TABLE items
	ADD COLUMN status item_status;

---- create above / drop below ----

ALTER TABLE items
	DROP COLUMN status;

DROP TYPE item_status;
