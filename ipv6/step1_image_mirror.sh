#!/bin/bash
 
export PULL_SECRET_JSON=${XDG_RUNTIME_DIR}/containers/auth.json
export LOCAL_REGISTRY="virthost.ostest.test.metalkube.org:5000"

IMAGE="coreos-installer"
oc -a $PULL_SECRET_JSON image mirror quay.io/coreos/$IMAGE:v0.7.0 $LOCAL_REGISTRY/coreos/$IMAGE:v0.7.0 --insecure=true
IMAGE="assisted-service"
oc -a $PULL_SECRET_JSON image mirror quay.io/ppinjark/$IMAGE:latest $LOCAL_REGISTRY/localimages/$IMAGE:latest
IMAGE="s3server"
oc -a $PULL_SECRET_JSON image mirror quay.io/jparrill/$IMAGE:latest $LOCAL_REGISTRY/localimages/$IMAGE:latest
 
for IMAGE in ocp-metal-ui postgresql-12-centos7 assisted-installer-agent assisted-installer-controller assisted-iso-create assisted-installer agent
do
   oc -a $PULL_SECRET_JSON image mirror quay.io/ocpmetal/$IMAGE:latest $LOCAL_REGISTRY/localimages/$IMAGE:latest --insecure=true
   echo "Pushed to $LOCAL_REGISTRY/localimages/$IMAGE:latest"
done


export LOCAL_REPOSITORY=localimages
export OCP_RELEASE=4.6.8-x86_64
export OCP_REGISTRY=quay.io/openshift-release-dev/ocp-release
 
oc adm -a $PULL_SECRET_JSON release mirror \
       --from=${OCP_REGISTRY}:${OCP_RELEASE} \
       --to=$LOCAL_REGISTRY/$LOCAL_REPOSITORY \
       --to-release-image=$LOCAL_REGISTRY/$LOCAL_REPOSITORY:${OCP_RELEASE}

