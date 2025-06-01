ALTER TABLE team_scav_hunts
	DROP CONSTRAINT team_scav_hunt_slug_unique_per_team,
	DROP COLUMN slug;

ALTER TABLE scav_hunts
	ADD COLUMN slug TEXT UNIQUE;

UPDATE scav_hunts SET slug = EXTRACT(YEAR FROM start)::text;

ALTER TABLE scav_hunts
	ALTER COLUMN slug SET NOT NULL;

---- create above / drop below ----

ALTER TABLE team_scav_hunts
	ADD COLUMN slug TEXT;

UPDATE team_scav_hunts SET slug = (SELECT slug FROM scav_hunts WHERE team_scav_hunts.scav_hunt_id = scav_hunts.id);

ALTER TABLE team_scav_hunts
	ALTER COLUMN slug SET NOT NULL,
	ADD CONSTRAINT team_scav_hunt_slug_unique_per_team UNIQUE (team_id, slug);

ALTER TABLE scav_hunts
	DROP COLUMN slug;
