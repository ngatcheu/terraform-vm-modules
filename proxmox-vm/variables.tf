variable "name" {
  description = "Nom de la VM"
  type        = string
}

variable "vm_id" {
  description = "ID de la VM dans Proxmox"
  type        = number
}

variable "description" {
  description = "Description de la VM"
  type        = string
  default     = ""
}

variable "node_name" {
  description = "Nœud Proxmox cible"
  type        = string
}

variable "template_vm_id" {
  description = "ID du template à cloner"
  type        = number
  default     = 9100
}

# ===== CPU / RAM / Disque =====

variable "cpu_cores" {
  type = number
}

variable "memory" {
  description = "RAM en MB"
  type        = number
}

variable "disk_size" {
  description = "Taille du disque en GB"
  type        = number
}

variable "datastore_id" {
  description = "Datastore LVM-Thin cible"
  type        = string
}

# ===== Réseau =====

variable "network_bridge" {
  type = string
}

variable "ip_address" {
  description = "Adresse IP avec masque CIDR (ex: 192.168.1.113/24)"
  type        = string
}

variable "gateway" {
  type = string
}

variable "nameserver" {
  type = string
}

variable "ssh_public_key" {
  type      = string
  sensitive = true
}
