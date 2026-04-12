# Default Application Alerts

## Page-Worthy Alerts

### Exposed Route Has No Ready Backend

Use when a route, ingress, gateway route, service, or equivalent traffic entry point resolves to zero ready backends.

Required context:

- route, host, path, and service mapping
- application, service, environment, namespace, workload, and team
- desired, ready, and available replicas
- selector and endpoint state
- recent rollout and version
- last known healthy time
- RUM or request impact if available
- decision dashboard scoped to route and workload
- playbook action for rollback, selector fix, endpoint fix, or readiness investigation

### Serving Workload Has Zero Available Replicas

Use only for workloads that serve traffic or declare critical user impact.

Required context:

- application, service, workload, namespace, environment, team
- criticality and user-facing capability
- desired and available replicas
- rollout status
- image version and deployment ID
- platform events
- recent config and delivery changes
- decision dashboard scoped to workload and deployment

### Crash Loop Causing Loss Of Readiness

Use when restarts correlate with readiness loss for a serving workload.

Required context:

- container name
- restart count and trend
- last termination reason
- readiness and liveness probe state
- representative logs
- deployment context
- affected traffic or SLO impact
- decision dashboard scoped to failing container and workload

### RUM User-Impact Breach

Use when real-user signals breach a declared threshold with enough volume.

Required context:

- application, environment, route, page, view, or user journey
- affected session/view/user counts
- frustration, error, latency, or crash ratio
- release version
- geography, device, and browser dimensions when useful
- frontend-backend correlation hints
- decision dashboard scoped to route/view and release

### SLO Burn-Rate Breach

Use when a declared SLO is burning error budget fast enough to require immediate action.

Required context:

- SLO name
- SLI and success condition
- objective and window
- burn rate and consumed budget
- short and long evaluation windows
- affected application, service, route, or journey
- telemetry binding
- playbook action
- decision dashboard scoped to SLO and failing entity

## Notifications

Notify instead of alerting when immediate human action is not required:

- job execution failed without freshness or completion SLO
- partial replica unavailability without impact
- container restarts without readiness loss
- missing telemetry
- semantic convention drift
- policy drift

