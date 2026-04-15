# Automation Levels

Three progressive levels. Each level assumes the previous one is stable.

## Level 1 — Basic control (months 1–6)

```mermaid
flowchart LR
    LVL["Cistern level
sensor"] -->|"< 30%"| PUMP["Start well pump
(relay ON)"]
    PUMP -->|"> 90%"| STOP["Stop pump
(relay OFF)"]

    SOC["Battery SoC
(VRM data)"] -->|"< 20%"| GEN["Start generator
(auto-start relay)"]

    LDR["LDR photoresistor
(sensor luz)"] -->|"sunset"| DOOR["Close coop door
(motor)"]
    LDR -->|"sunrise"| DOOR2["Open coop door"]

    TEMP["Greenhouse
temp sensor"] -->|"> 28°C"| VENT["Open vents
(actuator)"]

    CRON["⏰ Daily 07:00"] --> REPORT["Telegram report:
energy + water + any alerts"]
```

## Level 2 — Optimization (months 6–18)

```mermaid
flowchart TD
    SM["Soil moisture
per zone
(humedad suelo)"] -->|"below threshold"| VALVE["Open solenoid valve
(electroválvula)"]
    SM -->|"at target"| CLOSE["Close valve"]

    FORECAST["OpenMeteo API
7-day solar forecast"] --> NR["Node-RED scheduler"]
    NR -->|"high generation
predicted"| WASHER["Enable washing machine
(SoC > 70%)"]
    NR -->|"low generation"| DEFER["Defer heavy loads
(aplazar cargas)"]

    FLOW["Night flow meter
01:00–05:00"] -->|"flow > 0 L/h"| LEAK["🚨 Leak alert
(fuga detectada)"]

    ZSCORE["Rolling z-score
(anomaly detection)"] -->|"σ > 3"| ANO["🚨 Anomaly alert
energy or water"]
```

## Level 3 — AI-assisted (months 18+)

```mermaid
flowchart LR
    IMG["ESP32-CAM
image stream"] --> YOLO["YOLO model
fine-tuned
pest detection"]
    YOLO -->|"pest detected"| ALERT["🚨 Pest alert
with photo + species
(especie de plaga)"]

    HIST["Historical data
(InfluxDB)"] --> ML["scikit-learn
regression model"]
    ML --> PRED["Yield prediction
per crop per zone"]

    USER["📱 User query
(Telegram)"] --> OLL["Ollama
Mistral 7B
(local LLM)"]
    OLL <-->|"live sensor state"| HA["Home Assistant
state API"]
    OLL --> ANS["Answer:
'Should I irrigate zone 3?'
'What caused the spike
in power yesterday?'"]
```

## Change log

| Date | Change | Author |
|---|---|---|
| 2026-04-15 | Initial draft | Claude |
