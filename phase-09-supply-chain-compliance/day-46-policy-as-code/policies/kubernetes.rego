package main

deny contains msg if {
  input.kind == "Deployment"
  some container in input.spec.template.spec.containers
  container.securityContext.privileged == true
  msg := sprintf("container %q must not run privileged", [container.name])
}

deny contains msg if {
  input.kind == "Deployment"
  some container in input.spec.template.spec.containers
  endswith(container.image, ":latest")
  msg := sprintf("container %q must use a pinned image tag, not latest", [container.name])
}

deny contains msg if {
  input.kind == "Deployment"
  some container in input.spec.template.spec.containers
  not container.securityContext.runAsNonRoot
  msg := sprintf("container %q should set runAsNonRoot", [container.name])
}
