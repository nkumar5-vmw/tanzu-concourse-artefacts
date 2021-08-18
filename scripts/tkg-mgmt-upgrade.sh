#!/bin/bash

set -e 

export MGMT_CLUSTER_KUBECONFIG_PATH="${TKG_MGMT_CLUSTER_KUBECONFIG_PATH}"
export MGMT_CLUSTER_CONTEXT="${TKG_MGMT_CLUSTER_CONTEXT}"
export MGMT_CLUSTER_NAME="${TKG_MGMT_CLUSTER_NAME}"

tanzu login --kubeconfig ${TKG_MGMT_KUBECONFIG_PATH} \
            --context ${TKG_MGMT_CLUSTER_CONTEXT} \
            --name ${TKG_MGMT_CLUSTER_NAME}
export KUBECONFIG=${TKG_MGMT_CLUSTER_KUBECONFIG_PATH}

rm -rf ~/.tanzu/tkg/bom
export TKG_BOM_CUSTOM_IMAGE_TAG="v1.3.1-patch1"
tanzu management-cluster create || ls
tanzu management-cluster get
