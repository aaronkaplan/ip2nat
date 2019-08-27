# ip2nat
source code for extracting a mapping of IP address to NAT (yes/no?) property

The problem of extracing the feature "is a particular IP address a NAT?" is non trivial unless you have a lot of traffic from all over the world to observer (such as google, fb.com etc) or ad-networks at your disposal or global netflow traffic.

However, here we start small and extend as we go: we take existing measurement data sets (such as [RIPE Atlas](https://atlas.ripe.net/)) and collect the info that these measurements say about their NAT status of their IP address.
This is of course by far not complete, but it is a start and can be seen as an initial attempt.


**Note**: since most residential IP addresses (and most corporate ones) are actually a NAT, hiding at least one internal IP address (think DSL/cable modems usually being a NAT), we should not be surprised to see lots of (IPv4) NAT addresses in the course of time.

