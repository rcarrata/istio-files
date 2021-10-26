# Basic Deployment of App and Istio Files

## 1. Install the mTLS

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

## 2. Test the Bookinfo

```sh
GATEWAY_URL=$(echo https://$(oc get route ${control_plane_route_name} -n ${control_plane_namespace} -o jsonpath={'.spec.host'})/productpage)

curl $GATEWAY_URL/productpage
```

## 3. Test with Siege

```sh
siege $GATEWAY_URL -c 1 -d 2
```