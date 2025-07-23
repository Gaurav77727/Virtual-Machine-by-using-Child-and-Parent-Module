module "Resource_Group" {
  source = "../Child MODULE/RG"
}

module "VNET" {
  source     = "../Child MODULE/VNET"
  depends_on = [module.RG]
}

module "Subnet" {
  source     = "../Child MODULE/SUBNET"
  depends_on = [module.VNET]
}


module "PUBLIC_IP" {
  source     = "../Child MODULE/PUBLIC IP"
  depends_on = [module.RG]
}

module "VM" {
  source     = "../Child MODULE/VM"
  depends_on = [module.Subnet, module.PUBLIC_IP]
}



