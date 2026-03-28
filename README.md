# terraform-vm-modules

Ce repo contient les modules Terraform pour la création de VMs sur Proxmox.

## Modules disponibles

### `proxmox-vm`

Clone une VM à partir d'un template Proxmox et la configure via Cloud-Init.

**Provider requis :** [`bpg/proxmox`](https://registry.terraform.io/providers/bpg/proxmox/latest)

## Utilisation

```hcl
module "ma_vm" {
  source = "./proxmox-vm"

  name           = "web-01"
  vm_id          = 101
  description    = "Serveur web"
  node_name      = "pve"
  template_vm_id = 9100

  cpu_cores    = 2
  memory       = 2048
  disk_size    = 20
  datastore_id = "local-lvm"

  network_bridge = "vmbr0"
  ip_address     = "192.168.1.101/24"
  gateway        = "192.168.1.1"
  nameserver     = "1.1.1.1"

  ssh_public_key = file("~/.ssh/id_rsa.pub")
}
```

## Variables

| Nom | Description | Type | Défaut | Requis |
|-----|-------------|------|--------|--------|
| `name` | Nom de la VM | `string` | — | oui |
| `vm_id` | ID de la VM dans Proxmox | `number` | — | oui |
| `description` | Description de la VM | `string` | `""` | non |
| `node_name` | Nœud Proxmox cible | `string` | — | oui |
| `template_vm_id` | ID du template à cloner | `number` | `9100` | non |
| `cpu_cores` | Nombre de cœurs CPU | `number` | — | oui |
| `memory` | RAM en MB | `number` | — | oui |
| `disk_size` | Taille du disque en GB | `number` | — | oui |
| `datastore_id` | Datastore LVM-Thin cible | `string` | — | oui |
| `network_bridge` | Bridge réseau Proxmox | `string` | — | oui |
| `ip_address` | Adresse IP avec masque CIDR (ex: `192.168.1.10/24`) | `string` | — | oui |
| `gateway` | Passerelle par défaut | `string` | — | oui |
| `nameserver` | Serveur DNS | `string` | — | oui |
| `ssh_public_key` | Clé SSH publique (sensible) | `string` | — | oui |

## Outputs

| Nom | Description |
|-----|-------------|
| `vm_id` | ID de la VM créée |
| `name` | Nom de la VM créée |
| `ip_address` | Adresse IP de la VM |
