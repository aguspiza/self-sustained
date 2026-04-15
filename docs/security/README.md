# 🔒 Security

## Context

The land has easy public access — theft of equipment (solar panels, batteries, pump, tools) is a realistic risk. Security is a Phase 0 requirement, not an afterthought.

| Parameter | Value |
|---|---|
| Plot size | ~6,000 m² (150 × 40 m) |
| Perimeter | ~380 m |
| Shape | Long narrow strip — good for linear camera coverage |

## Threat model

| Threat | Likelihood | Impact |
|---|---|---|
| Opportunistic theft (herramientas, cable) | High | Medium |
| Targeted theft (placas, baterías, bomba) | Medium | High |
| Vandalism | Low | Medium |

## Layers

### 1. Perimeter (Perímetro)

Perimeter: **380 m**

| Option | €/m | Total (380 m) | Notes |
|---|---|---|---|
| Malla ganadera + postes | 3–6 € | 1,140–2,280 € | Fast, low deterrence |
| Malla cinegética + alambre de espino | 6–12 € | 2,280–4,560 € | Better deterrence, standard rural Spain |
| Valla metálica con puerta con llave | — | + 500–1,500 € | Gate; add to either option above |

**Recommendation:** malla cinegética + 1 puerta con llave → ~**3,000–5,000 € total**

> Priority: close the perimeter before installing any equipment.

**Camera note:** 150 m long axis — 2 cameras at each short end (40 m face) cover the full plot with overlapping FOV. Equipment area gets a dedicated 3rd camera.

### 2. Physical anchoring (Anclaje físico)

- **Solar panels:** bolt to structure with anti-theft screws (tornillos antirrobo T20)
- **Batteries:** locked cabinet or enclosed room, not visible from outside
- **Pump:** concrete anchor + padlocked access hatch
- **Cables:** buried conduit (tubo corrugado enterrado), never surface-run

### 3. Surveillance (Vigilancia)

| Component | Option | Cost |
|---|---|---|
| Cameras | 2–4× IP cameras (PoE or WiFi) | 30–80 €/unit |
| NVR / storage | Home Assistant + local NVR (e.g. Frigate) | ~0 € if reusing hardware |
| Power | Solar-powered camera or powered from main system | — |
| Alerts | Motion detection → push notification via Home Assistant | — |

> See [docs/automation/](../automation/README.md) for Home Assistant integration.

**Camera placement priorities:**
1. Gate / main access
2. Solar array
3. Battery / equipment room

### 4. Lighting (Iluminación disuasoria)

- PIR-activated floodlights at gate and array area
- Solar-powered units during Phase 1 (no grid)
- Cost: 20–50 € per unit

### 5. Signage (Cartelería)

- "Propiedad privada — videovigilancia" signs (legally required in Spain if cameras cover beyond your boundary)
- Visible deterrence at low cost: 5–15 €

## Phase plan

| Phase | Action |
|---|---|
| Phase 0 (now) | Perimeter fence + lockable gate |
| Phase 1 | Physical anchoring of all equipment, 2 cameras, PIR lights |
| Phase 2 | Full camera coverage, Home Assistant alerts, NVR recording |

## Change log

| Date | Change | Author |
|---|---|---|
| 2026-04-15 | Initial draft | Claude |
