#!/bin/bash

export TOKEN=""
export ASSISTED_SERVICE_IP="assisted-service-assisted-installer.apps.ostest.test.metalkube.org"
export ASSISTED_SERVICE_PORT="80"
export CLUSTER_ID="c2d899a3-d3ce-423b-9cd9-61d09b573d43"

# Set the HTTP proxy
curl \
	--header 'Content-Type: application/json' \
	--header "Authorization: Bearer $TOKEN" \
	--data @cluster-ignition.json \
	--silent \
	--request PATCH \
	"http://${ASSISTED_SERVICE_IP}:${ASSISTED_SERVICE_PORT}/api/assisted-install/v1/clusters/${CLUSTER_ID}"

# Set RSA for ssh and ip
curl \
	--header 'Content-Type: application/json' \
	--header "Authorization: Bearer $TOKEN" \
    --data @image-ignition.json \
	--silent \
	--request POST \
	"http://${ASSISTED_SERVICE_IP}:${ASSISTED_SERVICE_PORT}/api/assisted-install/v1/clusters/${CLUSTER_ID}/downloads/image"
