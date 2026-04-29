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

# The cloudflare_zone_settings_override resource is removed because the 
# Cloudflare v4 provider often errors on "read-only" settings (like http2) 
# when used with Free Plan accounts. 
# 
# MANUAL ACTION REQUIRED:
# 1. Set SSL/TLS to "Flexible" in the Cloudflare Dashboard.
# 2. Enable "Always Use HTTPS" in the SSL/TLS > Edge Certificates tab.
# Uncomment for cloudflare paid subscription
# resource "cloudflare_zone_settings_override" "settings" {
#   zone_id = var.zone_id
#   settings {
#     ssl              = "flexible"
#     always_use_https = "on"
#     min_tls_version  = "1.2"
#   }
# }