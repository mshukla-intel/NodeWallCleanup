#!/bin/bash
echo "============================  oc login =================== "
oc login --token=$TOKEN --server=https://api.cfa.devcloud.intel.com:6443 --insecure-skip-tls-verify=true
echo "============================  node cleanup invoking rmi prune =================== "
oc debug node/$NODE_NAME -T -- chroot /host sh -c "crictl rmi --prune"
echo "============================  obtaining list of exited resources =================== "
OUTPUT=$(oc debug node/worker26 -T -- chroot /host bash -c "crictl ps -a | grep -i exited" | awk '{print $1}')
echo "============================  loop through OUTPUT... =================== "
echo $OUTPUT
for id in "${OUTPUT[@]}"
do
    oc debug node/$NODE_NAME -T -- chroot /host sh -c "crictl rm $id"
done
#oc debug for id in OUTPUT; do crictl rm $id ; done
#oc debug node/$NODE_NAME -T -- chroot /host sh -c "for id in `crictl ps -a | grep -i exited | awk '{print $1}'`; do crictl rm $id ; done"
echo "============================  node cleanup successful =================== "
