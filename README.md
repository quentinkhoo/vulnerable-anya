# README

## Setup
Set the POSTGRES_PASSWORD env var (the `docker-compose.yml` reads from this env var)
`export POSTGRES_PASSWORD=<SOMEPASSWORD>`

Change the value of `anya`'s password in `init.sql` to that to match your `VULNERABLE_ANYA_DATABASE_PASSWORD` in your .env file

Your .env file should have the following values set:
```
SECRET_KEY_BASE=<REDACTED>

RAILS_ENV=production
VULNERABLE_ANYA_DATABASE_PASSWORD=<REDACTED>
DATABASE_URL=postgresql://anya:${VULNERABLE_ANYA_DATABASE_PASSWORD}@db:5432/vulnerable_anya
ROOT_DOMAIN=.kaligo.local
SUBROOT_DOMAIN=.stg.int

TENANT1_NAME=Forger-Family
TENANT1_USER1=Anya
TENANT1_USER1_PASSWORD=<REDACTED>
TENANT1_USER2=Yor
TENANT1_USER2_PASSWORD=<REDACTED>
TENANT1_USER3=Loid
TENANT1_USER3_PASSWORD=<REACTED>>
TENANT1_USER4=Bond
TENANT1_USER4_PASSWORD=<REDACTED>

TENANT2_NAME=Desmond-Family
TENANT2_USER1=Damian
TENANT2_USER1_PASSWORD=<READCTED>
TENANT2_USER2=Donovan
TENANT2_USER2_PASSWORD=<REDACTED>>
TENANT2_USER3=Melinda
TENANT2_USER3_PASSWORD=<REDACTED>
```

## Running
You can run and build this locally with `docker-compose`
```
docker-compose build
docker-compose up
```