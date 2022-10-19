provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "jenkins-master" {
  name = "jenkins"
  chart = "jenkins"
  repository = "https://charts.bitnami.com/bitnami"

  set {
    name = "service.type" 
    value = "LoadBalancer"
  }

  set {
    name = "jenkinsUser"
    value = "admin"
  }
  set {
    name = "jenkinsPassword"
    value = "admin"
  }
}