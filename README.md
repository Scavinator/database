# Scavinator DB

This is where the schema is managed for Scavinators central database. It is managed using [tern](https://github.com/jackc/tern), and so in order to use it you'll need to get yourself a copy.

## Setup

1. Create a postgres database (named `scavinator` in the example config) and a user. Set your user as the owner of the database using `ALTER DATABASE $YOUR_DATABASE OWNER TO $YOUR_USER`.
2. Copy `migrations/tern.sample.conf` to `migrations/tern.conf` and set database, username, and password accordingly.
3. Create application database users for the website and the discord bot, and put their usernames in the `main_role` (for website) and `integration_role` fields in `tern.conf`.
4. Enter the `migrations` directory and run the migrations using `tern migrate`
5. Done!

## Making changes

After adding migrations, update the schema with `pg_dump --schema-only --no-owner -x -d $DATABASE > schema.sql`.

