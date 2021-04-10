set scan off;

@install.sql

select 'Ignore public synonyms errors' from dual;

@grant_public

select 'Deployment Done.' from dual;

exit;