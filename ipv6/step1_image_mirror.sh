#!/bin/bash

export PULL_SECRET_JSON=${XDG_RUNTIME_DIR}/containers/auth.json
export LOCAL_REPOSITORY=ocp4
export OCP_RELEASE=4.6.8-x86_64
export OCP_REGISTRY=quay.io/openshift-release-dev/ocp-release

oc -a $PULL_SECRET_JSON image mirror quay.io/coreos/coreos-installer:v0.7.0 $LOCAL_REGISTRY/coreos/$IMAGE:v0.7.0 --insecure=true
oc -a $PULL_SECRET_JSON image mirror quay.io/ppinjark/assisted-service:latest $LOCAL_REGISTRY/$LOCAL_REPOSITORY/$IMAGE:latest
oc -a $PULL_SECRET_JSON image mirror quay.io/jparrill/s3server:latest $LOCAL_REGISTRY/$LOCAL_REPOSITORY/$IMAGE:latest

for IMAGE in ocp-metal-ui postgresql-12-centos7 assisted-installer-agent assisted-installer-controller assisted-iso-create assisted-installer agent
do
   oc -a $PULL_SECRET_JSON image mirror quay.io/ocpmetal/$IMAGE:latest $LOCAL_REGISTRY/$LOCAL_REPOSITORY/$IMAGE:latest --insecure=true
   echo "Pushed to $LOCAL_REGISTRY/$LOCAL_REPOSITORY/$IMAGE:latest"
done

oc adm -a $PULL_SECRET_JSON release new \
       --from-release=registry.svc.ci.openshift.org/sno-dev/openshift-bip:0.5.0 \
       --mirror=$LOCAL_REGISTRY/$LOCAL_REPOSITORY \
       --to-image=$LOCAL_REGISTRY/$LOCAL_REPOSITORY:${OCP_RELEASE}
