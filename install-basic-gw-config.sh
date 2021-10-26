#!/bin/bash

#Define these variables in the same shell
DEPLOY_NAMESPACE=${bookinfo_namespace}
CONTROL_PLANE_NAMESPACE=${control_plane_namespace}
CONTROL_PLANE_NAME=${control_plane_name}
CONTROL_PLANE_ROUTE_NAME=${control_plane_route_name}

oc new-project ${DEPLOY_NAMESPACE}

echo "Install VirtualService, Gateway & bookinfo App in namespace \"${DEPLOY_NAMESPACE}\""

helm upgrade -i basic-gw-config -n ${DEPLOY_NAMESPACE} \
  --set control_plane_namespace=${CONTROL_PLANE_NAMESPACE} \
  --set control_plane_name=${CONTROL_PLANE_NAME} \
  --set route_hostname=$(oc get route ${CONTROL_PLANE_ROUTE_NAME} -n ${CONTROL_PLANE_NAMESPACE} -o jsonpath={'.spec.host'}) \
  basic-gw-config

echo "Install bookinfo App..."

helm upgrade -i bookinfo -n ${DEPLOY_NAMESPACE} bookinfo

echo "Done."

exit 0
