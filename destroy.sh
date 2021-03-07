#!/bin/bash

# Configure Directories
INSTALL_DIR="/tmp/openshift-install-$(date -n +%d-%m)"
INSTALL_CONFIG="${HOME}/OpenShift/install-config.yaml"

# Start destroy
if [ -d "$INSTALL_DIR" ]; then
    pushd .
    cd $INSTALL_DIR
    openshift-install destroy cluster --dir=$INSTALL_DIR --log-level=DEBUG | tee $INSTALL_DIR/$(date -n +%d-%m)-openshift-destroy.log
    popd
else
    echo "Error: ${INSTALL_DIR} not found. Can not continue with OpenShift Destory."
    exit 1
fi
