variable "proxmox_api_url" {
    default = "proxmox_url"
}

variable "proxmox_api_token_id" {
    default = "terraform"
}

variable "proxmox_api_token_secret" {
    default = "my-token"
}

variable "host" {
    default = "proxmox"
}

variable "vm_image" {
    default = "ubuntu-server-jammy"
}

variable "ssh_key" {
  default = "my_ssh_key"
}

variable "vm_name" {
    type = list
    default = ["kubernetes-master", "kubernetes-worker1", "kubernetes-worker2"]
}
