# Istio Files
Istio files used for try and break Service Mesh

# Service Mesh Installation

## Install the service mesh operators

```sh
helm install service-mesh-operators -n openshift-operators service-mesh-operators/
```

## Uninstall the service mesh operators

1. Delete the helm chart release:

```sh
helm delete service-mesh-operators -n openshift-operators
```

2. Follow the instructions from <https://docs.openshift.com/container-platform/4.9/service_mesh/service_mesh_install/removing-ossm.html>

## Install the control plane

```sh
export deploy_namespace=istio-system

oc new-project ${deploy_namespace}

#Note: you may need to wait a moment for the operators to propagate

helm install control-plane -n ${deploy_namespace} control-plane/
```

## Uninstall the control plane

```sh
export deploy_namespace=istio-system
helm delete control-plane -n ${deploy_namespace}
```

## Basic Gateway Configuration

```sh
export bookinfo_namespace=bookinfo
export control_plane_namespace=istio-system
export control_plane_name=basic-install
export control_plane_route_name=api
```

* Deploy the Gateway configuration and the Bookinfo.

```sh
bash install-basic-gateway-config.sh
```

## Test the Bookinfo

```sh
GATEWAY_URL=$(echo https://$(oc get route ${control_plane_route_name} -n ${control_plane_namespace} -o jsonpath={'.spec.host'})/productpage)

curl $GATEWAY_URL/productpage
```
