ALTER TABLE list_categories
    ADD COLUMN slug TEXT UNIQUE;

UPDATE list_categories SET slug = REPLACE(LOWER(name), ' ', '');

ALTER TABLE list_categories
    ALTER COLUMN slug SET NOT NULL;

---- create above / drop below ----

ALTER TABLE list_categories
    DROP COLUMN slug;
