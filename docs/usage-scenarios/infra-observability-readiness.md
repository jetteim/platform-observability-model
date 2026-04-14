# Infra Observability Readiness

This scenario shows how an agent should prepare or review infrastructure observability for a Kubernetes-based platform without starting from backend dashboards or copied vendor monitors.

## Agent Inputs

- platform ownership and escalation model
- topology inventory for platform, clusters, namespaces, nodes, workloads, pods, containers, routes, and shared dependencies
- OpenTelemetry resource attributes, platform labels, and metadata propagation rules
- existing metrics, logs, traces, events, inventory, synthetics, probes, and change records
- telemetry collector, receiver, processor, queue, exporter, sampling, and backend ingestion configuration
- existing alerts, notifications, dashboards, playbooks, SLO bindings, and generated artifacts
- CI, Helm, admission policy, and runtime validation paths
- data security, cardinality, retention, and cost-control constraints

## Agent Outputs

- `PlatformObservability`
- infrastructure signal inventory
- metadata coverage assessment
- topology correlation requirements
- telemetry pipeline health requirements
- infrastructure alert context contract
- decision dashboard intent
- alert, notification, and finding classifications
- instrumentation and enforcement gaps
- generated artifact manifest or backend generation request

## Workflow

1. Establish platform owner, escalation, supported environments, and topology boundaries.
2. Inventory signal coverage by layer: platform, cluster, namespace, node, workload, pod, container, route, network, telemetry pipeline, policy, event, inventory, and change.
3. Check metadata coverage for stable identity, human-readable names, owner, environment, workload, route, node, cluster, version, and change context.
4. Define topology correlation so metrics, logs, traces, events, inventory, and dashboards can pivot across the same affected entity.
5. Define telemetry pipeline health for collectors, receivers, processors, queues, exporters, sampling, dropped data, data freshness, and backend delivery.
6. Separate platform symptoms from application impact. Promote infrastructure alerts to page-worthy only when impact, owner, action, playbook, and decision dashboard are complete.
7. Define notifications for early warning, capacity planning, telemetry quality, and drift that do not require immediate human action.
8. Define findings for standards, policy, metadata, cardinality, security, and cost-control drift.
9. Define infrastructure decision dashboards that open scoped from alert dimensions and answer hosting, routing, capacity, control-plane, telemetry, policy, and change questions.
10. Generate backend artifacts only after neutral intent, context, and classification are complete.

## Refusal Conditions

- The design starts from backend monitor syntax instead of infrastructure intent.
- Page-worthy alerts lack owner, impact, playbook, current state, change context, or scoped dashboard.
- Dynamic infrastructure lacks metadata coverage for filtering, routing, or topology correlation.
- Telemetry pipeline health is absent, so missing data cannot be distinguished from healthy infrastructure.
- Infrastructure symptoms are treated as application impact without supporting route, workload, SLO, or user evidence.
- High-cardinality attributes are required for resource identity without an event-only exception or cost-control plan.

## Human Review Gates

- Confirm platform owner, escalation, and support expectations.
- Confirm topology boundaries and required metadata.
- Confirm signal coverage and instrumentation gaps.
- Confirm alert, notification, and finding classifications.
- Confirm dashboard questions and playbook actions.
- Confirm cardinality, retention, and data security constraints.

## Completion Criteria

- platform observability defines topology, signal layers, metadata coverage, telemetry pipeline health, enforcement, and generated artifact targets
- every page-worthy infrastructure alert satisfies the infrastructure alert context contract
- every notification and finding has owner, evidence, and backlog or review handling
- dashboards open from alert dimensions and do not require manual overview browsing
- instrumentation gaps and backend generation gaps are explicit
