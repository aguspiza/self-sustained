# Component Selection

## PV panels

| Spec | Value |
|---|---|
| Technology | Monocrystalline PERC |
| Unit power | 450 Wp |
| Quantity | 4–5 panels = 1,800–2,000 Wp |
| Unit cost (2025) | 90–110 € |
| Tilt angle | Latitude – 10° ≈ 28–32° (Mediterranean optimum) |
| Azimuth | Geographic South ± 15° |

## Battery technologies compared

| Technology | Cycles | Rec. DoD | €/kWh (2025) | Notes |
|---|---|---|---|---|
| **LiFePO4** ✅ | 3,000–6,000 | 80–90% | 250–400 | Recommended. Safe, no thermal runaway |
| AGM / GEL (lead-acid) | 500–1,200 | 50% | 100–180 | Cheap but bulky, more maintenance |
| NMC (e.g. Powerwall) | 2,000–4,000 | 80–90% | 500–800 | Higher density, higher thermal risk |

**Selected:** Pylontech US3000C — modular, BMS integrated, CAN bus communication with Victron.

## Full component BOM

| Component | Model | Qty | Unit cost (est.) |
|---|---|---|---|
| PV panel 450 Wp | Monocrystalline PERC | 4–5 | 90–110 € |
| Inverter-charger | Victron Multiplus-II 48/5000 | 1 | 1,200–1,500 € |
| MPPT charge controller | Victron SmartSolar 150/60 | 1 | 350–500 € |
| Battery module | Pylontech US3000C (3.55 kWh) | 4 | 1,100–1,400 € |
| Battery monitor (shunt) | Victron SmartShunt 500A | 1 | 80–120 € |
| Monitoring computer | Raspberry Pi 4 + Venus OS | 1 | 80–100 € |
| Backup generator | Diesel inverter 6 kVA | 1 | 2,000–3,500 € |
| Fuel tank | 200 L diesel, homologated | 1 | 300–500 € |

> **BOM** = Bill of Materials (lista de materiales)

## Change log

| Date | Change | Author |
|---|---|---|
| 2026-04-15 | Initial draft | Claude |
