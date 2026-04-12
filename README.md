# Platform Observability Model

Platform-agnostic observability model for Kubernetes-based platforms and OpenTelemetry-based telemetry.

This repository documents the intended operating model first. Backend-specific monitors, dashboards, policies, and API calls are generated outputs, not the source of truth.

## Scope

- Infra observability for Kubernetes platforms.
- Application observability for services, user journeys, and releases.
- OpenTelemetry semantic conventions plus organization-wide extensions.
- Alert context contracts and decision dashboards.
- Unified SLO intent that can generate telemetry backend artifacts.
- DevEx enforcement through local validation, CI, Helm contracts, and admission policy.
- Migration seed for existing SRE rules into platform-agnostic SLO and alert intent.

## Principles

- Alerts reduce uncertainty; they do not tell humans to manually inspect overview dashboards.
- Dashboards support incident response and decision making; they are not a required manual overview loop.
- OpenTelemetry semantic conventions are the default vocabulary.
- Organization-specific semantic attributes are explicit, versioned, and enforceable.
- Vendor/backend labels are projections from the model, not model inputs.
- Page-worthy alerts require immediate action, direct or highly probable impact, ownership, context, a dynamic dashboard, and a playbook action.

## Validate

```bash
./scripts/validate.sh
```

The validator checks that required model files exist, JSON schemas parse, YAML examples parse, and intention docs do not accidentally become vendor-specific implementation docs.

