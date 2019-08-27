CREATE DATABASE ipproperties; 

\c ipproperties

CREATE TABLE ip2nat (ip inet primary key, is_nat boolean);

