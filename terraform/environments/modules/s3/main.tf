#------------------------------------------------------------------------------
# written by: Miguel Afonso
#             https://www.linkedin.com/in/mmafonso/
#
# date: Aug-2021
#
# usage: create an AWS S3 bucket to offload Open edX file storage.
#------------------------------------------------------------------------------

locals {

  tags = merge(
    var.tags,
    module.cookiecutter_meta.tags,
    {
      "cookiecutter/module/source" = "openedx_devops/terraform/environments/modules/s3"
    }
  )

}

module "cookiecutter_meta" {
  source = "../../../../../../../common/cookiecutter_meta"
}
