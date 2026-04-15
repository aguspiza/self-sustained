# Software Stack

All services run in **Docker** on the local mini-PC. Zero cloud dependency for core farm function.

## Services

| Service | Role | Container |
|---|---|---|
| Home Assistant OS | Central hub, automations, UI, history | Native HAOS or Docker |
| Node-RED | Flow logic, API integrations | HA add-on or Docker |
| Mosquitto | MQTT broker (port 1883) | HA add-on or Docker |
| InfluxDB v2 | Time-series database | Docker |
| Grafana | Dashboards | Docker |
| Ollama | Local LLM inference | Docker |
| Tailscale | Mesh VPN remote access | System service |
| Watchtower | Auto-update containers | Docker |

## Docker Compose skeleton

```yaml
# configs/docker-compose.yml
services:
  influxdb:
    image: influxdb:2
    volumes:
      - influxdb-data:/var/lib/influxdb2
    ports:
      - "8086:8086"

  grafana:
    image: grafana/grafana
    volumes:
      - grafana-data:/var/lib/grafana
    ports:
      - "3000:3000"

  ollama:
    image: ollama/ollama
    volumes:
      - ollama-data:/root/.ollama
    ports:
      - "11434:11434"

volumes:
  influxdb-data:
  grafana-data:
  ollama-data:
```

## Tasmota firmware on ESP32

Tasmota is open-source firmware for ESP32/ESP8266.
It provides MQTT auto-discovery for Home Assistant with zero custom code.

Flash via Tasmota Web Installer: [tasmota.github.io](https://tasmota.github.io/install/)

## Change log

| Date | Change | Author |
|---|---|---|
| 2026-04-15 | Initial draft | Claude |
