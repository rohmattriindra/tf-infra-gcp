project_id              = "staging-tech-dev-382405"
region                  = "asia-southeast1"
network                 = "projects/staging-tech-dev-382405/global/networks/vpc-staging"


network_name = "vpc-staging"
network_vpcs = [{
    network_name             = "vpc-staging"
    routing_mode             = "GLOBAL"
    description              = null
    auto_create_subnetworks  = false
    delete_default_internet_gateway_routes = false
    mtu = 0
}]

//value for subnet
network_vpc_name = "vpc-staging"
subnets = [
        {
            subnet_name                  = "subnet-vm-staging-1"
            subnet_ip                    = "172.24.129.64/27"
            subnet_region                = "asia-southeast1"
            subnet_flow_logs             = "false"
            subnet_flow_logs_interval    = null
            subnet_flow_logs_sampling    = null
            subnet_flow_logs_metadata    = null
            subnet_flow_logs_filter_expr = null
			      subnet_private_access = true
            log_config                   = "false"
        },
        {
            subnet_name                  = "subnet-vm-staging-2"
            subnet_ip                    = "172.24.129.96/27"
            subnet_region                = "asia-southeast1"
            subnet_flow_logs             = "false"
            subnet_flow_logs_interval    = null
            subnet_flow_logs_sampling    = null
            subnet_flow_logs_metadata    = null
            subnet_flow_logs_filter_expr = null
		    subnet_private_access        = true
            log_config                   = "false"
        },
        {
            subnet_name                  = "subnet-vm-staging-3"
            subnet_ip                    = "172.24.129.128/27"
            subnet_region                = "asia-southeast1"
            subnet_flow_logs             = "false"
            subnet_flow_logs_interval    = null
            subnet_flow_logs_sampling    = null
            subnet_flow_logs_metadata    = null
            subnet_flow_logs_filter_expr = null
			      subnet_private_access = true
            log_config                   = "false"
        },
        {
            subnet_name                  = "subnet-vm-staging-4"
            subnet_ip                    = "172.24.200.0/24"
            subnet_region                = "asia-southeast1"
            subnet_flow_logs             = "false"
            subnet_flow_logs_interval    = null
            subnet_flow_logs_sampling    = null
            subnet_flow_logs_metadata    = null
            subnet_flow_logs_filter_expr = null
			      subnet_private_access = true
            log_config                   = "false"
        },
        {
            subnet_name                  = "subnet-ilb-l7-staging-1"
            subnet_ip                    = "172.24.138.0/23"
            subnet_region                = "asia-southeast1"
            subnet_flow_logs             = "false"
            subnet_flow_logs_interval    = null
            subnet_flow_logs_sampling    = null
            subnet_flow_logs_metadata    = null
            subnet_flow_logs_filter_expr = null
			subnet_private_access        = false
            log_config                   = "false"
            role                         = "ACTIVE"
        }

    ]

    secondary_ranges = {
        cluster-staging-1 = [
            {
                range_name    = "staging-pod-1"
                ip_cidr_range = "10.125.160.0/20"
            },
            {
                range_name    = "staging-services-1"
                ip_cidr_range = "10.124.6.0/24"
            },
        ],

        cluster-staging-2 = [
            {
                range_name    = "staging-pod-2"
                ip_cidr_range = "10.125.176.0/20"
            },
            {
                range_name    = "staging-services-2"
                ip_cidr_range = "10.124.7.0/24"
            },
        ],

        cluster-staging-3 = [
            {
                range_name    = "staging-pod-3"
                ip_cidr_range = "10.125.192.0/20"
            },
            {
                range_name    = "staging-services-3"
                ip_cidr_range = "10.124.8.0/24"
            },
        ],
        cluster-staging-4 = [
            {
                range_name    = "staging-pod-4"
                ip_cidr_range = "10.125.208.0/20"
            },
            {
                range_name    = "staging-services-4"
                ip_cidr_range = "10.124.9.0/24"
            },
        ],
        cluster-staging-5 = [
            {
                range_name    = "staging-pod-5"
                ip_cidr_range = "10.123.224.0/20"
            },
            {
                range_name    = "staging-services-5"
                ip_cidr_range = "10.128.13.0/24"
            },
        ]


    }
    