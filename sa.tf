provider "kubernetes" {
  config_path    = pathexpand(var.kind_cluster_config_path)
  config_context = "kind-terraform"
}

resource "kubernetes_manifest" "serviceaccount_kube_system_metrics_server" {
  manifest = {
    "apiVersion" = "v1"
    "kind"       = "ServiceAccount"
    "metadata" = {
      "labels" = {
        "k8s-app" = "metrics-server"
      }
      "name"      = "metrics-server"
      "namespace" = "kube-system"
    }
  }
}