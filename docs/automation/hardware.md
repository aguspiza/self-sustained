# Automation Hardware

## Local server

| Component | Spec | Purpose |
|---|---|---|
| Mini-PC | Beelink SEi12 Pro — Intel N100, 16 GB RAM, 512 GB SSD | Runs all services in Docker |
| UPS | Small 12V UPS ~300 Wh | Clean shutdown on power cut |
| Power draw | 8–15 W continuous | ~3 kWh/month |

> The Intel N100 runs Ollama (local LLM inference) at usable speed.
> A Raspberry Pi 4 handles layers 1–2 only — insufficient for AI layer.

## Field nodes

| Node type | Hardware | Qty | Function |
|---|---|---|---|
| Generic sensor | ESP32 + Tasmota | 8–10 | Soil moisture, temperature, tank levels |
| Camera | ESP32-CAM | 4 | Greenhouse, coop, cistern |
| Energy monitor | Victron SmartShunt + Raspberry Pi (Venus OS) | 1 | Battery SoC, current, voltage |
| IP camera (outdoor) | PoE camera | 2 | Security, perimeter |
| Weather station | ESP32 + BME280 + rain gauge + anemometer | 1 | Local microclimate data |

## Sensor selection

| Measurement | Sensor | Protocol | Cost |
|---|---|---|---|
| Soil moisture (humedad suelo) | Capacitive sensor v2.0 | Analog → ESP32 ADC | ~2 €/unit |
| Temperature + humidity | DHT22 or SHT31 | Digital → ESP32 GPIO | 3–8 € |
| Tank level (nivel depósito) | Ultrasonic HC-SR04 or JSN-SR04T | Digital → ESP32 | 5–15 € |
| Water flow (caudal) | Magnetic flow meter YF-S201 | Pulse → ESP32 GPIO | 10–25 € |
| Pressure | 0–10 bar 4–20 mA sensor | 4–20 mA → ADC | 20–50 € |
| Light (LDR for coop door) | LDR GL5528 | Analog → ESP32 ADC | < 1 € |

## Change log

| Date | Change | Author |
|---|---|---|
| 2026-04-15 | Initial draft | Claude |
