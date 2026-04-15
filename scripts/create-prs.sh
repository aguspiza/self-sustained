#!/bin/bash
# Run this from your local machine (not Claude's environment).
# It pushes one branch per system and opens a PR for each.
# Usage: bash scripts/create-prs.sh

set -e

TOKEN="${GITHUB_TOKEN:?Set GITHUB_TOKEN env var before running this script}"
REPO="aguspiza/self-sustained"
BASE="main"
API="https://api.github.com"

git_pr() {
  local branch="$1"
  local title="$2"
  local body="$3"

  echo ""
  echo "── Branch: $branch ──"
  git checkout -b "$branch" main
  git push origin "$branch"

  curl -s -X POST "$API/repos/$REPO/pulls" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -d "{\"title\":\"$title\",\"head\":\"$branch\",\"base\":\"$BASE\",\"body\":\"$body\"}" \
    | python3 -c "import sys,json; d=json.load(sys.stdin); print('PR #'+str(d['number'])+': '+d['html_url'])"

  git checkout main
}

# ── Ensure we are on main with everything committed ───────────────────────────
git checkout -B main
git add -A
git commit -m "docs: initial repo structure — all systems" || true

echo "Pushing main..."
git remote set-url origin "https://$TOKEN@github.com/$REPO.git"
git push -u origin main

# ── One PR per system ─────────────────────────────────────────────────────────

git_pr "docs/water" \
  "docs(water): add water system documentation" \
  "Adds \`docs/water/\` with 4 focused files:\n- \`README.md\` — overview, acronyms, targets\n- \`well.md\` — drilling, pump selection, legal (CHJ/CHS concession)\n- \`rainwater.md\` — first-flush, cistern sizing formula\n- \`treatment.md\` — 4-stage treatment train, RO, UV, quality testing\n- \`distribution.md\` — circuits, PEAD pipe spec, leak detection\n\nAll files include Mermaid diagrams and acronym explanations."

git_pr "docs/energy" \
  "docs(energy): add energy system documentation" \
  "Adds \`docs/energy/\` with 4 focused files:\n- \`README.md\` — overview, acronyms, targets\n- \`sizing.md\` — load audit, PV and battery sizing formulas\n- \`components.md\` — BOM, battery technology comparison\n- \`control.md\` — Victron stack, generator auto-start flowchart, load shedding\n- \`regulations.md\` — REBT, ITC-BT-40, RD 244/2019"

git_pr "docs/food" \
  "docs(food): add food system documentation" \
  "Adds \`docs/food/\` with 6 focused files:\n- \`README.md\` — overview, closed-loop nutrient flow diagram\n- \`zones.md\` — 4-zone layout, 4-year crop rotation\n- \`calendar.md\` — monthly planting calendar for Mediterranean Spain\n- \`irrigation.md\` — drip system design, efficiency comparison, demand estimates\n- \`greenhouse.md\` — structure spec, ventilation logic\n- \`animals.md\` — laying hens, beehives\n- \`soil.md\` — compost, analysis schedule, amendment strategy"

git_pr "docs/automation" \
  "docs(automation): add automation and AI stack documentation" \
  "Adds \`docs/automation/\` with 4 focused files:\n- \`README.md\` — full stack architecture diagram\n- \`hardware.md\` — server, ESP32 nodes, sensor selection table\n- \`software.md\` — Docker stack, Tasmota, docker-compose skeleton\n- \`levels.md\` — automation levels 1–3 with flowcharts\n- \`remote-access.md\` — Tailscale VPN, backup policy"

git_pr "docs/integration" \
  "docs(integration): add cross-system integration documentation" \
  "Adds \`docs/integration/README.md\`:\n- Shared structures and costs\n- Waste management flow (organic, greywater, blackwater, inert)\n- Resilience matrix: 5 failure scenarios with contingency plans\n- Minimum stock reserves table"

git_pr "experiments/phase-0" \
  "experiments: add template and EXP-020 soil baseline" \
  "Adds:\n- \`experiments/TEMPLATE.md\` — standard experiment format with Mermaid procedure diagram\n- \`experiments/EXP-020-soil-baseline.md\` — first planned experiment: soil analysis before any amendments\n\nEXP-020 is the first physical action for @aguspiza (Phase 0)."

git_pr "repo/contributing-license" \
  "repo: add CONTRIBUTING.md and LICENSE" \
  "- \`CONTRIBUTING.md\` — workflow diagram, file conventions, commit format, experiment ID ranges\n- \`LICENSE\` — CC BY-SA 4.0\n- \`.github/ISSUE_TEMPLATE/experiment.yml\` — structured form for new experiments\n- \`.github/ISSUE_TEMPLATE/finding.yml\` — structured form for findings and critiques"

echo ""
echo "✅ All PRs created. Review at: https://github.com/$REPO/pulls"
