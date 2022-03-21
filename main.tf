# module "prod_cluster" {
#     source          = "./aks_cluster"
#     env_name        = "prod"
#     cluster_name    = "aks_cluster"
#     subscription_id = var.subscription_id
#     client_id       = var.client_id
#     client_secret   = var.client_secret
#     tenant_id       = var.tenant_id 
# }

module "dev_cluster" {
    source          = "./aks_cluster"
    env_name        = "dev"
    cluster_name    = "aks_cluster"
    subscription_id = var.subscription_id
    client_id       = var.client_id
    client_secret   = var.client_secret
    tenant_id       = var.tenant_id 

}