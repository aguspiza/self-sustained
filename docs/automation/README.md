# 🤖 Automation & AI Stack

## Core principle

> Every physical system must be **manually operable first**.
> Automation optimises and alerts — a software failure must never break basic farm function.

## Full architecture

```mermaid
flowchart TD
    subgraph FIELD["🌾 Field Layer"]
        ESP["ESP32 nodes
(Tasmota firmware)"]
        CAM["ESP32-CAM
cameras"]
        VIC_HW["Victron hardware
(MPPT + Multiplus)"]
        WX["Weather station
ESP32 + BME280"]
    end
    subgraph BROKER["📡 Broker"]
        MQTT["Mosquitto
MQTT broker"]
    end
    subgraph CONTROL["🧠 Control"]
        HA["Home Assistant"]
        NR["Node-RED
(flow logic)"]
    end
    subgraph DATA["💾 Data"]
        IDB["InfluxDB
(time-series)"]
        GF["Grafana
(dashboards)"]
        TG["Telegram Bot
(alerts)"]
    end
    subgraph AI["🤖 AI"]
        OLL["Ollama
Local LLM
(Mistral 7B)"]
        ML["Python
scikit-learn"]
        CV["YOLO
(pest detection)"]
    end
    FIELD -->|publish| BROKER --> CONTROL
    CONTROL --> DATA
    CONTROL --> AI
    DATA --> TG
```

## Subsections

| Document | Contents |
|---|---|
| [hardware.md](hardware.md) | Server, ESP32 nodes, sensors, cameras |
| [software.md](software.md) | Full software stack, Docker setup |
| [levels.md](levels.md) | Automation levels 1–3 with flowcharts |
| [remote-access.md](remote-access.md) | Tailscale VPN, backup policy |

## Acronyms

| Acronym | Full name | Spanish |
|---|---|---|
| IoT | Internet of Things | Internet de las Cosas |
| MQTT | Message Queuing Telemetry Transport | Protocolo pub/sub ligero para sensores IoT |
| ESP32 | — | Microcontrolador WiFi/BT de Espressif |
| GPIO | General Purpose Input/Output | Pines multipropósito del microcontrolador |
| LLM | Large Language Model | Modelo de lenguaje grande |
| VPN | Virtual Private Network | Red privada virtual |
| OTA | Over-The-Air | Actualización remota del firmware |

## Change log

| Date | Change | Author |
|---|---|---|
| 2026-04-15 | Initial draft | Claude |
