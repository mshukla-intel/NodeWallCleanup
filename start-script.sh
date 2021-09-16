#!/bin/bash
echo "============================  oc login =================== "
oc login --token=$TOKEN --server=https://api.cfa.devcloud.intel.com:6443 --insecure-skip-tls-verify=true
echo "============================  node cleanup invoking =================== "
oc debug node/$NODE_NAME -T -- chroot /host sh -c "/etc/nodecleanup.sh"
echo "============================  node cleanup successful =================== "
