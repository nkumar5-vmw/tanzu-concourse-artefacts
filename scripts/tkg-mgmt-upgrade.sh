#!/bin/bash

set -e 

export MGMT_CLUSTER_KUBECONFIG_PATH="./tkg-cluster-context/tkg-mgmt-ctx"
export MGMT_CLUSTER_CONTEXT="tkg-mgmt-admin@tkg-mgmt"
export MGMT_CLUSTER_NAME="tkg-mgmt"

tanzu login --kubeconfig ${TKG_MGMT_KUBECONFIG_PATH} \
            --context ${TKG_MGMT_CLUSTER_CONTEXT} \
            --name ${TKG_MGMT_CLUSTER_NAME}
export KUBECONFIG=${TKG_MGMT_CLUSTER_KUBECONFIG_PATH}

rm -rf ~/.tanzu/tkg/bom
export TKG_BOM_CUSTOM_IMAGE_TAG="v1.3.1-patch1"
tanzu management-cluster create || ls
tanzu management-cluster get
