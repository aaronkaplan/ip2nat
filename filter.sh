#!/bin/sh

# input file format:
# {
#    "status": "ok", 
#(...)
#    "data": {
#        "resource": "AT", 
#        "stats": {
#            "total": 365
#        }, 
#        "probes": [
#            {
#                "prefix_v4": "193.238.156.0/22", 
#                "status": 1, 
#                "prefix_v6": "2a02:60::/29", 
#                "is_anchor": false, 
#                "last_connected": 1566920183, 
#                "status_name": "Connected", 
#                "type": "Probe", 
#                "id": 33, 
#                "tags": [
#                    "cable", 
#                    "home", 
#                    "nat", 
#                    "upc", 
#                    "system-v1", 
#                    "system-resolves-a-correctly", 
#                    "system-resolves-aaaa-correctly", 
#                    "system-ipv4-works", 
#                    "system-ipv6-doesnt-work", 
#                    "system-ipv4-capable", 
#                    "system-ipv6-capable", 
#                    "system-ipv4-rfc1918", 
#                    "system-ipv4-stable-1d"
#                ], 
#                "address_v6": "2a02:61:bcb:1:220:4aff:fec8:22c2", 
#                "longitude": 16.3585, 
#                "address_v4": "193.238.159.251", 


. ./common.sh

for country in $countries; do
    infile="${DATE}-${country}-atlast-probes.json"
    outfile="${DATE}-${country}-atlast-probes.csv"
    ./filter.py $infile > $outfile
done
