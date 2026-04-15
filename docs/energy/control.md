# Energy Control & Monitoring

## Victron stack architecture

```mermaid
flowchart TD
    MPPT["Victron SmartSolar MPPT
(charge controller)"] <-->|VE.Direct| RPI
    BAT["Pylontech LiFePO4
(via CAN bus)"] <-->|CAN| INV["Victron Multiplus-II
(inverter-charger)"]
    INV <-->|VE.Bus| RPI["Raspberry Pi 4
Venus OS
(sistema operativo Victron)"]
    GEN["Diesel generator"] -->|AC input| INV
    RPI -->|MQTT| HA["Home Assistant
+ Node-RED"]
    RPI -->|HTTPS| VRM["Victron VRM portal
(cloud backup)"]
    HA --> IDB["InfluxDB
+ Grafana"]
    HA --> TG["📱 Telegram alerts"]
```

## Generator auto-start logic

```mermaid
flowchart TD
    T["Every 5 min"] --> C1{"SoC < 20%?"}
    C1 -->|No| T
    C1 -->|Yes| C2{"Solar generating
> 200 W?"}
    C2 -->|Yes, wait 30 min| T
    C2 -->|No| C3{"Time 08:00–22:00?"}
    C3 -->|No| WAIT["Wait until 08:00"]
    WAIT --> T
    C3 -->|Yes| START["▶ Start generator
(Victron relay output)"]
    START --> RUN["Run until SoC > 80%
or minimum 1 hour"]
    RUN --> STOP["⏹ Stop generator"]
    STOP --> LOG["Log runtime
to InfluxDB"]
    LOG --> T
```

## Load shedding rules (Node-RED)

| Condition | Action |
|---|---|
| SoC < 40% | Disable washing machine relay |
| SoC < 25% | Disable water pump AC relay |
| SoC < 20% | Start generator (see above) |
| Solar forecast > 8 kWh tomorrow | Schedule washing machine for 10:00–14:00 |

## Key metrics to monitor

| Metric | Source | Alert threshold |
|---|---|---|
| Battery SoC | SmartShunt | < 20% |
| Battery SoH | BMS cycle count | < 80% |
| Daily PV yield | MPPT telemetry | < 1 kWh/day (3 days running) |
| Generator runtime | Hour counter | > 20 h/month |
| DC bus voltage | Victron | Outside 46–58 V |

## Change log

| Date | Change | Author |
|---|---|---|
| 2026-04-15 | Initial draft | Claude |
