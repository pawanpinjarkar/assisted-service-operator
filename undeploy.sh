oc delete -n assisted-installer csv assisted-service-operator.v0.0.1
oc delete -n assisted-installer subscription assisted-service-operator
oc delete -f catalog-source.yaml
#oc delete -f config/crd/bases/assistedservice.openshift.io.openshift.io_assistedservices.yaml 
#oc delete -f config/samples/assistedservice.openshift.io_v1alpha1_assistedservice.yaml 
oc delete -f postgres-pvc.yaml
oc delete -f s3-pvc.yaml
oc delete -f namespace.yaml
