#!/bin/bash

echo "Here is where magic happens"

echo "$K8S_CONFIG" | base64 --decode > ~/kubeconfig.yml

cd code

for i in *
do
    echo "Working in $i..."
    cd $i
    ./kubectl --kubeconfig=~/kubeconfig.yml apply -f ./kube
    echo "Done in $i."
    cd ..
done
