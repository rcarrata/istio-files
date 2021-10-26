# RHSSO Lab

## RHSSO Installation

* Generate the Namespace for the Single Sign On:

```sh
oc new-project ${sso_namespace}
```

* Install the Operator of the SSO:

```sh
helm install sso-operator -n ${sso_namespace} sso-operator/
```

```sh
bash -x install-sso-instance.sh
```

## RHSSO Integration with Service Mesh


