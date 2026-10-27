\# mytypegroup.com — Cloudflare DNS as Code



Infrastructure as Code for `mytypegroup.com`, hosted on GitHub Pages.



This repo manages the Cloudflare DNS for mytypegroup.com using Terraform, so the entire DNS setup is versioned, reviewable and reproducible.



\## What it does



\- \*\*17 DNS records\*\* managed in Terraform (out of 18 live)

&#x20;   - 4x A records for root `mytypegroup.com` → GitHub Pages IPs `185.199.108.111` (proxied)

&#x20;   - `www` CNAME → `tshire-mk.github.io` (proxied)

&#x20;   - Mail: `mail`, `ftp`, `webmail` A records → `197.242.159.145` (DNS only)

&#x20;   - Mail config: `autoconfig`, `autodiscover` CNAME → `envoy.aserv.co.za`

&#x20;   - MX record → `mx8007084233.spe.ucebox.co.za` (priority 10)

&#x20;   - SRV records for `\_autodiscover`, `\_imaps`, `\_submission`

&#x20;   - TXT: SPF, DMARC, mailconf

\- \*\*1 record left manual:\*\* DKIM TXT (415-char key breaks Terraform HCL parser — intentionally left in Cloudflare dashboard, still live)



\## Stack



\- Cloudflare DNS + Cloudflare Provider v5.28.1

\- Terraform

\- GitHub Pages hosting

\- GitHub for version control



\## Files



\- `main.tf` — Provider, zone, root + www + mail A/CNAME records (Day 1)

\- `records8.tf` — MX, SRV and TXT mail records (Day 2)

\- `terraform.tfstate` — ignored, state is local



\## Usage



```bash

\# Set token (53 chars)

$env:CLOUDFLARE\_API\_TOKEN = 'your\_token\_here'



terraform init

terraform validate

terraform plan   # No changes. Your infrastructure matches the configuration.

terraform apply

