#------------------------------------------------------------------------------
# written by: Miguel Afonso
#             https://www.linkedin.com/in/mmafonso/
#
# date: Aug-2021
#
# usage: create an AWS S3 bucket to offload Open edX file storage.
#------------------------------------------------------------------------------

module "openedx_secrets" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.6"

  bucket = var.resource_name_secrets
  object_ownership = "BucketOwnerPreferred"
  acl    = "private"

  tags = merge(
    local.tags,
    {
      "cookiecutter/resource/source"  = "terraform-aws-modules/s3-bucket/aws"
      "cookiecutter/resource/version" = "3.6"
    }
  )

  block_public_acls   = true
  block_public_policy = true

}
