# SRE Rules Migration Seed

The migration target is not another backend-specific rule repository. The target is a unified interface that can generate backend artifacts.

## Map Existing Rules To Intent

For each existing rule, identify:

- user-facing capability or platform capability
- SLI type
- success condition
- objective or implied threshold
- evaluation window
- current telemetry source
- current backend query
- routing and owner
- page, notification, or finding classification
- playbook action
- dashboard context

## Output Objects

Existing rules should become:

- `SLOIntent` when tied to reliability objectives
- `SLIQueryBinding` when mapping intent to telemetry
- `AlertIntent` when immediate action is required
- `NotificationIntent` when useful but not urgent
- `DecisionDashboardIntent` when an alert needs incident response context
- `GeneratedArtifactManifest` when backend resources are produced

