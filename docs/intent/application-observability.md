# Application Observability Model

Application observability is the service owner's contract for understanding user impact and safe operation.

## Required Capabilities

- Stable service identity through OpenTelemetry resource attributes.
- User-facing capability and journey mapping.
- Request, error, latency, saturation, dependency, and release signals.
- RUM signals for client-side page, view, session, frustration, and route impact where applicable.
- SLO definitions bound to real telemetry.
- Alerts that include decision context and lead to dynamic dashboards.
- Notifications for non-urgent operational signals.
- Findings for telemetry, policy, or semantic-convention drift.

## Default Featured Alerts

Featured alerts are page-worthy only when immediate human action is required and the alert has enough context to act.

Keep by default:

- Exposed route has no ready backend.
- Serving workload has zero available replicas.
- Crash or restart loop causing loss of readiness for a serving workload.
- RUM user-impact breach with volume guardrails.
- SLO burn-rate breach for declared SLOs.

Notify by default:

- Job execution failed without a freshness or completion SLO.
- Partial replica unavailability without user impact.
- Container restarts without readiness loss or SLO impact.
- Missing telemetry or semantic convention drift.

Promote a notification to an alert only when the service declares user impact, criticality, freshness/completion expectations, owner, playbook action, and dynamic dashboard scope.

