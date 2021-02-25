make bundle-build BUNDLE_IMG=$LOCAL_REGISTRY/$LOCAL_REPOSITORY/assisted-service-operator-bundle:0.0.1
podman push $LOCAL_REGISTRY/$LOCAL_REPOSITORY/assisted-service-operator-bundle:0.0.1

opm index add \
    --bundles $LOCAL_REGISTRY/$LOCAL_REPOSITORY/assisted-service-operator-bundle:0.0.1 \
    --tag $LOCAL_REGISTRY/$LOCAL_REPOSITORY/ppinjark-assisted-service-index:0.0.1 \
    --pull-tool podman

podman push $LOCAL_REGISTRY/$LOCAL_REPOSITORY/ppinjark-assisted-service-index:0.0.1

oc apply -f namespace.yaml
oc apply -f postgres-pvc.yaml
oc apply -f s3-pvc.yaml
oc apply -f catalog-source.yaml
#oc apply -f subscription.yaml
