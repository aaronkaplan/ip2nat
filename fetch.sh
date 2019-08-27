#!/bin/sh

. ./common.sh

baseurl="https://stat.ripe.net/data/atlas-probes/data.json?resource="


for country in $countries; do
    url="${baseurl}${country}"
    outfile="${DATE}-${country}-atlast-probes.json"
    wget --quiet -O $outfile $url
done
