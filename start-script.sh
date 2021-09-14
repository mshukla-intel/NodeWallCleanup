#!/bin/bash
echo "============================  crictl images output before clean up =================== "
crictl images
echo "============================  crictl images output before clean up =================== "
oc login --token=sha256~mUouiAYWFrRHpS6uLGnXRxhX81FbcEpgTSxpw39MZlY --server=https://api.cfa.devcloud.intel.com:6443 --insecure-skip-tls-verify=true
oc debug node/$(oc get pods -o json |jq '.items[].spec.nodeName'|sed 's/"//g') -T -- chroot
echo "============================  node cleanup invoked =================== "
/host sh -c "/etc/nodecleanup.sh"
echo "============================  crictl images output AFTER =================== "
crictl images
echo "============================  crictl images output AFTER =================== "
echo "============================  node cleanup successful =================== "
