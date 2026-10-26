terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
  }
}

provider "cloudflare" {}

data "cloudflare_zone" "mytype" {
  filter = {
    name = "mytypegroup.com"
  }
}

resource "cloudflare_dns_record" "gh_108" {
  zone_id = data.cloudflare_zone.mytype.id
  name    = "mytypegroup.com"
  type    = "A"
  content = "185.199.108.153"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "gh_109" {
  zone_id = data.cloudflare_zone.mytype.id
  name    = "mytypegroup.com"
  type    = "A"
  content = "185.199.109.153"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "gh_110" {
  zone_id = data.cloudflare_zone.mytype.id
  name    = "mytypegroup.com"
  type    = "A"
  content = "185.199.110.153"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "gh_111" {
  zone_id = data.cloudflare_zone.mytype.id
  name    = "mytypegroup.com"
  type    = "A"
  content = "185.199.111.153"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "www" {
  zone_id = data.cloudflare_zone.mytype.id
  name    = "www"
  type    = "CNAME"
  content = "tshire-mk.github.io"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "mail" {
  zone_id = data.cloudflare_zone.mytype.id
  name    = "mail"
  type    = "A"
  content = "197.242.159.145"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "ftp" {
  zone_id = data.cloudflare_zone.mytype.id
  name    = "ftp"
  type    = "A"
  content = "197.242.159.145"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "webmail" {
  zone_id = data.cloudflare_zone.mytype.id
  name    = "webmail"
  type    = "A"
  content = "197.242.159.145"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "autoconfig" {
  zone_id = data.cloudflare_zone.mytype.id
  name    = "autoconfig"
  type    = "CNAME"
  content = "envoy.aserv.co.za"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "autodiscover" {
  zone_id = data.cloudflare_zone.mytype.id
  name    = "autodiscover"
  type    = "CNAME"
  content = "envoy.aserv.co.za"
  proxied = false
  ttl     = 1
}