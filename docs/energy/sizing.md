# Energy Sizing

## Load audit

| Load | Power (W) | Hours/day | Wh/day |
|---|---|---|---|
| Fridge A+++ | 45 | 24 (cycling) | 275 |
| LED lighting × 8 | 50 | 5 | 250 |
| Water pump AC | 500 | 1 | 500 |
| Washing machine (×3/week avg) | 2,000 | 0.4 | 800 |
| Computers + networking | 150 | 8 | 1,200 |
| Kitchen appliances | 1,500 | 0.5 | 750 |
| Workshop tools (occasional) | 2,000 | 0.2 | 400 |
| IoT server (mini-PC) | 15 | 24 | 360 |
| **Design total** | | | **5,000 Wh/day** |

> Add 8–15 kWh/day if an EV (vehículo eléctrico) is charged on-site.

## PV array sizing

```
Wp = Daily consumption (Wh) ÷ (PSH × η_system)

PSH  = Peak Sun Hours at site  →  5.5 h/day (Mediterranean annual average)
η    = System efficiency        →  0.75 (inverter losses + temperature + wiring + soiling)

Wp = 5,000 ÷ (5.5 × 0.75) = 1,212 Wp  →  install 1,800–2,000 Wp with margin
```

Validate with [PVGIS](https://re.jrc.ec.europa.eu/pvgis/) once GPS coordinates are confirmed.

## Battery bank sizing

```
Capacity (kWh) = Daily consumption × Autonomy days ÷ DoD

Autonomy days = 2.5  (covers 2–3 overcast winter days)
DoD           = 0.90  (LiFePO4 safe depth of discharge / profundidad de descarga)

Capacity = 5 × 2.5 ÷ 0.90 = 13.9 kWh  →  install 14–20 kWh
```

**Selected:** 4 × Pylontech US3000C = 4 × 3.55 kWh = **14.2 kWh usable**

## Seasonal variation

| Season | PSH (h/day) | Daily PV yield (est.) | Battery days |
|---|---|---|---|
| Summer | 7.0 | 10.5 kWh | > 3 (rarely needed) |
| Spring/Autumn | 5.5 | 8.3 kWh | ~2 |
| Winter | 3.5 | 5.3 kWh | 1–2 (generator covers shortfall) |

## Change log

| Date | Change | Author |
|---|---|---|
| 2026-04-15 | Initial draft | Claude |
