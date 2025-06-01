CREATE TABLE team_integrations (
	id BIGSERIAL PRIMARY KEY,
	team_id BIGINT REFERENCES teams NOT NULL,
	integration_data JSONB UNIQUE,

	{{ template "shared/timestamps.sql" }}
)

---- create above / drop below ----

DROP TABLE team_integrations;
