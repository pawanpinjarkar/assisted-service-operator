#!/bin/bash

export TOKEN=""
export ASSISTED_SERVICE_IP="assisted-service-assisted-installer.apps.ostest.test.metalkube.org"
export ASSISTED_SERVICE_PORT="80"
export CLUSTER_ID="478e9391-409f-4665-991e-e21f544cc8c5"


# Set RSA for ssh and ip
curl \
	--header 'Content-Type: application/json' \
	--header "Authorization: Bearer $TOKEN" \
    --data @image-ignition.json \
	--silent \
	--request POST \
	"http://${ASSISTED_SERVICE_IP}:${ASSISTED_SERVICE_PORT}/api/assisted-install/v1/clusters/${CLUSTER_ID}/downloads/image"
