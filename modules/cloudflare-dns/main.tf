resource "cloudflare_record" "site" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "CNAME"
  content = var.s3_bucket_domain
  ttl     = 1
  proxied = true
}

resource "cloudflare_zone_setting" "ssl" {
  zone_id    = var.zone_id
  setting_id = "ssl"
  value      = "strict"
}

resource "cloudflare_zone_setting" "always_use_https" {
  zone_id    = var.zone_id
  setting_id = "always_use_https"
  value      = "on"
}