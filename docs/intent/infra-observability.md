# Infra Observability Model

Infra observability is the platform provider's contract for running workloads.

## Required Capabilities

- Workload health: desired, ready, available, terminating, unschedulable, restart, probe state, rollout state, and controller ownership.
- Routing health: route to service to endpoint readiness, ingress and egress reachability, DNS or discovery health, certificate expiry, and zero-ready-backend detection.
- Capacity health: CPU, memory, storage, network, pod density, quota, allocation, saturation, throttling, eviction pressure, and autoscaling headroom.
- Control health: scheduler, controller, admission, reconciliation, API availability, API latency, rollout status, and configuration convergence.
- Telemetry pipeline health: collector health, source health, receiver health, processor health, queue pressure, buffer age, dropped spans/logs/metrics, redaction failures, cardinality-limit actions, exporter errors, acknowledgement status, sampling state, and backend delivery.
- Policy health: failed mutations, failed validations, bypasses, exception drift, semantic convention drift, and data security or cost-control drift.
- Event and inventory health: platform events, change events, object inventory, lifecycle transitions, and metadata coverage for topology correlation.
- Correlation health: ability to move from platform symptom to workload, owner, route, release, SLO, logs, metrics, traces, and related events without manual tag guessing.

## Model Requirements

Infra telemetry must be usable without knowing the underlying cloud or backend. Topology can include generic platform, cluster, namespace, node, workload, pod, container, route, and dependency dimensions.

Infra observability should provide application featured alerts only when a platform signal proves application impact and includes the required application context.

## Infrastructure Signal Layers

Infra observability should define coverage for each layer separately:

- platform: region or site, cluster group, control-plane dependency, shared add-on, and telemetry backend delivery
- cluster: API availability, scheduler health, controller reconciliation, admission behavior, cluster capacity, and cluster events
- namespace: quota, policy status, workload inventory, ownership, and noisy-neighbor pressure
- node: readiness, allocatable capacity, pressure, kernel or runtime errors, filesystem, network, and pod density
- workload: desired versus available state, rollout progress, replica health, restart patterns, probe failures, scheduling failures, and autoscaler behavior
- pod and container: lifecycle state, termination reason, resource requests and limits, throttling, OOM, filesystem, image pull, and probe state
- route and network: route, service, endpoint, ingress, egress, DNS, certificate, and dependency reachability
- telemetry pipeline: collection, transformation, routing, buffering, backpressure, sampling, acknowledgement, export, backend ingestion, and data freshness
- policy and enforcement: semantic attributes, admission decisions, mutation status, validation status, exceptions, and drift

## Topology Correlation

Infra observability must preserve enough topology correlation to answer:

- Which workload, route, namespace, node, cluster, and owner are affected?
- Is the problem isolated, spreading, or platform-wide?
- Did a rollout, config change, policy change, autoscaling event, or capacity shift precede the symptom?
- Are application SLOs or user journeys affected, or is this a notification or finding?
- Which logs, events, metrics, traces, and inventory records describe the same entity?

Use stable object identifiers where names can be reused. Use human-readable names for triage, but preserve unique identifiers where the platform provides them.

## Infrastructure Alert Context Contract

Infrastructure alert context contract is equivalent in rigor to the application alert context contract. A page-worthy infrastructure alert must include:

- identity: platform, cluster, namespace, node, workload, pod or container when relevant, route or dependency when relevant, and environment
- ownership: platform owner, workload owner when impact crosses the boundary, routing key, escalation target, and support expectation
- impact: affected workload capacity, route readiness, namespace quota, node pool, control-plane function, telemetry reliability, SLO or user impact when known, and blast radius
- current state: measured value, expected value, threshold or objective, breach duration, trend, first detected time, and last known healthy time
- change context: recent rollout, configuration change, autoscaler event, admission policy change, node lifecycle event, route change, certificate change, or telemetry pipeline change
- technical evidence: metrics, logs, traces, events, inventory, topology graph, collector status, dropped telemetry, and representative failure records
- decision support: likely failure mode, immediate safe action, rollback or mitigation path, playbook section, dashboard, suppression or deduplication state, and escalation guidance

Do not page on isolated restarts, node pressure, collector drops, policy drift, or quota pressure by default. Promote them only when impact, owner, action, playbook, and scoped decision dashboard are present.

## Readiness Checks

An infra observability design is ready when:

- every signal layer has collection, freshness, ownership, and cardinality expectations
- telemetry pipeline topology, component contracts, delivery policy, buffer policy, self-observability, and validation are explicit
- metadata coverage supports filtering, aggregation, and alert routing for dynamic infrastructure
- control-plane, workload, route, capacity, telemetry pipeline, policy, event, inventory, and change signals are represented
- alerts, notifications, and findings are classified before backend generation
- infrastructure decision dashboards open scoped from alert dimensions
- backend artifacts can be regenerated from neutral intent
