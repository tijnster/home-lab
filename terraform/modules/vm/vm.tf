terraform {

    required_version = ">= 0.13.0"

    required_providers {
        proxmox = {
            source = "telmate/proxmox"
        }
    }
}

resource "proxmox_vm_qemu" "virtual_machine" {
    
    # VM General Settings
    target_node = var.host
    name = var.name[count.index]
    count = 3

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = var.vm_image

    # VM System Settings
    agent = 1
    
    # VM CPU Settings
    cores = 4
    sockets = 1
    cpu = "host"    
    
    # VM Memory Settings
    memory = 4092

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    ipconfig0 = "ip=192.168.178.2${count.index + 1}/24,gw=192.168.178.1"
    
    # (Optional) Default User
    ciuser = "mart"
    
    # (Optional) Add your SSH KEY
    sshkeys = <<EOF
    ${var.ssh_key}
    EOF
}
