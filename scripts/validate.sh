#!/usr/bin/env bash
set -euo pipefail

required_files=(
  README.md
  docs/intent/principles.md
  docs/intent/observability-boundaries.md
  docs/intent/infra-observability.md
  docs/intent/application-observability.md
  docs/intent/semantic-conventions.md
  docs/intent/enforcement-model.md
  docs/intent/alert-context-contract.md
  docs/intent/decision-dashboard-model.md
  docs/intent/default-application-alerts.md
  docs/intent/slo-and-error-budget-model.md
  docs/intent/backend-generation-model.md
  docs/intent/data-security-and-cost-controls.md
  docs/devex/developer-journey.md
  docs/devex/local-validation.md
  docs/devex/ci-validation.md
  docs/devex/helm-values-contract.md
  docs/devex/admission-policy-patterns.md
  docs/migration/sre-rules-seed.md
  docs/migration/sre-rules-to-slo-intents.md
  docs/sources/source-scan-summary.md
)

for file in "${required_files[@]}"; do
  if [ ! -f "$file" ]; then
    echo "missing required file: $file" >&2
    exit 1
  fi
done

python3 - <<'PY'
import json
from pathlib import Path

for path in sorted(Path("schemas").glob("*.json")):
    with path.open() as fh:
        json.load(fh)
print("json schemas parse")
PY

ruby -e 'require "yaml"; Dir["examples/*.yaml"].sort.each { |path| YAML.load_file(path) }; puts "yaml examples parse"'

if grep -RniE 'datadog|dash0|aws|gcp|azure' docs/intent docs/devex docs/migration >/tmp/platform-observability-vendor-scan.txt; then
  echo "vendor-specific term found in model intent docs:" >&2
  cat /tmp/platform-observability-vendor-scan.txt >&2
  exit 1
fi

grep -R "org.team.name" examples/semantic-conventions.yaml >/dev/null
grep -R "classification: alert" examples/application-featured-alerts.yaml >/dev/null
grep -R "dashboard:" examples/application-featured-alerts.yaml >/dev/null
grep -R "playbook:" examples/application-featured-alerts.yaml >/dev/null

echo "validation ok"
