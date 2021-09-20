#!/bin/bash
echo "============================  oc login =================== "
oc login --token=$TOKEN --server=https://api.cfa.devcloud.intel.com:6443 --insecure-skip-tls-verify=true
echo "============================  node cleanup invoking =================== "
OUTPUT=$(oc debug node/worker26 -T -- chroot /host bash -c "crictl ps -a | grep -i exited" | awk '{print $1}')
echo " About to loop through OUTPUT... "
echo $OUTPUT
for id in "${OUTPUT[@]}"
do
    echo $id
done
#oc debug for id in OUTPUT; do crictl rm $id ; done
#oc debug node/$NODE_NAME -T -- chroot /host sh -c "for id in `crictl ps -a | grep -i exited | awk '{print $1}'`; do crictl rm $id ; done"
echo "============================  node cleanup successful =================== "
