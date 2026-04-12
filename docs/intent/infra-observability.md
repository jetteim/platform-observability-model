# Infra Observability Model

Infra observability is the platform provider's contract for running workloads.

## Required Capabilities

- Workload health: desired, ready, available, terminating, unschedulable, restart, and probe state.
- Routing health: route to service to endpoint readiness, including zero-ready-backend detection.
- Capacity health: CPU, memory, storage, network, pod density, quota, and throttling pressure.
- Control health: controller errors, admission failures, reconciliation lag, and rollout status.
- Telemetry pipeline health: collector availability, queue pressure, dropped spans/logs/metrics, exporter errors, and sampling state.
- Policy health: failed mutations, failed validations, bypasses, and drift from declared semantic conventions.

## Model Requirements

Infra telemetry must be usable without knowing the underlying cloud or backend. Topology can include generic platform, cluster, namespace, node, workload, pod, container, route, and dependency dimensions.

Infra observability should provide application featured alerts only when a platform signal proves application impact and includes the required application context.

