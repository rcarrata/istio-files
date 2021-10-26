# Istio Files
Istio files used for try and break Service Mesh

## A. Service Mesh Installation

* [Mesh Install Lab Guide](docs/install.md)

## B. Basic Gateway Configuration

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

### 3.1 Test the Bookinfo

```sh
GATEWAY_URL=$(echo https://$(oc get route ${control_plane_route_name} -n ${control_plane_namespace} -o jsonpath={'.spec.host'})/productpage)

curl $GATEWAY_URL/productpage
```

## C. mTLS Lab

* [mTLS Lab Guide](docs/mtls.md)

## D. RHSSO Lab

* [SSO Lab Guide](docs/sso.md)
