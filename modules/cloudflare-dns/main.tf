terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

resource "cloudflare_record" "site" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "CNAME"
  content = var.s3_bucket_domain
  ttl     = 1
  proxied = true
}

resource "cloudflare_zone_settings_override" "settings" {
  zone_id = var.zone_id
  settings {
    ssl              = "flexible"
    always_use_https = "on"
    min_tls_version  = "1.2"
  }
}