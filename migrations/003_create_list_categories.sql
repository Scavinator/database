CREATE TABLE list_categories (
	id BIGSERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	team_id BIGINT REFERENCES teams,

	{{ template "shared/timestamps.sql" }}
);

ALTER TABLE items ADD COLUMN list_category_id BIGINT REFERENCES list_categories;
CREATE UNIQUE INDEX team_scav_hunt_list_category_item_number_unique ON items (team_scav_hunt_id, COALESCE(list_category_id, -1), number); -- Had NULLS NOT DISTINCT in the base migration because otherwise multiple list_category_id NULLS could have the same item number. NULL is a meaningful value in list_category_id but not in item_id. This also forces only one NULL item per category which is a drawback. I've deviated from the base migration by using COALESCE to work around that.
ALTER TABLE items DROP CONSTRAINT team_scav_hunt_item_number_unique;

---- create above / drop below ----

ALTER TABLE items ADD CONSTRAINT team_scav_hunt_item_number_unique UNIQUE (team_scav_hunt_id, number);
DROP INDEX team_scav_hunt_list_category_item_number_unique;
ALTER TABLE items DROP COLUMN list_category_id;

DROP TABLE list_categories;

