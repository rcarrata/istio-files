# 1. Install Lab Guide

## 1.1 Install the service mesh operators

```sh
helm install service-mesh-operators -n openshift-operators service-mesh-operators/
```

## 1.2 Check the Service Mesh Operators status

```sh
helm ls -n openshift-operators
```

```sh
oc get pod -n openshift-operators
```

## 2. Install the control plane

```sh
export deploy_namespace=istio-system

oc new-project ${deploy_namespace}

#Note: you may need to wait a moment for the operators to propagate

helm install control-plane -n ${deploy_namespace} control-plane/
```

### 2.1 Monitor the Service Mesh Control Plane

```sh
oc get pod -n istio-system
NAME                                    READY   STATUS              RESTARTS   AGE
grafana-58b8d6b866-vkzfz                2/2     Running             0          59s
istio-egressgateway-74688d758-n9kcw     1/1     Running             0          59s
istio-ingressgateway-566b8799f5-tvmtv   1/1     Running             0          59s
istiod-basic-install-7fd5988b8d-7h2s6   1/1     Running             0          116s
jaeger-5bb5848ff5-vg927                 2/2     Running             0          59s
kiali-75d59c6544-2r5qp                  0/1     ContainerCreating   0          11s
prometheus-854f88478f-mqlq4             3/3     Running             0          88s
```

## 3. Uninstall the Lab

### 3.1 Uninstall the control plane

```sh
export deploy_namespace=istio-system
helm delete control-plane -n ${deploy_namespace}
```

## 3.2 Uninstall the service mesh operators

a. Delete the helm chart release:

```sh
helm delete service-mesh-operators -n openshift-operators
```

b. Follow the instructions from <https://docs.openshift.com/container-platform/4.9/service_mesh/service_mesh_install/removing-ossm.html>
