#!/bin/bash
crictl rmi --prune
for id in `crictl ps -a | grep -i exited | awk '{print $1}'`; do
crictl rm $id ; done
