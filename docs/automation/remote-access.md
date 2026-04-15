# Remote Access & Backup

## Remote access via Tailscale

```mermaid
flowchart LR
    PHONE["📱 Phone / laptop
(anywhere)"] -->|"Tailscale
encrypted mesh VPN"| NODE["Tailscale node
on mini-PC"]
    NODE --> HA["Home Assistant :8123"]
    NODE --> GF["Grafana :3000"]
    NODE --> NR["Node-RED :1880"]
    NODE --> SSH["SSH :22"]
```

**Why Tailscale?**
- No open ports on the router (no port forwarding needed)
- No dynamic DNS setup
- Works through CGNAT (carrier-grade NAT, common with rural 4G connections)
- Free tier supports up to 100 devices

## Backup policy

| Data | Target | Frequency | Method |
|---|---|---|---|
| Home Assistant config | This GitHub repo | On every change | `git push` |
| Node-RED flows | This GitHub repo | On every change | Export JSON + `git push` |
| InfluxDB data | External HDD (local) | Weekly | `influx backup` cron job |
| Full system snapshot | External HDD (local) | Monthly | `rsync` |

## Change log

| Date | Change | Author |
|---|---|---|
| 2026-04-15 | Initial draft | Claude |
