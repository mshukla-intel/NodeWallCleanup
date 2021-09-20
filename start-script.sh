#!/bin/bash
echo "============================  oc login =================== "
oc login --token=$TOKEN --server=https://api.cfa.devcloud.intel.com:6443 --insecure-skip-tls-verify=true
echo "============================  node cleanup invoking =================== "
oc debug node/$NODE_NAME -T -- chroot /host
oc debug crictl rmi --prune
oc debug for id in `crictl ps -a | grep -i exited | awk '{print $1}'`; do crictl rm $id ; done
echo "============================  node cleanup successful =================== "
