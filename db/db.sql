CREATE DATABASE ipproperties; 

\c ipproperties

CREATE TABLE ip2nat (ip inet, is_nat boolean, ts timestamp with time zone default now());

