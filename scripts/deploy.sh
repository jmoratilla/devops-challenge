#!/bin/bash

echo "Here is where magic happens"

KUBECTL=`which kubectl`

if [ "$KUBECTL" -eq "" ]
then
  KUBECTL="$HOME/kubectl"
fi

echo "$K8S_CONFIG" | base64 --decode > ~/kubeconfig.yml

cd code

for i in *
do
    echo "Working in $i..."
    cd $i
    $KUBECTL --kubeconfig ~/kubeconfig.yml apply -f ./kube
    echo "Done in $i."
    cd ..
done
