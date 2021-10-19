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
