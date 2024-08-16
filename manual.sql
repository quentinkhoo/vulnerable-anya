-- bullshit 
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE users FORCE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation_policy ON users USING (tenant_id = current_setting('app.current_tenant_id')::UUID);

-- more bullshit
create database vulnerable_anya;
alter database vulnerable_anya owner to anya;
grant all privileges on database vulnerable_anya to anya;

