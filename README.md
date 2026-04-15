# 🌱 Self-Sustained

**An iterative engineering journal toward 70–80% autonomy in water, energy, and food.**

> *"What can't be measured can't be optimized."*

---

## Context

| Parameter | Value |
|---|---|
| Location | Rural Mediterranean, Spain |
| Starting point | Clean land, no existing infrastructure |
| Target autonomy | 70–80% across water, energy, and food |
| Budget | 30k–100k € phased over ~24 months |
| Approach | Iterative — plan → build → measure → critique → improve |

---

## Division of labor

| Layer | Who |
|---|---|
| Physical world (construction, experiments, measurements) | [@aguspiza](https://github.com/aguspiza) |
| Digital world (docs, code, automation, data analysis, AI) | Claude (Anthropic) |

---

## System map

```mermaid
graph TD
    subgraph WATER["💧 Water"]
        W1[Well] --> W3[Treatment]
        W2[Cistern] --> W3
        W3 --> W4[Distribution]
    end
    subgraph ENERGY["⚡ Energy"]
        E1["PV Array\n(Fotovoltaico)"] --> E3[Inverter-Charger]
        E2["LiFePO4 Bank\n(Litio Ferro Fosfato)"] <--> E3
        E4[Generator] --> E3
    end
    subgraph FOOD["🌿 Food"]
        F1[Garden] --> F5[Compost]
        F4[Hens] --> F5
        F5 --> F1
    end
    subgraph AUTO["🤖 Automation"]
        A1["ESP32 sensors\n(microcontroladores)"] --> A2[Home Assistant]
        A2 --> A3[InfluxDB + Grafana]
    end
    ENERGY -->|powers| WATER & FOOD & AUTO
    WATER -->|irrigates| FOOD
    AUTO -->|monitors & controls| WATER & ENERGY & FOOD
```

---

## Iteration loop

```mermaid
flowchart LR
    PLAN["📋 Plan\nClaude"] --> BUILD["🔨 Build\n@aguspiza"]
    BUILD --> MEASURE["📊 Measure\n@aguspiza"]
    MEASURE --> CRITIQUE["🔍 Critique\nboth"]
    CRITIQUE --> COMMIT["💾 Commit\nClaude"]
    COMMIT --> PLAN
```

---

## Documentation index

| System | Index |
|---|---|
| 💧 Water | [docs/water/](docs/water/README.md) |
| ⚡ Energy | [docs/energy/](docs/energy/README.md) |
| 🌿 Food | [docs/food/](docs/food/README.md) |
| 🤖 Automation | [docs/automation/](docs/automation/README.md) |
| 🔗 Integration | [docs/integration/](docs/integration/README.md) |
| 🔒 Security | [docs/security/](docs/security/README.md) |

---

## Phase roadmap

```mermaid
gantt
    title Implementation Phases
    dateFormat  YYYY-MM
    axisFormat  %b %Y

    section Phase 0 — Studies
    Hydrogeological study        :active, 2026-04, 2M
    Soil analysis                :2026-04, 1M
    Legal permits                :2026-04, 6M

    section Phase 1 — Water + Energy
    Well drilling + pump         :2026-06, 2M
    Rainwater cistern            :2026-07, 1M
    PV + battery system          :2026-07, 2M
    Water treatment              :2026-08, 1M

    section Phase 2 — Food
    Soil preparation             :2026-09, 1M
    Irrigation system            :2026-09, 1M
    Greenhouse                   :2026-10, 1M
    Chickens + beehives          :2026-11, 1M

    section Phase 3 — Automation
    Sensor network               :2027-01, 2M
    AI / ML layer                :2027-03, 3M
```

---

## Autonomy tracker

| Resource | Target | Current |
|---|---|---|
| 💧 Water | 80% | 0% |
| ⚡ Energy | 75% | 0% |
| 🌿 Food | 65% | 0% |
| **Overall** | **73%** | **0%** |

---

## Budget summary

| Phase | Investment | Autonomy gained |
|---|---|---|
| Phase 0 — Studies, permits & security | 6,000–11,000 € | — |
| Phase 1 — Water + Energy | 28,000–46,000 € | ~65% |
| Phase 2 — Food | 6,000–14,000 € | +10–15% |
| Phase 3 — Automation | 1,500–5,000 € | +5% |
| **Total** | **41,500–76,000 €** | **~75–80%** |

---

## License

[CC BY-SA 4.0](LICENSE)
