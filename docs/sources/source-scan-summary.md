# Source Scan Summary

Local repositories under `NEW_WORK` were scanned as evidence for this model.

## Generalized Findings

- Existing documentation already separates application observability from platform and infrastructure observability.
- Current implementations rely on Kubernetes-native resources, telemetry collectors, operator patterns, monitor resources, dashboards, and admission policies.
- OpenTelemetry resource attributes are already used for service identity and deployment metadata.
- Application observability examples include logs, traces, metrics, browser RUM, frontend/backend correlation, structured logging, and privacy controls.
- SRE material emphasizes user-centric SLIs, SLOs, error-budget burn rate, time-slice evaluation, and playbooks.
- Helm charts show the need for values contracts, backend exclusivity checks, rendered manifest tests, and golden diffs.
- Kyverno policies show useful enforcement patterns: label propagation, telemetry opt-in, resource attribute injection, validation, and policy tests.
- GitHub Actions workflows show useful DevEx patterns: render manifests, diff rendered outputs, test policies, publish artifacts, and trace CI workflows.

## Generalization Decisions

- Vendor-specific monitor resources become generated backend artifacts.
- Proprietary tags become projections from OpenTelemetry and org semantic attributes.
- Provider-specific location terms become generic topology.
- Job failures become notifications unless they declare freshness/completion SLO impact.
- Dashboards become incident decision surfaces, not manual overview loops.

