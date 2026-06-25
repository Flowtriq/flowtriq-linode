# Flowtriq DDoS Detection Agent - Linode/Akamai Marketplace App

> **[Integration Guide](https://flowtriq.com/integrations/linode)** | **[Documentation](https://flowtriq.com/docs)** | **[Sign Up](https://flowtriq.com/signup)**

Linode (Akamai) Marketplace app for deploying ftagent, the Flowtriq DDoS detection agent. Deploy a Linode from the Marketplace, run `sudo ftagent --setup`, and your node is connected to your Flowtriq dashboard within seconds.

## What is Flowtriq?

Flowtriq provides real-time DDoS detection and auto-mitigation for network operators. The agent (ftagent) runs on your server and detects attacks in sub-second time, automatically applying firewall rules, BGP FlowSpec announcements, and capturing PCAPs for forensic analysis.

## Quick Start

1. Sign up at [flowtriq.com/signup](https://flowtriq.com/signup) and grab your API key.
2. Deploy the Flowtriq Marketplace app on Linode.
3. SSH into the server and run:

```bash
sudo ftagent --setup
```

4. Follow the prompts to enter your API key. The agent starts immediately.

## Building the Image

This repo uses Ansible playbooks following the [Linode Marketplace guidelines](https://www.linode.com/docs/products/tools/marketplace/guides/app-submission/).

### Repository Structure

```
apps/linode-marketplace-flowtriq/
  site.yml                     Main Ansible playbook
  provision.yml                Provisioning playbook
  roles/
    common/                    Base system setup
    ftagent/                   Agent install and config
    post/                      MOTD and cleanup
deployment_scripts/
  flowtriq-deploy.sh           StackScript deployment script
  linode-config.sh             Linode-specific config
```

## Requirements

- Linode/Akamai account
- ftagent requires Python 3.8+ and libpcap

## Get Started

Start your free 14-day trial at [flowtriq.com/signup](https://flowtriq.com/signup).

## Documentation

Full documentation: [flowtriq.com/docs](https://flowtriq.com/docs)

---

Built by [Flowtriq](https://flowtriq.com) - Real-time DDoS detection and mitigation.
