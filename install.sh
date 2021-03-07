#!/bin/bash

# Configure Directories
INSTALL_DIR="/tmp/openshift-install-$(date -n +%d-%m)"
INSTALL_CONFIG="${HOME}/OpenShift/install-config.yaml"
CLUSTER_NAME="mwasher-$(date -n %d-%m)"
# Start Install
mkdir -p $INSTALL_DIR
if [ -d "$INSTALL_DIR" ]; then
    pushd .
    cd $INSTALL_DIR
    CLUSTER_NAME=$CLUSTER_NAME envsubst <${INSTALL_CONFIG} >"${INSTALL_DIR}/install-config.yaml"
    openshift-install create cluster --dir=$INSTALL_DIR --log-level=DEBUG | tee $INSTALL_DIR/$(date -n +%d-%m)-openshift-install.log
    popd
else
    echo "Error: ${INSTALL_DIR} not found. Can not continue with OpenShift Install."
    exit 1
fi
