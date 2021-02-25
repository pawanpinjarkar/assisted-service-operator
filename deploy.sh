sed -i 's/$LOCAL_REGISTRY\/$LOCAL_REPOSITORY/virthost.ostest.test.metalkube.org:5000\/localimages/g' ipv6/step1_image_mirror.sh
sed -i 's/$LOCAL_REGISTRY\/$LOCAL_REPOSITORY/virthost.ostest.test.metalkube.org:5000\/localimages/g' bundle/manifests/*.yaml
sed -i 's/$LOCAL_REGISTRY/virthost.ostest.test.metalkube.org:5000/g' bundle/manifests/*.yaml

sh ipv6/step1_image_mirror.sh

make bundle-build BUNDLE_IMG=quay.io/ppinjark/assisted-service-operator-bundle:0.0.1
podman push quay.io/ppinjark/assisted-service-operator-bundle:0.0.1

opm index add \
    --bundles quay.io/ppinjark/assisted-service-operator-bundle:0.0.1 \
    --tag quay.io/ppinjark/ppinjark-assisted-service-index:0.0.1 \
    --pull-tool podman
    
podman push quay.io/ppinjark/ppinjark-assisted-service-index:0.0.1

oc apply -f namespace.yaml
oc apply -f postgres-pvc.yaml
oc apply -f s3-pvc.yaml
oc apply -f catalog-source.yaml
#oc apply -f subscription.yaml
