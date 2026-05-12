# terraform-aws-10-sg — Reusable Security Group Module

A lightweight, reusable Terraform module for creating named, tagged AWS Security Groups within a target VPC. Designed to be called once per service with a unique `sg_name`, enabling per-service SG isolation across the RoboShop architecture.

## What This Module Creates

- One `aws_security_group` per call, named and tagged consistently
- Open egress (`0.0.0.0/0`) by default — ingress rules managed by the consuming module
- Tags merged from `var.sg_tags`, `local.common_tags`, and a computed `Name`

## File Structure

```
terraform-aws-10-sg/
├── main.tf        # aws_security_group resource
├── variables.tf   # sg_names, sg_description, vpc_id, sg_tags
├── locals.tf      # common_name, common_tags
├── data.tf        # Data sources
├── outputs.tf     # sg_id exported for use by service modules
├── provider.tf    # AWS provider
└── ssm.tf         # Writes sg_id to SSM for cross-module consumption
```

## Key Design Patterns

- **Per-service SG** — called once per service (catalogue, cart, user, etc.) keeping security boundaries explicit
- **SSM-backed outputs** — `sg_id` written to SSM Parameter Store so the service config module can look it up by service name without hard-coding ARNs
- **Consistent tagging** — `merge(var.sg_tags, local.common_tags, { Name = "${common_name}-${sg_name}" })`

## Usage

```hcl
module "catalogue_sg" {
  source         = "git::https://github.com/AnuragBojja/terraform-aws-10-sg.git"
  sg_names       = "catalogue"
  sg_descripition = "Security group for catalogue service"
  vpc_id         = module.vpc.vpc_id
  sg_tags        = { Service = "catalogue" }
}
```

---

**Author:** Anurag Bojja | [LinkedIn](https://www.linkedin.com/in/anurag-bojja-81a405192/) | [GitHub](https://github.com/AnuragBojja)
