-- Some Initialization
create user anya with password '<REDACTED_PASSWORD>';
alter database vulnerable_anya owner to anya;
grant all privileges on database vulnerable_anya to anya;