# Terraform Azure Infrastructure Deployment

Este proyecto utiliza Terraform para desplegar una infraestructura en Azure, organizada en módulos.
Los módulos principales incluyen la creación de un rg, una vnet, subredes, una interfaz de red, un grupo de nsg, un Key Vault y un storage account.

# Consideraciones
Para la implementación y ejecución de este módulo se está utilizando Service Principal como método de conexión 
Para establecer una conexión segura y gestión de identidades de Github action e Azure, se debe habilitar Federated credentials para el Service Principal
Declarar un nuevo prefix en el archivo .tfvars para que los recursos tengan nombre unicos.

## Workflow de GitHub Actions
El flujo de trabajo se ejecuta automáticamente cuando se realiza un pull request desde la rama `aplicacion #` a la rama `main`.

## Módulos

Este proyecto utiliza varios módulos, cada uno en su propio directorio:

- `tranzact_keyvault`
- `tranzact_nic`
- `tranzact_nsg`
- `tranzact_rg`
- `tranzact_storage_account`
- `tranzact_subnet`
- `tranzact_subnet_nsg`
- `tranzact_vnet`


## Estructura del Proyecto.
```plaintext
            ├── .github
            │   └── workflows
            │       └── deploy.yml
            ├── tranzact_keyvault
            │   ├── main.tf
            │   ├── variables.tf
            │   └── outputs.tf
            ├── tranzact_nic
            │   ├── main.tf
            │   ├── variables.tf
            │   └── outputs.tf
            ├── tranzact_nsg
            │   ├── main.tf
            │   ├── variables.tf
            │   └── outputs.tf
            ├── tranzact_rg
            │   ├── main.tf
            │   ├── variables.tf
            │   └── outputs.tf
            ├── tranzact_storage_account
            │   ├── main.tf
            │   ├── variables.tf
            │   └── outputs.tf
            ├── tranzact_subnet
            │   ├── main.tf
            │   ├── variables.tf
            │   └── outputs.tf
            ├── tranzact_subnet_nsg
            │   ├── main.tf
            │   ├── variables.tf
            │   └── outputs.tf
            ├── tranzact_vnet
            │   ├── main.tf
            │   ├── variables.tf
            │   └── outputs.tf
            ├── README.md
            ├── backend.tf
            ├── main.tf
            ├── provider.tf
            ├── terraform.tfvars
            └── variables.tf