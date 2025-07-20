resource "aws_iam_role" "bastion_host_role" {
  name = "${var.project}-bastion-host-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy" "task_role_policy" {
  name   = "${var.project}-access-role-policy"
  role   = aws_iam_role.bastion_host_role.id
  policy = data.aws_iam_policy_document.role_access_policy.json
}

resource "aws_iam_instance_profile" "bastion_host_profile" {
  name = "${var.project}-bastion-host-profile"
  role = aws_iam_role.bastion_host_role.name
}