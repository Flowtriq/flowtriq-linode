# Deploying Flowtriq DDoS Detection Agent through the Linode Marketplace

Flowtriq is a DDoS detection and mitigation platform built for hosting providers, game server networks, ISPs, and anyone running infrastructure that needs to stay online. The ftagent is the on-node agent that monitors traffic at the packet level, learns normal traffic patterns, detects attacks in under one second, classifies them by protocol and vector, captures forensic PCAPs, and triggers automated mitigation.

## Deploying a Marketplace App

1. Log in to the Akamai Cloud Manager.
2. Select **Marketplace** from the left navigation menu.
3. Search for **Flowtriq DDoS Detection Agent**.
4. Click the app and then click **Create**.

## Configuration Options

### Flowtriq Options

| Field | Description |
|---|---|
| **Flowtriq API Key** | Your node API key from flowtriq.com/dashboard. Sign up at flowtriq.com/signup if you do not have an account. After signing up, add a node in the dashboard to get the API key. |
| **Flowtriq Node UUID** | The Node UUID assigned when you add a node in the Flowtriq dashboard. |

### General Options

| Field | Description |
|---|---|
| **Limited sudo user** | A non-root user account with sudo privileges. |
| **Disable root access over SSH** | Select Yes to block root SSH login after the limited user is created. |
| **Linode API token** | Required only if you want DNS records created automatically. |
| **Domain / Subdomain** | The domain and subdomain for automatic DNS configuration. |

## Getting Started After Deployment

### Checking the Agent Status

SSH into your Linode and run:

```bash
systemctl status ftagent
```

If you provided your API key and Node UUID during deployment, ftagent is already running and reporting to your dashboard.

### If You Skipped Credentials

Run the interactive setup wizard:

```bash
sudo ftagent --setup
sudo systemctl enable --now ftagent
```

### Viewing Logs

```bash
journalctl -u ftagent -f
```

### Testing Connectivity

```bash
sudo ftagent --test
```

### Accessing the Dashboard

Your node will appear at https://flowtriq.com/dashboard within 30 seconds of the agent starting. The dashboard shows real-time traffic metrics, attack incidents, PCAP captures, and mitigation actions.

### Credentials

Login credentials for your limited sudo user are stored at:

```
/home/<username>/.credentials
```

### Configuration File

The ftagent configuration is stored at `/etc/ftagent/config.json`. Key settings:

| Key | Default | Description |
|---|---|---|
| `api_key` | -- | Your Flowtriq node API key |
| `node_uuid` | -- | Node UUID from your dashboard |
| `interface` | `auto` | Network interface to monitor |
| `pcap_enabled` | `true` | Enable PCAP capture during incidents |
| `dynamic_threshold` | `true` | Adaptive baseline detection |
| `threshold_multiplier` | `3.0` | PPS multiplier to trigger alerts |

Full configuration reference: https://flowtriq.com/docs

## Further Documentation

- [Flowtriq Documentation](https://flowtriq.com/docs)
- [ftagent on PyPI](https://pypi.org/project/ftagent/)
- [Discord Community](https://discord.gg/SsTWMYuyGG)
- [Support Email](mailto:hello@flowtriq.com)
