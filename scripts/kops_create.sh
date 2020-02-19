#!/bin/bash

set +e

# Load vars
source ./variables.kops

# Create the cluster
kops create cluster \
  --cloud aws \
  --kubernetes-version $KOPS_KUBERNETES_VERSION \
  --zones $KOPS_NODE_ZONES \
  --master-zones $KOPS_MASTER_ZONES \
  --node-count $KOPS_NODE_COUNT \
  --node-size $KOPS_NODE_SIZE \
  --master-count $KOPS_MASTER_COUNT \
  --master-size $KOPS_MASTER_SIZE \
  --topology $KOPS_TOPOLOGY \
  --bastion \
  --networking $KOPS_NETWORKING \
  --network-cidr $KOPS_NETWORK_CIDR \
  --name $NAME

# Create the ssh key
kops create secret \
  --name $NAME \
  sshpublickey admin \
  -i $KOPS_SSH_KEY_PATH

set -e

# Review the cluster definition
read -p "Do you want to review the cluster (y/N)? " review
case $review in 
  [Yy]*)
    kops edit cluster $NAME
    break
    ;;
  "*")
    echo "Ok then, let's going to the next step."
    ;;
esac

# Launch the cluster
read -p "Do you want to launch the cluster (y/N)? " launch
case $launch in
  [Yy]*)
    kops update cluster $NAME --yes
    ;;
  "*")
    echo "Ok then, let's going to the next step."
    ;;
esac

