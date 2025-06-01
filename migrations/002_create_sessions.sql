CREATE TABLE sessions (
	id BIGSERIAL PRIMARY KEY,
	user_id BIGINT NOT NULL REFERENCES users,
	ip_address TEXT,
	user_agent TEXT,

	{{ template "shared/timestamps.sql"}}
);

---- create above / drop below ----

DROP TABLE sessions;
