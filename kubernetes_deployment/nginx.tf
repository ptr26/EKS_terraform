

resource "kubernetes_namespace" "nginx-test" {
  metadata {
    name = "nginx-test"
  }
}

resource "kubernetes_deployment" "nginx-test" {
  metadata {
    name = "nginx"
    namespace = kubernetes_namespace.nginx-test.metadata.0.name
    labels = {
      test = "MyExampleApp"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        test = "MyExampleApp"
      }
    }

    template {
      metadata {
        labels = {
          test = "MyExampleApp"
        }
      }

      spec {
        container {
          image = "nginx:1.21.6"
          name  = "nginx-container"

          }
        }
      }
    }
  }

  resource "kubernetes_service" "nginx-test" {
    metadata {
      name = "nginx-test"
    }

    spec {
      port {
        port = 80
        target_port = 8090
      }

      type = "LoadBalancer"
    }
  }
