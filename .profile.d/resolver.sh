
# get IP address of dns resolver
# RESOLVER=grep '^nameserver' resolv.conf | awk '{print $2}'
export RESOLVER=$(grep '^nameserver' resolv.conf | awk '{print $2}')