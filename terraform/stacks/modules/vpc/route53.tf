data "aws_route53_zone" "root_domain" {
  name = var.root_domain
}

resource "aws_route53_zone" "services_subdomain" {
  name = var.services_subdomain
  tags = merge(
    local.tags,
    {
      "cookiecutter/resource/source"  = "hashicorp/aws/aws_route53_zone"
      "cookiecutter/resource/version" = "4.48"
    }
  )
}


resource "aws_route53_record" "admin_domain_ns" {
  zone_id = data.aws_route53_zone.root_domain.zone_id
  name    = aws_route53_zone.services_subdomain.name
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.services_subdomain.name_servers
}
