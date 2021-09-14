#!/bin/bash
oc login --token=$TOKEN --server=$URL --insecure-skip-tls-verify=true
oc debug node/$(oc get pods -o json |jq '.items[].spec.nodeName'|sed 's/"//g') -T -- chroot
/host sh -c "/etc/nodecleanup.sh"
podman build -t quay.io/shailendra14k/oc:11 .
podman push quay.io/shailendra14k/oc:11
