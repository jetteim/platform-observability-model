# Helm Values Contract

Helm values can be a useful implementation interface, but they should expose observability intent rather than backend internals.

Recommended values:

- `observability.enabled`
- `observability.telemetryTier`
- `observability.dataClassification`
- `observability.semanticAttributes`
- `observability.slos`
- `observability.featuredAlerts`
- `observability.dashboardTemplates`
- `observability.playbooks`
- `observability.backendTargets`

Charts should fail early when mutually exclusive telemetry backends or incompatible instrumentation modes are enabled.

