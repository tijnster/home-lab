module "virtual_machines" {
  source = "./modules/vm"
  host = var.host
  vm_image = var.vm_image
  ssh_key = var.ssh_key
  vm_name = var.vm_name
}