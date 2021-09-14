#!/bin/bash
oc login --token=sha256~mUouiAYWFrRHpS6uLGnXRxhX81FbcEpgTSxpw39MZlY --server=https://api.cfa.devcloud.intel.com:6443 --insecure-skip-tls-verify=true
oc debug node/$(oc get pods -o json |jq '.items[].spec.nodeName'|sed 's/"//g') -T -- chroot
/host sh -c "/etc/nodecleanup.sh"
