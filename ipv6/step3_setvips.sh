#!/bin/bash

export TOKEN=""
export ASSISTED_SERVICE_IP="assisted-service-assisted-installer.apps.ostest.test.metalkube.org"
export ASSISTED_SERVICE_PORT="80"
export CLUSTER_ID="7c1a5e15-7f35-405e-973b-f15e84cd469e"

# Set the HTTP proxy
curl \
	--header 'Content-Type: application/json' \
	--header "Authorization: Bearer $TOKEN" \
	--data @cluster-ignition.json \
	--silent \
	--request PATCH \
	"http://${ASSISTED_SERVICE_IP}:${ASSISTED_SERVICE_PORT}/api/assisted-install/v1/clusters/${CLUSTER_ID}"

