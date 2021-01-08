# assisted-service-operator
This repository contains the bundle manifests for assisted-service.

## Usage

````
oc apply -f postgres-pvc.yaml
oc apply -f s3-pvc.yaml
oc apply -f catalog-source.yaml
````

From the OperatorHub of you OCP cluster, install Assisted Service.
