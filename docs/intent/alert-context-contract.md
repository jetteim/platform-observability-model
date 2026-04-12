# Alert Context Contract

Page-worthy alerts must include enough context for a human to decide and act without manually hunting through overview dashboards.

## Alert Criteria

An alert is page-worthy only when all conditions are true:

1. Immediate human action is required.
2. User or service impact is direct or highly probable.
3. Ownership and routing are known.
4. The alert includes decision context.
5. A dynamic dashboard opens already scoped to the incident.
6. A playbook action exists, or the alert marks the problem as first-time or unknown.

## Required Context

Identity:

- application
- service
- component or workload
- environment
- namespace
- generic platform topology
- version, release, or build SHA
- deployment or rollout ID

Ownership:

- owning team
- escalation target
- alert routing key
- service criticality
- business or user-facing capability
- support hours or response expectation when relevant

Impact:

- degraded user-facing capability
- affected route, page, API, job, or journey
- blocked, degraded, at-risk, or unknown traffic state
- affected request, session, view, or consumer count
- error, latency, saturation, or frustration ratio
- SLO and error-budget impact when declared
- blast radius

Current state:

- current measured value
- threshold or objective breached
- breach duration
- first detected time
- last known healthy time
- worsening, recovering, stable, or unknown trend
- confidence level when impact is inferred

Change context:

- recent deployments
- config changes
- Helm values changes
- admission policy changes
- dependency changes
- CI or delivery run links
- image version before and after
- semantic convention or telemetry config drift

Technical evidence:

- traffic, errors, latency, and saturation
- readiness and availability state
- desired, ready, and available replicas
- restart and termination reason
- recent platform events
- representative log patterns
- trace exemplars or correlated trace IDs
- RUM views, sessions, frustrations, and route data when applicable
- dependency health if relevant

Decision support:

- likely failure mode
- immediate recommended action
- safe rollback, restart, scale, or routing action when known
- playbook link and section
- first-time problem marker when no playbook exists
- links to recent changes and owners
- deduplication, suppression, and incident state

