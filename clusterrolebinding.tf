resource "kubernetes_manifest" "clusterrolebinding_metrics_server_system_auth_delegator" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "ClusterRoleBinding"
    "metadata" = {
      "labels" = {
        "k8s-app" = "metrics-server"
      }
      "name" = "metrics-server:system:auth-delegator"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind"     = "ClusterRole"
      "name"     = "system:auth-delegator"
    }
    "subjects" = [
      {
        "kind"      = "ServiceAccount"
        "name"      = "metrics-server"
        "namespace" = "kube-system"
      },
    ]
  }
}

resource "kubernetes_manifest" "clusterrolebinding_system_metrics_server" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "ClusterRoleBinding"
    "metadata" = {
      "labels" = {
        "k8s-app" = "metrics-server"
      }
      "name" = "system:metrics-server"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind"     = "ClusterRole"
      "name"     = "system:metrics-server"
    }
    "subjects" = [
      {
        "kind"      = "ServiceAccount"
        "name"      = "metrics-server"
        "namespace" = "kube-system"
      },
    ]
  }
}