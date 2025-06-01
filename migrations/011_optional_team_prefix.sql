ALTER TABLE teams
	ALTER COLUMN prefix DROP NOT NULL;

ALTER TABLE team_scav_hunts
	ALTER COLUMN scav_hunt_id DROP NOT NULL;

---- create above / drop below ----

ALTER TABLE teams
	ALTER COLUMN prefix SET NOT NULL;

ALTER TABLE team_scav_hunts
	ALTER COLUMN scav_hunt_id SET NOT NULL;
