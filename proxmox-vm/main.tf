resource "proxmox_virtual_environment_vm" "this" {
  name        = var.name
  node_name   = var.node_name
  vm_id       = var.vm_id
  description = var.description

  clone {
    vm_id = var.template_vm_id
    full  = true
  }

  cpu {
    cores = var.cpu_cores
    type  = "host"
    numa  = true
  }

  memory {
    dedicated = var.memory
    floating  = 0
  }

  disk {
    datastore_id = var.datastore_id
    interface    = "scsi0"
    size         = var.disk_size
  }

  # Déclaré explicitement : sinon le provider veut retirer à chaque plan le VGA
  # hérité du template (serial0 pour les images cloud), ce qui crée une dérive permanente.
  vga {
    type   = var.vga_type
    memory = var.vga_memory
  }

  network_device {
    bridge = var.network_bridge
    model  = "virtio"
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.ip_address
        gateway = var.gateway
      }
    }

    dns {
      servers = [var.nameserver]
    }

    user_account {
      username = "root"
      keys     = [var.ssh_public_key]
    }
  }
}
