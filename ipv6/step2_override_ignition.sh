#!/bin/bash

export TOKEN=""
export ASSISTED_SERVICE_IP="assisted-service-assisted-installer.apps.ostest.test.metalkube.org"
export ASSISTED_SERVICE_PORT="80"
export CLUSTER_ID="7c1a5e15-7f35-405e-973b-f15e84cd469e"

curl \
	--header "Content-Type: application/json" \
	--header "Authorization: Bearer $TOKEN" \
	--request PATCH \
	--data @discovery-ignition.json \
"http://$ASSISTED_SERVICE_IP:$ASSISTED_SERVICE_PORT/api/assisted-install/v1/clusters/$CLUSTER_ID/discovery-ignition"

curl \
   --header "Content-Type: application/json" \
   --header "Authorization: Bearer $TOKEN" \
   --request PATCH \
   --data '"{\"additionalTrustBundle\":\"-----BEGIN CERTIFICATE-----\\nMIIDtDCCApygAwIBAgIUYkTPoH\/rqQhBYIHA0iWoU52RLV0wDQYJKoZIhvcNAQEL\\nBQAwcjELMAkGA1UEBhMCVVMxCzAJBgNVBAgMAk5DMRAwDgYDVQQHDAdSYWxlaWdo\\nMRUwEwYDVQQKDAxUZXN0IENvbXBhbnkxEDAOBgNVBAsMB1Rlc3RpbmcxGzAZBgNV\\nBAMMEnRlc3QubWV0YWxrdWJlLm9yZzAeFw0yMTAyMjEyMDE5MTZaFw0yMjAyMjEy\\nMDE5MTZaMHIxCzAJBgNVBAYTAlVTMQswCQYDVQQIDAJOQzEQMA4GA1UEBwwHUmFs\\nZWlnaDEVMBMGA1UECgwMVGVzdCBDb21wYW55MRAwDgYDVQQLDAdUZXN0aW5nMRsw\\nGQYDVQQDDBJ0ZXN0Lm1ldGFsa3ViZS5vcmcwggEiMA0GCSqGSIb3DQEBAQUAA4IB\\nDwAwggEKAoIBAQDYJmqUSRnGequ\/xibSLq8rA3CHPvMUrKfVI+0cU+NUKk6KMmnl\\naJnuQSKmk1VEbmjmUWDEYvhEVZmGh06VTzlYeM04fwZ5A91Th4SDtkoyTAfQ\/DJ+\\nPxeGELyS\/fOIP3exhZWdReIRDCm6\/HBDzYMYzKCvcpNcrRoN98b9DV9kf086c0On\\nxsS+jHt\/EnYZK5eQZW2hqx4yeq5QQ9Lg7mAYxRjSo4IfIdlWHP63R1KJeSUpwI1e\\n1AjX9Dx88sMY8VLLyZgKe0Ny1YzRX2He6EwmiamjUTH6CWQJrajW3f14I4N9X8dO\\nBR1Kd1b9t5MnHH+7mjoaHTpOnuFvXR1wGntVAgMBAAGjQjBAMA8GA1UdEwQIMAYB\\nAf8CAQAwLQYDVR0RBCYwJIIidmlydGhvc3Qub3N0ZXN0LnRlc3QubWV0YWxrdWJl\\nLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAATvB1uLCowpaAddcbHRqjXKP4ZhSzzcC\\ngVG15vAscbzN2Qyv39j6mW3XQ5lKqoXC5Bj8td8M1yqDVnwTwgkX0fTNaoO1K0lS\\nP7b5S48S9Xn+qo3wQn\/ZHJ416URV66yDLfioJJvx9k9ujZBczYLvfuMx8MHwdrto\\nwC2NS686eFmMZI83Mal\/+dp7iN\/fwrWeUwDQj\/2+mLWQQqhLjQi3eo7Z0MEElDCw\\nEd5AI8nTFBRu+EtNxaT4BxH24jaddiwAaBqi1FcQCS+owj\/G10odxTq2xUDyHqix\\n6exGsWGBqbH+Y1CM+Gyhw4TQLy3V8p97p1xqLsIP\/Lc+IFKi3FV4BA==\\n-----END CERTIFICATE-----\\n\",\"imageContentSources\":[{\"mirrors\":[\"virthost.ostest.test.metalkube.org:5000\/localimages\"],\"source\":\"quay.io\/openshift-release-dev\/ocp-release\"},{\"mirrors\":[\"virthost.ostest.test.metalkube.org:5000\/localimages\"],\"source\":\"quay.io\/openshift-release-dev\/ocp-v4.0-art-dev\"}]}"'\
  "http://$ASSISTED_SERVICE_IP:$ASSISTED_SERVICE_PORT/api/assisted-install/v1/clusters/$CLUSTER_ID/install-config"
