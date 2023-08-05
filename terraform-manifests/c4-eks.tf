module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.4"

  cluster_name = "my-eks"
  cluster_version = "1.26"

   cluster_endpoint_private_access = true
   cluster_endpoint_public_access  = true

   vpc_id = module.vpc.vpc_id
   subnet_ids = module.vpc.private_subnets

   enable_irsa = true

   #EKS managed Node groups
   eks_managed_node_group_defaults = {
    disk_size = 50
   }

   eks_managed_node_groups = {
    #general = {
    min_size = 1
    desired_size = 1
    max_size = 2

    #labels = {
       # role = "general"        
    #}
    instance_types = ["t3.micro"]
    capacity_type  = "ON_DEMAND"
   #}   
    #tags = {
    #Environment = "staging"
  #}
}
}