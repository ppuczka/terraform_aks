output "id" {
  value = azurerm_kubernetes_cluster.az_aks_cluster.id
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.az_aks_cluster.kube_config_raw
  sensitive = true
}

output "client_key" {
  value = azurerm_kubernetes_cluster.az_aks_cluster.kube_config.0.client_key
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.az_aks_cluster.kube_config.0.client_certificate
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.az_aks_cluster.kube_config.0.cluster_ca_certificate
}

output "host" {
  value = azurerm_kubernetes_cluster.az_aks_cluster.kube_config.0
}

resource "local_file" "kubeconfig" {
  depends_on   = [azurerm_kubernetes_cluster.az_aks_cluster]
  filename     = "kubeconfig"
  content      = azurerm_kubernetes_cluster.az_aks_cluster.kube_config_raw
}