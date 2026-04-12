# Semantic Conventions

## Baseline

Use OpenTelemetry semantic conventions first. The model depends on stable resource identity before any backend-specific tag or label is generated.

Required baseline attributes for services:

- `service.namespace`
- `service.name`
- `service.version`
- `deployment.environment.name`
- `deployment.id`

Required baseline attributes for Kubernetes workloads when available:

- `k8s.namespace.name`
- `k8s.deployment.name`
- `k8s.statefulset.name`
- `k8s.daemonset.name`
- `k8s.cronjob.name`
- `k8s.job.name`
- `k8s.pod.name`
- `k8s.container.name`

## Organization Extensions

Organization-wide extensions are allowed when upstream OpenTelemetry does not express a needed operational concept. The examples use the neutral `org.*` namespace; real organizations should choose and version their prefix deliberately.

Recommended extension attributes:

- `org.application.name`: durable application identity.
- `org.team.name`: owning team.
- `org.cost_center`: cost ownership.
- `org.component.name`: component inside an application.
- `org.service.criticality`: criticality tier.
- `org.alert.routing_key`: alert routing target.
- `org.telemetry.tier`: expected telemetry level.
- `org.data.classification`: highest data sensitivity expected in telemetry.
- `org.ownership.lifecycle`: active, deprecated, sunset, or experimental.
- `org.user_journey.name`: user journey or capability represented by telemetry.

## Rules

- Prefer upstream OpenTelemetry attributes when they fit.
- Do not overload `service.name` with team, environment, region, or backend naming.
- Do not encode backend names into semantic attributes.
- Keep org attributes low-cardinality unless explicitly marked as event-only.
- Backend tags, monitor labels, dashboard variables, and routing fields must be generated from semantic attributes.
- Every org attribute must define owner, purpose, cardinality, allowed values, enforcement points, and migration behavior.

