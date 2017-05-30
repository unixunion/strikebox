// Create popular profiles (convenience module)
module "profiles" {
  source                  = "../modules/profiles"
  matchbox_http_endpoint  = "${var.matchbox_http_endpoint}"
  container_linux_version = "1353.7.0"
  container_linux_channel = "stable"
}

// Install Container Linux to disk before provisioning
resource "matchbox_group" "default" {
  name    = "default"
  profile = "${module.profiles.cached-container-linux-install}"

  // No selector, matches all nodes
  metadata {
    container_linux_channel = "stable"
    container_linux_version = "1353.7.0"
    container_linux_oem     = "${var.container_linux_oem}"
    ignition_endpoint       = "${var.matchbox_http_endpoint}/ignition"
    baseurl                 = "${var.matchbox_http_endpoint}/assets/coreos"
    ssh_authorized_key      = "${var.ssh_authorized_key}"
  }
}

// Create matcher groups for 3 machines

resource "matchbox_group" "etcd-1" {
  name    = "etcd-1"
  profile = "${module.profiles.etcd3}"

  selector {
    mac = "08:00:27:47:13:55"
    os  = "installed"
  }

  metadata {
    domain_name          = "etcd-1.psimax.local"
    etcd_name            = "etcd-1"
    etcd_initial_cluster = "etcd-1=http://etcd-1.psimax.local:2380,etcd-2=http://etcd-2.psimax.local:2380"
    ssh_authorized_key   = "${var.ssh_authorized_key}"
  }
}

resource "matchbox_group" "etcd-2" {
  name    = "etcd-2"
  profile = "${module.profiles.etcd3}"

  selector {
    mac = "08:00:27:50:F7:59"
    os  = "installed"
  }

  metadata {
    domain_name          = "etcd-2.psimax.local"
    etcd_name            = "etcd-2"
    etcd_initial_cluster = "etcd-1=http://etcd-1.psimax.local:2380,etcd-2=http://etcd-2.psimax.local:2380"
    ssh_authorized_key   = "${var.ssh_authorized_key}"
  }
}
