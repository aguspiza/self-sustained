# Water Distribution

## Circuit layout

```mermaid
flowchart TD
    TANK["Elevated Tank
2,000 L @ 4–6 m height
→ 0.4–0.6 bar gravity pressure"] --> BLUE
    TANK --> BLACK
    GREY["Greywater
(showers, sinks)"] -->|filter bed| PURPLE

    BLUE["🔵 Potable circuit
PEAD ø32 PN16"]
    BLACK["⚫ Irrigation circuit
PEAD ø32 PN16"]
    PURPLE["🟣 Greywater reuse
(non-food irrigation only)"]

    BLUE & BLACK & PURPLE --> VALVES["Sectored shutoff valves
(válvulas de corte)
one per branch"]
    VALVES --> ZONES["End uses"]
```

**Color coding (standard):** potable = blue, irrigation = black, greywater = purple.
Never cross-connect circuits.

## Pipe specification

| Parameter | Value |
|---|---|
| Material | PEAD (HDPE — High-Density Polyethylene) |
| Diameter | ø32 mm main runs; ø25 mm branches; ø16 mm drip laterals |
| Pressure rating | PN16 (nominal 16 bar — way above operating pressure, for longevity) |
| Joints | Compression fittings or electrofusion (electrofusión) — no solvent cement outdoors |
| Working pressure | 1.0–1.5 bar at point of use |

## Pressure options

| Option | Pressure | Cost | Notes |
|---|---|---|---|
| Elevated tank 4 m | ~0.4 bar | Low | Free pressure, no electricity needed |
| Elevated tank 6 m | ~0.6 bar | Low | Enough for showers and drip |
| Hydrophore (pressure tank) | 1.5–3 bar | Medium | Small pump + pressure vessel; needs electricity |
| DC pressure pump 12V | 1.5–2 bar | Medium | Works directly from battery bus |

## Monitoring

```mermaid
flowchart LR
    S1["Ultrasonic level
cistern"] --> MQTT["MQTT broker"]
    S2["Ultrasonic level
elevated tank"] --> MQTT
    S3["Flow meter
well outlet
(caudalímetro)"] --> MQTT
    S4["Pressure sensor
main line"] --> MQTT
    MQTT --> HA["Home Assistant"]
    HA -->|night flow > 0| ALERT["🚨 Leak alert
(fuga)"]
    HA --> DB["InfluxDB
+ Grafana"]
```

| Alert condition | Meaning |
|---|---|
| Flow > 0 between 01:00–05:00 | Probable leak (fuga) |
| Cistern level < 20% | Low reserve — restrict irrigation |
| Elevated tank level < 30% | Booster pump fault or high demand |
| Pressure drop > 0.3 bar overnight | Leak in pressurised circuit |

## Change log

| Date | Change | Author |
|---|---|---|
| 2026-04-15 | Initial draft | Claude |
