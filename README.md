# 🌐 Terraform Subnet Module

This module 🧰 handles the creation and fetching of Azure Subnets within a specified virtual network. It's designed to "create if not exist" - creating resources only when they don't already exist.

## Usage 🚀

```hcl
module "snet" {
  source                = "gribanj/snet/azure"
  create                = true
  name                  = "snet-xxxxxx-prod"
  resource_group_name   = "rg-xxxxxx-prod"
  virtual_network_name  = "vnet-xxxxxx-prod"
  address_prefixes      = ["10.0.1.0/24"]
  enable_delegation     = false  # Set to true to enable delegation
}
```

`create` variable is a flag 🚩 to determine whether the resource should be created.
If create is true ✅, the resource is created.
If create is false ❌, the module will try to fetch the data of an existing resource with the same name.

## Ternary Operator 🤔

This module makes use of the ternary operation, which is a simple form of if-else conditional logic. It's structured as follows:

`condition ? true_val : false_val`

- `condition`: This is a statement that evaluates to either true ✅ or false ❌.
- `true_val`: If the condition is true, this value will be used.
- `false_val`: If the condition is false, this value will be used.
  or instance, in the azurerm_virtual_network resource in this module, we use a ternary operation in the `count` parameter:

```hcl
count    = var.create ? 1 : 0

Here, var.create is the condition.
If var.create is true, the count will be 1, meaning one virtual network will be created.
If var.create is false, the count will be 0, meaning no virtual network will be created.
```

## Resources 🏗️

This module manages the following resources:

- `azurerm_subnet:` Manages a subnet.

## Input Variables 📥

- `create:` A boolean flag to create the subnet or fetch the data of an existing one.
- `name:` The name of the subnet.
- `resource_group_name:` The name of the resource group in which the subnet is located.
- `virtual_network_name:` The name of the virtual network in which the subnet resides.
- `address_prefixes:` A list of address prefixes for the subnet.
- `enable_delegation:` A boolean flag to enable delegation for the subnet.

<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.

## Providers

| Name                                                         | Version |
| ------------------------------------------------------------ | ------- |
| <a name="provider_azurerm"></a> [azurerm](#provider_azurerm) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                      | Type        |
| ------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [azurerm_subnet.snet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet)             | resource    |
| [azurerm_subnet.existing_snet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name                                                                                          | Description                                                                                      | Type           | Default | Required |
| --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | -------------- | ------- | :------: |
| <a name="input_address_prefixes"></a> [address_prefixes](#input_address_prefixes)             | The address space that is used the by the virtual network. You should input it in CIDR notation. | `list(string)` | n/a     |   yes    |
| <a name="input_create"></a> [create](#input_create)                                           | Boolean flag to control whether a new resource should be created                                 | `bool`         | `false` |    no    |
| <a name="input_name"></a> [name](#input_name)                                                 | The name of the subnet                                                                           | `string`       | n/a     |   yes    |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name)    | The name of the resource group where the virtual network will be created.                        | `string`       | n/a     |   yes    |
| <a name="input_virtual_network_name"></a> [virtual_network_name](#input_virtual_network_name) | The name of the virtual network                                                                  | `string`       | n/a     |   yes    |

## Outputs

| Name                                                                 | Description                                                  |
| -------------------------------------------------------------------- | ------------------------------------------------------------ |
| <a name="output_snet_output"></a> [snet_output](#output_snet_output) | The entire resource object, either existing or newly created |

<!-- END_TF_DOCS -->
