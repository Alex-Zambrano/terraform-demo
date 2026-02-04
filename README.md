# terraform-demo
demo de terraform

SANDBOX DE CLOUD GURU

    ENTRAR POR PESTAÑA DE INCOGNITO CON CREDENCIALES

TERMINAL
    az login --use-device-code
    az group list --query [].name       Obtiene grupo de recursos
    az account show --query id -o tsv   Obtiene suscripcion
    az account show --query tenantId --output tsv Obtiene Tenant

    az ad sp create-for-rbac --name terraform-cloud-free-sp --role Contributor --scopes /subscriptions/0cfe2870-d256-4119-b0a3-16293ac11bdc

    az ad sp create-for-rbac \
  --name terraform-sandbox-sp \
  --role Contributor \
  --scopes /subscriptions/0cfe2870-d256-4119-b0a3-16293ac11bdc/resourceGroups/1-0e05672a-playground-sandbox
