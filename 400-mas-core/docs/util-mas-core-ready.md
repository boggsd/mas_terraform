# MAS Core Ready module

Module to wait for MAS Core (gitops) instance to be ready in the cluster


## Software dependencies

The module depends on the following software components:

### Terraform version

- \>= v0.15

### Terraform providers


None

### Module dependencies


- cluster - interface github.com/cloud-native-toolkit/automation-modules#cluster
- mas_core - [github.com/cloud-native-toolkit/terraform-gitops-mas-core.git](https://github.com/cloud-native-toolkit/terraform-gitops-mas-core.git) (>= 1.2.0)

## Example usage

```hcl
module "util-mas-core-ready" {
  source = "github.com/cloud-native-toolkit/terraform-util-mas-core-ready"

  cluster_config_file = module.cluster.config_file_path
  core_namespace = module.gitops-mas-core.core_namespace
  entitlement_secret_name = module.gitops-mas-core.entitlement_secret_name
  mas_instance_id = module.gitops-mas-core.mas_instance_id
  mas_workspace_id = module.gitops-mas-core.mas_workspace_id
}

```

## Module details

### Inputs

| Name | Description | Required | Default | Source |
|------|-------------|---------|----------|--------|
| cluster_config_file | Cluster config file for Kubernetes cluster. | true |  | cluster.config_file_path |
| core_namespace | Namespace where mas-core operator has been installed. If not provided, the value will be derived from the mas_instance_id | true |  | mas_core.core_namespace |
| entitlement_secret_name | The name of the secret that contains the entitlement_key | true |  | mas_core.entitlement_secret_name |
| mas_instance_id | The instance id for the MAS suite | true |  | mas_core.mas_instance_id |
| mas_workspace_id | The identifier of the MAS workspace that was created | true |  | mas_core.mas_workspace_id |

### Outputs

| Name | Description |
|------|-------------|
| core_namespace | Namespace where mas-core operator has been installed |
| entitlement_secret_name | The name of the secret that contains the entitlement_key |
| mas_instance_id | The instance id for the MAS suite |
| mas_workspace_id | The identifier of the MAS workspace that was created |

## Resources

- [Documentation](https://operate.cloudnativetoolkit.dev)
- [Module catalog](https://modules.cloudnativetoolkit.dev)

> License: Apache License 2.0 | Generated by iascable (3.2.2)
