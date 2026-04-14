# Observability Boundaries

## Infra Observability

Infra observability covers the shared platform surface:

- Kubernetes control plane and worker health.
- Nodes, scheduling, resource pressure, and autoscaling behavior.
- Namespaces, workloads, pods, containers, jobs, and controllers.
- Network routing, service discovery, ingress, egress, and endpoint readiness.
- Telemetry pipelines, collectors, exporters, sampling, dropped data, and backend delivery.
- Shared platform add-ons and admission policy health.

Infra observability answers whether the platform can host and route workloads safely.
It must also prove whether missing or degraded telemetry is a platform, pipeline, backend, or instrumentation problem before responders trust apparent health.

## Application Observability

Application observability covers user and product outcomes:

- User journeys, APIs, background capabilities, and critical workflows.
- Service-level indicators and service-level objectives.
- Release, deployment, and dependency context.
- RUM signals for browser or client experience.
- Logs, traces, metrics, and events tied to service identity.
- Page-worthy alerts, notifications, playbooks, and decision dashboards.

Application observability answers whether users and consumers are receiving the intended behavior.

## Shared Boundary

The boundary is crossed deliberately. Infra telemetry can produce application featured alerts when it proves direct or highly probable service impact. Application telemetry can identify platform risk when the symptom points to routing, scheduling, DNS, certificates, storage, or telemetry pipeline failure.
