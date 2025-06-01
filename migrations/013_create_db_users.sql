GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO {{ .main_role }};
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO {{ .main_role }};

GRANT INSERT ON TABLE items TO {{ .integration_role }};
GRANT SELECT ON TABLE items TO {{ .integration_role }};
GRANT UPDATE (discord_thread_id, discord_message_id, updated_at, page_number) ON TABLE items TO {{ .integration_role }};
GRANT SELECT ON TABLE team_scav_hunts TO {{ .integration_role }};
GRANT UPDATE (discord_items_message_id, discord_pages_message_id, updated_at) ON TABLE team_scav_hunts TO {{ .integration_role }};
GRANT INSERT ON TABLE pages TO {{ .integration_role }};
GRANT SELECT ON TABLE pages TO {{ .integration_role }};
GRANT UPDATE (discord_thread_id, discord_message_id, updated_at) ON TABLE pages TO {{ .integration_role }};
GRANT USAGE ON SEQUENCE items_id_seq, pages_id_seq TO {{ .integration_role }};
GRANT SELECT ON TABLE list_categories TO {{ .integration_role }};
GRANT INSERT ON TABLE team_scav_hunts TO {{ .integration_role }};
GRANT INSERT, SELECT ON TABLE teams TO {{ .integration_role }};
GRANT USAGE ON SEQUENCE teams_id_seq TO {{ .integration_role }};
GRANT INSERT, SELECT ON TABLE team_integrations TO {{ .integration_role }};
GRANT USAGE ON SEQUENCE team_integrations_id_seq TO {{ .integration_role }};
GRANT USAGE ON SEQUENCE team_scav_hunts_id_seq TO {{ .integration_role }};
GRANT SELECT ON TABLE scav_hunts TO {{ .integration_role }};

---- create above / drop below ----

REVOKE SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public FROM {{ .main_role }};
REVOKE USAGE ON ALL SEQUENCES IN SCHEMA public FROM {{ .main_role }};

REVOKE INSERT ON TABLE items FROM {{ .integration_role }};
REVOKE SELECT ON TABLE items FROM {{ .integration_role }};
REVOKE UPDATE (discord_thread_id, discord_message_id, updated_at, page_number) ON TABLE items FROM {{ .integration_role }};
REVOKE SELECT ON TABLE team_scav_hunts FROM {{ .integration_role }};
REVOKE UPDATE (discord_items_message_id, discord_pages_message_id, updated_at) ON TABLE team_scav_hunts FROM {{ .integration_role }};
REVOKE INSERT ON TABLE pages FROM {{ .integration_role }};
REVOKE SELECT ON TABLE pages FROM {{ .integration_role }};
REVOKE UPDATE (discord_thread_id, discord_message_id, updated_at) ON TABLE pages FROM {{ .integration_role }};
REVOKE USAGE ON SEQUENCE items_id_seq, pages_id_seq FROM {{ .integration_role }};
REVOKE SELECT ON TABLE list_categories FROM {{ .integration_role }};
REVOKE INSERT ON TABLE team_scav_hunts FROM {{ .integration_role }};
REVOKE INSERT, SELECT ON TABLE teams FROM {{ .integration_role }};
REVOKE USAGE ON SEQUENCE teams_id_seq FROM {{ .integration_role }};
REVOKE INSERT, SELECT ON TABLE team_integrations FROM {{ .integration_role }};
REVOKE USAGE ON SEQUENCE team_integrations_id_seq FROM {{ .integration_role }};
REVOKE USAGE ON SEQUENCE team_scav_hunts_id_seq FROM {{ .integration_role }};
REVOKE SELECT ON TABLE scav_hunts FROM {{ .integration_role }};
