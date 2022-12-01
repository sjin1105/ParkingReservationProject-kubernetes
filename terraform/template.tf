terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://192.168.55.182:8006/api2/json"
  pm_api_token_id = "sjin1105@pam!token_id"
  pm_api_token_secret = "43915eff-9d8a-422c-ab4b-98e602dc14d9"
}

resource "proxmox_vm_qemu" "hello_world" {
  vmid = "1010"
  name  = "web04"
  target_node = "sjin1105"
  os_type  = "cloud-init"
  cores    = "1"
  sockets  = "1"
  memory   = "1024"
  scsihw   = "virtio-scsi-pci"
  oncreate = "false"
  clone = "ubuntu-tmp"
  bootdisk = "scsi0"
  ipconfig0 = "ip=192.168.55.20/24,gw=192.168.55.1"

  network {
    model = "virtio"
    bridge = "vmbr0"
  }
}
