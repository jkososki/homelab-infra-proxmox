output "cluster" {
  value = merge(var.config.cluster, {
    controlplane_nodes = {
      for name, node in var.config.cluster.controlplane_nodes :
      name => merge(node, { patches = [for p in node.patches : yamlencode(p)] })
    }
    worker_nodes = {
      for name, node in var.config.cluster.worker_nodes :
      name => merge(node, { patches = [for p in node.patches : yamlencode(p)] })
    }
  })
}

output "apps_init" {
  value = var.config.apps_init
}

output "apps_repository" {
  value = var.config.apps_repository
}
