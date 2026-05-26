# -----------------------------------------------------
# Atom: IAM User
# Creates a single IAM user for service/machine access.
# -----------------------------------------------------
resource "aws_iam_user" "this" {
  count = module.this.enabled ? 1 : 0

  name          = module.this.id
  path          = var.path
  force_destroy = var.force_destroy

  tags = local.tags
}
