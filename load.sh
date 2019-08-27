#!/bin/sh

. ./common.sh



for country in $countries; do
    infile="${DATE}-${country}-atlast-probes.csv"
    cat $infile | psql -c "COPY ip2nat (ip, is_nat) FROM STDIN WITH CSV;" ipproperties
done
