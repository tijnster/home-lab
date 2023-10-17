resource "proxmox_vm_qemu" "kubernetes-master" {
    
    # VM General Settings
    target_node = var.host
    name = "utilities-vm"
    desc = "wireguard, nginx proxy manager"
    count = 1

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = var.vm_image

    # VM System Settings
    agent = 1
    
    # VM CPU Settings
    cores = 2
    sockets = 1
    cpu = "host"    
    
    # VM Memory Settings
    memory = 2046

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    ipconfig0 = "ip=192.168.178.6${count.index + 1}/24,gw=192.168.178.1"
    
    # (Optional) Default User
    ciuser = "mart"
    
    # (Optional) Add your SSH KEY
    sshkeys = <<EOF
    ${var.ssh_key}
    EOF
}
