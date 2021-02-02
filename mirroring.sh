REG_CREDS=${XDG_RUNTIME_DIR}/containers/auth.json

oc image mirror \
    -a ${REG_CREDS} \
    quay.io/ocpmetal/assisted-installer-agent:latest \
    virthost.ostest.test.metalkube.org:5000/localimages/assisted-installer-agent:latest

oc image mirror \
    -a ${REG_CREDS} \
    quay.io/ocpmetal/assisted-installer-controller:latest \
    virthost.ostest.test.metalkube.org:5000/localimages/assisted-installer-controller:latest

oc image mirror \
    -a ${REG_CREDS} \
    quay.io/ocpmetal/assisted-installer:latest \
    virthost.ostest.test.metalkube.org:5000/localimages/assisted-installer:latest

oc image mirror \
    -a ${REG_CREDS} \
    quay.io/openshift-release-dev/ocp-release:4.6.8-x86_64 \
    virthost.ostest.test.metalkube.org:5000/localimages/ocp-release:4.6.8-x86_64

oc image mirror \
    -a ${REG_CREDS} \
    quay.io/openshift-release-dev/ocp-release@sha256:2419f9cd3ea9bd114764855653012e305ade2527210d332bfdd6dbdae538bd66 \
    virthost.ostest.test.metalkube.org:5000/localimages/ocp-release@sha256:2419f9cd3ea9bd114764855653012e305ade2527210d332bfdd6dbdae538bd66

oc image mirror \
    -a ${REG_CREDS} \
    quay.io/ocpmetal/assisted-service:latest \
    virthost.ostest.test.metalkube.org:5000/localimages/assisted-service:latest

oc image mirror \
    -a ${REG_CREDS} \
    quay.io/ocpmetal/assisted-installer-agent:latest \
    virthost.ostest.test.metalkube.org:5000/localimages/assisted-installer-agent:latest

oc image mirror \
    -a ${REG_CREDS} \
    quay.io/ocpmetal/assisted-installer-controller:latest \
    virthost.ostest.test.metalkube.org:5000/localimages/assisted-installer-controller:latest

oc image mirror \
    -a ${REG_CREDS} \
    quay.io/ocpmetal/assisted-installer:latest \
    virthost.ostest.test.metalkube.org:5000/localimages/assisted-installer:latest

oc image mirror \
    -a ${REG_CREDS} \
    quay.io/openshift-release-dev/ocp-release:4.6.8-x86_64 \
    virthost.ostest.test.metalkube.org:5000/localimages/ocp-release:4.6.8-x86_64

oc image mirror \
    -a ${REG_CREDS} \
    quay.io/openshift-release-dev/ocp-release@sha256:2419f9cd3ea9bd114764855653012e305ade2527210d332bfdd6dbdae538bd66 \
    virthost.ostest.test.metalkube.org:5000/localimages/ocp-release@sha256:2419f9cd3ea9bd114764855653012e305ade2527210d332bfdd6dbdae538bd66

oc image mirror \
    -a ${REG_CREDS} \
    quay.io/ocpmetal/assisted-service:latest \
    virthost.ostest.test.metalkube.org:5000/localimages/assisted-service:latest