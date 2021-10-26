# 1. Install Lab Guide

## 1.1 Install the service mesh operators

```sh
helm install service-mesh-operators -n openshift-operators service-mesh-operators/
```

## 1.2 Uninstall the service mesh operators

a. Delete the helm chart release:

```sh
helm delete service-mesh-operators -n openshift-operators
```

b. Follow the instructions from <https://docs.openshift.com/container-platform/4.9/service_mesh/service_mesh_install/removing-ossm.html>

## 2. Install the control plane

```sh
export deploy_namespace=istio-system

oc new-project ${deploy_namespace}

#Note: you may need to wait a moment for the operators to propagate

helm install control-plane -n ${deploy_namespace} control-plane/
```

## 2.1 Uninstall the control plane

```sh
export deploy_namespace=istio-system
helm delete control-plane -n ${deploy_namespace}
```
