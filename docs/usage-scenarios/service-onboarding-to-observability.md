# Service Onboarding To Observability

This scenario shows how to use the platform observability model to prepare observability for a service. It is written for agentic execution with human-readable review gates.

The `observability-engineering` skill should use this scenario when asked to build or prepare observability for a platform, service, product area, or migration. The skill provides the workflow discipline; this model repo provides the source-of-truth contracts.

## Purpose

Onboard a Kubernetes-hosted service to reliable observability without starting from backend dashboards, vendor monitors, or copied alert rules.

The desired result is a set of neutral intent objects that can generate backend-specific artifacts:

- service observability intent
- semantic convention registry updates
- SLO intent
- telemetry query bindings
- telemetry pipeline requirements when collection, transformation, routing, buffering, or delivery affects the service contract
- alert and notification intent
- decision dashboard intent
- generated artifact manifest
- enforcement plan

## Human Intent

The human review should answer:

- What user-facing capability or platform capability matters?
- Which service or workload owns that capability?
- Who owns response and escalation?
- What semantic attributes should identify this service everywhere?
- Which SLOs are real and worth enforcing?
- Which signals require immediate human action?
- Which signals should become notifications or findings?
- What context must be present before a page is valid?
- Which dashboard decisions should be possible without manual exploration?
- Does the telemetry path need durable delivery, acknowledgement, buffering, fallback, quarantine, or transformation tests?
- Which backend artifacts should be generated after intent is approved?

## Agent Task Contract

The agent should produce observability intent, not hand-authored backend resources as the source of truth.

Inputs:

- service metadata or catalog entry
- Kubernetes manifests, Helm values, or rendered workload resources
- route, ingress, gateway, service, and endpoint configuration
- existing telemetry samples or backend queries
- telemetry collector, source, processor, route, buffer, exporter, and backend delivery configuration when available
- existing monitors, dashboards, rules, and playbooks
- CI workflows and validation scripts
- admission policy or semantic convention enforcement artifacts

Outputs:

- `ServiceObservability`
- `SemanticConventionRegistry` updates
- `SLOIntent`
- `SLIQueryBinding`
- telemetry pipeline requirements or generation gaps
- `FeaturedAlert`, `NotificationIntent`, or `Finding`
- `DecisionDashboardIntent`
- `GeneratedArtifactManifest`
- enforcement recommendations
- instrumentation gaps

Refusal conditions:

- Do not create a page-worthy alert without owner, impact, playbook, and decision dashboard.
- Do not define an SLO as complete when no telemetry binding exists.
- Do not invent telemetry that is not present.
- Do not make vendor tags the source of truth.
- Do not treat pipeline transformations, buffers, or delivery behavior as safe when they can remove, delay, duplicate, or misroute SLO telemetry.
- Do not promote job failures, restarts, telemetry drift, or partial replica loss to alerts unless the model proves immediate user or service impact.

## Workflow

### 1. Establish Identity

Collect stable service identity:

```yaml
application: checkout
service: checkout-api
environment: production
namespace: checkout
workload: checkout-api
team: payments-platform
criticality: tier-1
userJourney: checkout
telemetryTier: full
dataClassification: confidential
```

Human review gate:

- Confirm the service name and namespace are durable.
- Confirm the owning team and routing key.
- Confirm the service criticality and data classification.

### 2. Apply Semantic Conventions

Use OpenTelemetry attributes first:

```yaml
service.namespace: checkout
service.name: checkout-api
service.version: 2026.04.12-1
deployment.environment.name: production
deployment.id: deploy-20260412-1422
k8s.namespace.name: checkout
k8s.deployment.name: checkout-api
```

Add organization attributes only where needed:

```yaml
org.application.name: checkout
org.team.name: payments-platform
org.service.criticality: tier-1
org.alert.routing_key: payments-platform-primary
org.telemetry.tier: full
org.data.classification: confidential
org.user_journey.name: checkout
```

Human review gate:

- Confirm no org attribute duplicates an upstream OpenTelemetry attribute.
- Confirm allowed values and cardinality.
- Confirm enforcement points: schema, CI, Helm, admission, runtime.

### 3. Define Service Observability Intent

Create a `ServiceObservability` object that records the service's operational contract:

```yaml
apiVersion: observability.platform/v1alpha1
kind: ServiceObservability
metadata:
  name: checkout-api
service:
  namespace: checkout
  name: checkout-api
  environment: production
  criticality: tier-1
  userJourneys:
    - checkout
ownership:
  team: payments-platform
  routingKey: payments-platform-primary
  costCenter: cc-1234
telemetry:
  tier: full
  dataClassification: confidential
```

Human review gate:

- Confirm this intent describes the service rather than the backend implementation.

### 4. Define SLO Intent

Create SLO intent in backend-neutral terms:

```yaml
apiVersion: observability.platform/v1alpha1
kind: SLOIntent
metadata:
  name: checkout-api-availability
target:
  application: checkout
  service: checkout-api
  environment: production
  userJourney: checkout
sli:
  type: availability
  successCondition: HTTP server requests for checkout API complete without server-side failure.
  evaluationBasis: request
objective:
  target: 99.9
  window: 30d
telemetryBinding: checkout-api-availability-http-requests
burnRatePolicy: standard-multi-window
```

Human review gate:

- Confirm the SLO reflects user or consumer experience.
- Confirm the objective and window are realistic.
- Confirm the SLI basis: request, event, or time-slice.

### 5. Bind SLO To Existing Telemetry

Map the SLO to telemetry:

```yaml
apiVersion: observability.platform/v1alpha1
kind: SLIQueryBinding
metadata:
  name: checkout-api-availability-http-requests
signal: metric
query:
  numerator: Requests where service.name=checkout-api and status is not server error.
  denominator: Requests where service.name=checkout-api.
  groupBy:
    - service.name
    - deployment.environment.name
  minimumVolume: at least 100 requests per evaluation window
backendTarget: generic-metrics-backend
```

If telemetry is missing, record an instrumentation gap:

```yaml
gap: checkout-api does not emit request outcome metrics with service.name and deployment.environment.name
requiredAction: instrument HTTP server request metrics before generating the availability SLO
```

Human review gate:

- Confirm the telemetry proves the SLI.
- Confirm exclusions and minimum volume rules.
- Confirm gaps before creating backend artifacts.

### 6. Define Telemetry Pipeline Requirements

When service telemetry depends on collectors, routing, transformations, buffering, or fallback delivery, define the pipeline contract before generating backend artifacts:

```yaml
telemetryPipeline:
  sources:
    - checkout-api OpenTelemetry exporter
    - checkout-api structured logs
  processors:
    - service identity normalization
    - data classification redaction
    - request outcome metric shaping
  sinks:
    - primary telemetry backend
    - incident-critical fallback path
  deliveryPolicy:
    availabilitySloTelemetry: durable with retry or explicit generation gap
    diagnosticLogs: best-effort unless needed for incident response
  bufferPolicy:
    whenFull: block or sample before dropping SLO telemetry
    selfObservability:
      - queue depth
      - oldest buffered item age
      - dropped records
      - sink delivery failures
  validation:
    - topology validation
    - transformation unit tests
    - redaction tests
    - cardinality-limit tests
```

If the telemetry path is unknown, record a generation gap instead of assuming the backend query is trustworthy.

Human review gate:

- Confirm source-to-sink lineage for SLO and alert evidence.
- Confirm delivery, buffering, redaction, and cardinality trade-offs.
- Confirm pipeline self-observability can distinguish missing telemetry from healthy service behavior.

### 7. Classify Alerts, Notifications, And Findings

Use the model taxonomy:

- Alert: immediate action, direct or highly probable impact, complete context.
- Notification: useful operational signal, no immediate human action.
- Finding: semantic, policy, or telemetry drift.

For a serving API, a page-worthy alert can be:

```yaml
name: exposed-route-has-no-ready-backend
classification: alert
reason: traffic entry point resolves to zero ready backends
```

A notification can be:

```yaml
name: job-execution-failed
classification: notification
reason: no declared freshness or completion SLO
```

Human review gate:

- Confirm every page-worthy alert requires immediate action.
- Confirm notifications are not hidden alerts.
- Confirm findings have DevEx or policy remediation paths.

### 8. Attach Alert Context

Every alert must include the full context contract:

```yaml
identity:
  application: checkout
  service: checkout-api
  environment: production
  namespace: checkout
  workload: checkout-api
  serviceVersion: 2026.04.12-1
  deploymentId: deploy-20260412-1422
ownership:
  team: payments-platform
  routingKey: payments-platform-primary
  criticality: tier-1
impact:
  capability: checkout
  route: /checkout
  trafficState: blocked
  readyReplicas: 0
  desiredReplicas: 4
currentState:
  firstDetected: 2026-04-12T13:05:00Z
  lastKnownHealthyTime: 2026-04-12T12:45:00Z
  trend: worsening
changeContext:
  recentDeployment: deploy-20260412-1422
  image: checkout-api:2026.04.12-1
technicalEvidence:
  routeBackendsReady: 0
  workloadAvailableReplicas: 0
  recentEvents: readiness probe failed
decisionSupport:
  likelyFailureMode: rollout produced pods that do not become ready
  recommendedAction: rollback or inspect readiness probe failure
  playbook: route-has-no-ready-backend
dashboard: route-backend-readiness-decision-dashboard
```

Human review gate:

- Confirm the alert message is enough to decide the first action.
- Confirm the playbook action exists or the alert is marked as a first-time problem.

### 9. Define Dynamic Decision Dashboard

The alert should open a dashboard already scoped to the incident:

```yaml
apiVersion: observability.platform/v1alpha1
kind: DecisionDashboard
metadata:
  name: route-backend-readiness-decision-dashboard
variables:
  - alert_time
  - application
  - service
  - environment
  - namespace
  - route
  - workload
  - deployment_id
questions:
  - Is traffic currently arriving?
  - Is traffic reaching ready backends?
  - Did readiness fail after a deployment or config change?
  - Are users seeing errors or frustration?
  - What playbook action applies?
panels:
  - route traffic
  - service endpoints
  - desired versus ready replicas
  - rollout timeline
  - recent platform events
  - correlated logs and traces
  - RUM impact
  - SLO burn rate
```

Human review gate:

- Confirm the dashboard answers decisions rather than showing generic overview charts.

### 10. Generate Backend Artifacts

Only after intent is reviewed should an agent generate backend-specific outputs:

```yaml
apiVersion: observability.platform/v1alpha1
kind: GeneratedArtifactManifest
metadata:
  name: checkout-api-observability
sourceIntent: service-observability/checkout-api
artifacts:
  - type: alert-rule
    path: generated/alerts/route-has-no-ready-backend.yaml
    backendTarget: generic-alerting-backend
  - type: dashboard
    path: generated/dashboards/route-backend-readiness.json
    backendTarget: generic-dashboard-backend
  - type: admission-policy
    path: generated/policies/semantic-attributes.yaml
    backendTarget: generic-admission-controller
  - type: telemetry-pipeline
    path: generated/pipelines/checkout-api-telemetry.yaml
    backendTarget: generic-pipeline-engine
  - type: pipeline-test
    path: generated/pipelines/checkout-api-telemetry-test.yaml
    backendTarget: generic-pipeline-engine
```

Human review gate:

- Confirm generated outputs trace back to source intent.
- Confirm backend-specific limitations are documented.

### 11. Enforce Through DevEx

Apply enforcement in layers:

```text
local validation -> CI -> Helm rendering -> admission policy -> runtime drift checks
```

Expected checks:

- Required semantic attributes exist.
- Org attributes use allowed values.
- Serving workloads have owner and criticality.
- Alerts include context, dashboard, and playbook.
- SLOs have telemetry bindings or instrumentation gaps.
- Pipeline topology, transformations, delivery policy, buffer policy, and redaction behavior have validation.
- Generated artifacts are reproducible from intent.

Human review gate:

- Confirm enforcement failures appear where developers can fix them early.

## Completion Criteria

The service is onboarded when:

- service identity is stable and approved
- semantic conventions are defined and enforceable
- SLO intents are bound to telemetry or have explicit gaps
- alerts, notifications, and findings are classified correctly
- page-worthy alerts include full context
- decision dashboards open scoped from alert dimensions
- generated backend artifacts trace to source intent
- telemetry pipeline requirements or gaps are explicit for SLO and alert evidence
- local and CI validation paths exist

## Notes For SRE Rules Migration

This scenario also defines the target shape for migrating existing SRE rules. A legacy rule should become an SLO, alert, notification, finding, dashboard, or generated artifact only after its intent is clear.

Do not migrate old rules one-to-one. Reclassify them by user impact, actionability, owner, telemetry binding, and decision context.
