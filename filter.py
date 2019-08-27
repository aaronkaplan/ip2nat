#!/usr/bin/env python3

import sys
import json


debug=False

""" input file format:
 {
    "status": "ok",
(...)
    "data": {
        "resource": "AT",
        "stats": {
            "total": 365
        },
        "probes": [
            {
                "prefix_v4": "193.238.156.0/22",
                "status": 1,
                "prefix_v6": "2a02:60::/29",
                "is_anchor": false,
                "last_connected": 1566920183,
                "status_name": "Connected",
                "type": "Probe",
                "id": 33,
                "tags": [
                    "cable",
                    "home",
                    "nat",
                    "upc",
                    "system-v1",
                    "system-resolves-a-correctly",
                    "system-resolves-aaaa-correctly",
                    "system-ipv4-works",
                    "system-ipv6-doesnt-work",
                    "system-ipv4-capable",
                    "system-ipv6-capable",
                    "system-ipv4-rfc1918",
                    "system-ipv4-stable-1d"
                ],
                "address_v6": "2a02:61:bcb:1:220:4aff:fec8:22c2",
                "longitude": 16.3585,
                "address_v4": "193.238.159.251",
"""


def parsejson(j):
    """ returns a tuple: (ipv4, ipv6, is_nat) or None if not OK."""
    if j['status'] != 'ok':
        return None

    probes = j['data']['probes']
    for probe in probes:
        if debug:
            print(probe)
        tags = probe['tags']
        if (probe['address_v4']):
            if 'nat' in tags:
                is_nat = True
            else:
                is_nat = False
            ipv4 = probe['address_v4']
            ipv6 = probe['address_v6']
            yield (ipv4, ipv6, is_nat)


if __name__ == "__main__":
    if (len(sys.argv) > 1):
        f = open(sys.argv[1])
    else:
        f = sys.stdin
    with f:
        data = json.load(f)
        result = parsejson(data)
        for (ipv4, ipv6, is_nat) in result:
            print("%s,%s" %(ipv4, is_nat))
