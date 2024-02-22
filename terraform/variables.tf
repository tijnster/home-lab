variable "proxmox_api_url" {
    default = "proxmox_url"
}

variable "proxmox_api_token_id" {
    default = "root@pam!terraform"
}

variable "proxmox_api_token_secret" {
    default = "my_token"
}

variable "host" {
    default = "proxmox"
}

variable "vm_name" {
    default = "my_vm"
}

variable "vm_image" {
    default = "ubuntu-server-jammy"
}

variable "ssh_key" {
  default = "my_ssh_key"
}
