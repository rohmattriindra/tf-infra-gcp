project_id              = "staging-tech-dev-382405"
region                  = "asia-southeast1"
network                 = "projects/staging-tech-dev-382405/global/networks/vpc-staging"



network_name            = "vpc-staging"
 //value firewall rules
rules =   [{
    name                    = "gitlab-runner-to-vault"
    description             = null
    direction               = "INGRESS"
    priority                = 900
    ranges                  = null
    source_tags             = ["gitlab-runner"]
    source_service_accounts = null
    target_tags             = ["vault"]
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["8200"]
    }]
    deny = []
    log_config = null
  },
  
  {
    name                    = "rmt-preprod-allow-bastion-to-all"
    description             = null
    direction               = "INGRESS"
    priority                = "900"
    ranges                  = null
    source_tags             = ["bastion-rmtool"]
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "all"
      ports = []
    }]
    deny = []
    log_config = null
  },

    {
    name                    = "allow-ssh-any"
    description             = null
    direction               = "INGRESS"
    priority                = "900"
    ranges                  = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "all"
      ports = []
    }]
    deny = []
    log_config = null
  },
  {
    name                    = "rmt-preprod-allow-infraprovivioner-to-all"
    description             = null
    direction               = "INGRESS"
    priority                = "900"
    ranges                  = ["0.0.0.0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports = ["22", "4141", "80", "443"]
    }]
    deny = []
    log_config = null
  }]