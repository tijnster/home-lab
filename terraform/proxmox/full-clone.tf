# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "terraform-test-vm" {
    
    # VM General Settings
    target_node = "proxmox"
    name = "terraform"
    desc = "terraform-test"

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = "ubuntu-server-jammy"

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
    ipconfig0 = "ip=192.168.178.90/24"
    
    # (Optional) Default User
    ciuser = "mart"
    
    # (Optional) Add your SSH KEY
    sshkeys = <<EOF
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDCvfCtwkh8LvXTox+ofHmL0BLmdf5JI8uLJslxfe+a6zcIZE6V1e//PifzHORNh8s95+fVoqPG3QOxfMeDZcAJmWqO7jeUAmMgu6ALjZpnlUHBOdiDqZx08pO+Ve0IhpghbCZkVyWlqNZwbrLPJ3MHgdYhsS+LOyMm3pIFEVWLVpCf69GqWj2pa5NbVvggNJakaY+QENbSClc1GmGt+usk3/gGyiwHzYK/I/XK1uzrcYbm7U0i0vy4QRs7qJptktxvuqRfNjQX0Btmg4c0ukZiiWqpppX6/Y1BbU9uCEuPD6AQ6yr2U+X+qR2YMcb22tjgn6BGVFNiQL1IZuBmQvM5il9ZJr07vGazSEd5vKVmGlYv7qNovtinGT1PJCKmD0sCoGd7Wn87ok69OEA4vLx/PUzWVIxoqzVunQYvATtTQlDUuqEKi+ygRj4JdUif9SwihUx5Y+o140EtTjAI780ERT/F6MK6ebyj2gcCjpiVIL0EpSQQUXXrZGKrYEY+sls= martijnbunschoten@MacBook-Pro-van-martijn.local

    EOF
}
