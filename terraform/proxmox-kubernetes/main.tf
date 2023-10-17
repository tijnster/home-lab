# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "kubernetes-master" {
    
    # VM General Settings
    target_node = var.host
    name = "kubernetes-master"
    desc = "kubernetes-master"
    count = 1

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
    ipconfig0 = "ip=192.168.178.5${count.index + 1}/24,gw=192.168.178.1"
    
    # (Optional) Default User
    ciuser = "mart"
    
    # (Optional) Add your SSH KEY
    sshkeys = <<EOF
    ${var.ssh_key}
    EOF
}

resource "proxmox_vm_qemu" "kubernetes-worker" {
    
    # VM General Settings
    target_node = var.host
    name = "kubernetes-worker${count.index + 1}"
    desc = "kubernetes-worker"
    count = 2

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
    ipconfig0 = "ip=192.168.178.4${count.index + 1}/24,gw=192.168.178.1"
    
    # (Optional) Default User
    ciuser = "mart"
    
    # (Optional) Add your SSH KEY
    sshkeys = <<EOF
    ${var.ssh_key}
    EOF
}
