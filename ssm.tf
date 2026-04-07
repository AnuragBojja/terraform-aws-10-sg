# resource "aws_ssm_parameter" "sg_ids" {
#   count = length(var.sg_names)
#   name  = "/${var.project_name}/${var.env}/sg_id/${var.sg_names[count.index]}"
#   type  = "String"
#   value = aws_security_group.main[count.index].id
# }
