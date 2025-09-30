

# Helm application
resource "argocd_application" "helm" {
  metadata {
    name      = "helm-app-using-terraform"
    namespace = "argocd"
    labels = {
      test = "true"
    }
  }

  spec {
    destination {
      server    = "https://kubernetes.default.svc"
      namespace = "default"
    }

    source {
      repo_url        = "https://github.com/truongminhquan/argocd-applications.git"
      path            = "helm/nginx"
      target_revision = "main"
      helm {
        value_files = ["custom-values.yaml"]
      }
    }
  }
}
