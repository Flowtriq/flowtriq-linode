# Flowtriq DDoS Detection Agent

Deploy the Flowtriq DDoS detection agent (ftagent) on an Akamai/Linode Compute Instance with one click. The agent monitors traffic at the packet level, detects attacks in under one second, classifies 16+ attack subtypes, captures forensic PCAPs, and triggers automated mitigation through local firewall rules, BGP FlowSpec, RTBH, or cloud scrubbing.

Provide your Flowtriq API key and Node UUID during deployment and the agent starts monitoring immediately. If credentials are omitted, ftagent is installed and ready to configure with `sudo ftagent --setup`.

## App Information

- **App Name:** Flowtriq DDoS Detection Agent
- **Version:** latest (installed from PyPI)
- **Supported OS:** Ubuntu 24.04 LTS
- **Suggested Plan:** Nanode 1 GB (g6-nanode-1)
- **Support URL:** https://flowtriq.com/docs

## Configuration

| UDF Variable | Description |
|---|---|
| `api_key` | Flowtriq API key from your dashboard |
| `node_uuid` | Node UUID from your dashboard |
| `user_name` | Limited sudo user to create |
| `disable_root` | Disable root SSH access (Yes/No) |
| `token_password` | Linode API token for DNS records |
| `subdomain` | Subdomain for DNS record |
| `domain` | Domain for DNS record |

## What Gets Installed

- Python 3, pip, libpcap-dev, tcpdump
- ftagent (latest from PyPI, with full extras)
- systemd service unit for ftagent
- fail2ban, ufw firewall

## After Deployment

- **Dashboard:** https://flowtriq.com/dashboard
- **Config file:** /etc/ftagent/config.json
- **Service status:** `systemctl status ftagent`
- **Logs:** `journalctl -u ftagent -f`
- **Credentials:** /home/<username>/.credentials

## Links

- Website: https://flowtriq.com
- Documentation: https://flowtriq.com/docs
- Discord: https://discord.gg/SsTWMYuyGG
- Support: hello@flowtriq.com

## Brand Assets

- **Brand Color 1:** #2563EB
- **Brand Color 2:** #1E40AF
- **Logo:** See assets/ directory
