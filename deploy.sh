./mirroring.sh

make bundle-build BUNDLE_IMG=virthost.ostest.test.metalkube.org:5000/localimages/assisted-service-operator-bundle:0.0.1
podman push virthost.ostest.test.metalkube.org:5000/localimages/assisted-service-operator-bundle:0.0.1

opm index add \
    --bundles virthost.ostest.test.metalkube.org:5000/localimages/assisted-service-operator-bundle:0.0.1 \
    --tag virthost.ostest.test.metalkube.org:5000/localimages/rwsu-assisted-service-index:0.0.1 \
    --pull-tool podman
    
podman push virthost.ostest.test.metalkube.org:5000/localimages/rwsu-assisted-service-index:0.0.1

oc apply -f namespace.yaml
oc apply -f postgres-pvc.yaml
oc apply -f s3-pvc.yaml
oc apply -f catalog-source.yaml
#oc apply -f subscription.yaml