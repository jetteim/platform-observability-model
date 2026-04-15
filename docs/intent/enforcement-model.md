# Enforcement Model

Semantic conventions and observability intent need layered enforcement.

## Design-Time

- JSON schemas validate intent documents.
- A semantic convention registry defines allowed org attributes, cardinality, owners, and enforcement points.
- Examples act as contract tests for services, SLOs, dashboards, and generated artifacts.
- Pipeline examples define source-to-sink lineage, transformation behavior, delivery policy, and buffer behavior.

## Local DevEx

- A local validator checks schemas, examples, required fields, and vendor neutrality.
- Service templates include required OpenTelemetry resource attributes.
- Package wrappers initialize telemetry early, inject trace-log correlation, suppress noisy health endpoints, and apply privacy defaults.

## CI

- Render Helm examples.
- Validate values contracts.
- Diff rendered manifests.
- Test admission policies.
- Validate semantic convention usage.
- Validate alert context completeness.
- Optionally export CI workflow traces using OpenTelemetry.
- Validate generated telemetry pipeline topology and transformation tests before deployment.

## Admission

Admission policy should validate and mutate workload metadata:

- Require or default service identity.
- Propagate application, owner, cost, criticality, telemetry tier, and data classification.
- Inject resource attributes for instrumented workloads.
- Enforce telemetry opt-in/opt-out labels.
- Reject invalid high-cardinality semantic attributes on resources.

Kyverno and Gatekeeper are implementation options. The model describes policy intent, not a required engine.

## Runtime

- Detect missing telemetry for declared services.
- Detect semantic convention drift between declared intent and observed telemetry.
- Alert on telemetry pipeline failure only when incident response, SLO evaluation, security, audit, or compliance telemetry would be impaired.
- Notify on policy drift that does not require immediate action.
- Track cardinality and cost budgets.
- Enforce redaction and sensitive-data controls at application, collector, and backend layers.
