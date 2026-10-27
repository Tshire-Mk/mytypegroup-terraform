resource "cloudflare_dns_record" "mx" {
  zone_id = data.cloudflare_zone.mytype.id
  name = "mytypegroup.com"
  type = "MX"
  content = "mx8007084233.spe.ucebox.co.za"
  priority = 10
  ttl = 1
  proxied = false
}

resource "cloudflare_dns_record" "srv_autodiscover" {
  zone_id = data.cloudflare_zone.mytype.id
  name = "_autodiscover._tcp.mytypegroup.com"
  type = "SRV"
  data = {
    priority = 0
    weight = 0
    port = 443
    target = "envoy.aserv.co.za"
  }
  ttl = 1
  proxied = false
  lifecycle {
    ignore_changes = [tags, priority]
  }
}

resource "cloudflare_dns_record" "srv_imaps" {
  zone_id = data.cloudflare_zone.mytype.id
  name = "_imaps._tcp.mytypegroup.com"
  type = "SRV"
  data = {
    priority = 0
    weight = 1
    port = 993
    target = "envoy.aserv.co.za"
  }
  ttl = 1
  proxied = false
  lifecycle {
    ignore_changes = [tags, priority]
  }
}

resource "cloudflare_dns_record" "srv_submission" {
  zone_id = data.cloudflare_zone.mytype.id
  name = "_submission._tcp.mytypegroup.com"
  type = "SRV"
  data = {
    priority = 0
    weight = 1
    port = 25
    target = "envoy.aserv.co.za"
  }
  ttl = 1
  proxied = false
  lifecycle {
    ignore_changes = [tags, priority]
  }
}

resource "cloudflare_dns_record" "txt_dmarc" {
  zone_id = data.cloudflare_zone.mytype.id
  name = "_dmarc.mytypegroup.com"
  type = "TXT"
  content = "\"v=DMARC1; p=none; fo=0; adkim=s; aspf=s\""
  ttl = 1
  proxied = false
}

resource "cloudflare_dns_record" "txt_spf" {
  zone_id = data.cloudflare_zone.mytype.id
  name = "mytypegroup.com"
  type = "TXT"
  content = "\"v=spf1 include:spf.aserv.co.za +a +mx -all\""
  ttl = 1
  proxied = false
}

resource "cloudflare_dns_record" "txt_mailconf" {
  zone_id = data.cloudflare_zone.mytype.id
  name = "mytypegroup.com"
  type = "TXT"
  content = "\"mailconf=https://envoy.aserv.co.za/mail/config-v1.1.xml\""
  ttl = 1
  proxied = false
}



