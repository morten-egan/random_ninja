create user random_ninja
identified by qHTq4bNmi7LX4u
default tablespace data
temporary tablespace temp
quota unlimited on data;

grant create session, create procedure to random_ninja;