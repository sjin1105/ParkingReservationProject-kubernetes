terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://192.168.55.240:8006/api2/json"
  pm_api_token_id = "sjin1105@pam!new_token_id"
  pm_api_token_secret = "439-422c"
  pm_parallel = 2
}

resource "proxmox_vm_qemu" "gui" {
  vmid = "200"
  name  = "test"
  target_node = "sjin1105"
  os_type  = "ubuntu"
  cpu = "kvm64"
  cores    = var.control_core
  sockets  = var.socket
  memory   = var.test_memory
  scsihw   = "virtio-scsi-pci"
  oncreate = false
  iso = "local:iso/ubuntu-20.04.5-desktop-amd64.iso"
  
  disk {
    size         = "30G"
    type         = "scsi"
    storage      = "local"
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
  }
}

resource "proxmox_vm_qemu" "control" {
  count = var.control_count
  vmid = "21${count.index}"
  name  = "control${count.index}"
  target_node = "sjin1105"
  os_type  = var.os_type
  cpu = "kvm64"
  cores    = var.control_core
  sockets  = var.socket
  memory   = var.control_memory
  scsihw   = "virtio-scsi-pci"
  oncreate = false
  clone = var.clone
  ipconfig0 = "ip=192.168.55.21${count.index}/24,gw=192.168.55.1"
  full_clone = "true"
}


resource "proxmox_vm_qemu" "service" {
  count = var.service_count
  vmid = "22${count.index}"
  name  = "service${count.index}"
  target_node = "sjin1105"
  os_type  = var.os_type
  cpu = "kvm64"
  cores    = var.service_core
  sockets  = var.socket
  memory   = var.service_memory
  scsihw   = "virtio-scsi-pci"
  oncreate = false
  clone = var.clone
  ipconfig0 = "ip=192.168.55.22${count.index}/24,gw=192.168.55.1"
  full_clone = "true"
}
