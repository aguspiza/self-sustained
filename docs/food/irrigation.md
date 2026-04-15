# Irrigation System

## Design

```mermaid
flowchart TD
    TANK["Water tank
(depósito)"] --> FILTER["Sand + mesh filter
100 µm
(filtro arena y malla)"]
    FILTER --> CTRL["8-zone controller
Hunter HC or Rain-Bird ST8
with WiFi module"]
    CTRL --> Z1["Zone 1"] & Z2["Zone 2"] & ZN["... Zone N"]
    Z1 & Z2 & ZN --> SM["Soil moisture sensor
(sensor humedad suelo)
capacitive type"]
    SM -->|threshold not reached| VALVE["Solenoid valve
(electroválvula)"]
    VALVE --> DRIP["Pressure-compensating
drip emitters
goteros autocompensantes
2 L/h ±10%"]
    DRIP --> MULCH["Mulch layer 5–10 cm
acolchado (straw/compost)
→ –50–70% evaporation"]
```

## Efficiency comparison

| Method | Efficiency | Notes |
|---|---|---|
| Drip irrigation (riego por goteo) | 85–95% | **Recommended** |
| Micro-sprinklers | 70–80% | OK for densely planted zones |
| Overhead sprinklers | 40–60% | High evaporation, promotes fungal disease |
| Furrow / flood | 30–50% | Only for zone 3 large crops, never in summer |

## Water demand estimates

| Zone | Season | L/day |
|---|---|---|
| Zone 1 (20 m²) | Summer | 40–80 |
| Zone 2 (200 m²) | Summer | 300–500 |
| Zone 3 (280 m²) | Summer | 400–700 |
| Greenhouse (40 m²) | Summer | 50–100 |
| Animals | Year-round | 10–20 |
| **Peak total** | **Summer** | **~1,400 L/day** |

## Change log

| Date | Change | Author |
|---|---|---|
| 2026-04-15 | Initial draft | Claude |
