resource "aws_security_group" "main" {
#   count = length(var.sg_names)
#   name        = var.sg_names[count.index]
  name        = var.sg_names
  description = var.sg_descripition
  vpc_id      = var.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = merge(
    var.sg_tags,
    local.common_tags,
    {
        # Name = "${local.common_name}-${var.sg_names[count.index]}"
        Name = "${local.common_name}-${var.sg_names}"
    }
    
  )
}
