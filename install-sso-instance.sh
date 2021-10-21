#!/bin/bash

#Define these variables in the same shell
DEPLOY_NAMESPACE=${sso_namespace}
CONTROL_PLANE_NAMESPACE=${control_plane_namespace}
CONTROL_PLANE_NAME=${control_plane_name}
CONTROL_PLANE_ROUTE_NAME=${control_plane_route_name}

oc new-project ${DEPLOY_NAMESPACE}

echo "Install VirtualService, Gateway & bookinfo App in namespace \"${DEPLOY_NAMESPACE}\""

helm upgrade -i sso-instance -n ${DEPLOY_NAMESPACE} \
  --set control_plane_namespace=${CONTROL_PLANE_NAMESPACE} \
  --set control_plane_name=${CONTROL_PLANE_NAME} \
  --set route_hostname=$(oc get route ${CONTROL_PLANE_ROUTE_NAME} -n ${CONTROL_PLANE_NAMESPACE} -o jsonpath={'.spec.host'}) \
  sso-instance

echo "Done."

exit 0
