#!/bin/bash
echo "============================  oc login =================== "
oc login --token=sha256~a-nBb0cwJolBlpO6H42hXxBv8rrkNC-OU1S5WOI2S84 --server=https://api.cfa.devcloud.intel.com:6443 --insecure-skip-tls-verify=true
echo "============================  node cleanup invoking =================== "
oc debug node/worker26 -T -- chroot /host sh -c "/etc/nodecleanup.sh"
echo "============================  node cleanup successful =================== "
