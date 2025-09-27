data "aws_route53_zone" "main" {
  zone_id = "Z03262043OWCCFMUNWBN9"
}

resource "aws_route53_record" "app" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "sorteador.fabiobartoli.com.br"
  type    = "A"

  alias {
    name                   = aws_lb.app.dns_name
    zone_id                = aws_lb.app.zone_id
    evaluate_target_health = true
  }
}


