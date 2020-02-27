#!/bin/bash -e

kubectl config view --flatten | base64 -w 0 > kubeconfig.b64


echo "Now use the contents of the kubeconfig.b64 to set the env var K8S_CONFIG in CircleCI."

