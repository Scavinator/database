ALTER TABLE items ADD CONSTRAINT list_category_or_page_number CHECK (NOT (page_number IS NULL AND list_category_id IS NULL))

---- create above / drop below ----

ALTER TABLE items DROP CONSTRAINT list_category_or_page_number
