# Principles

## Intent First

The model describes what an organization expects from observability. Backend monitors, dashboards, alerting rules, custom resources, and API calls are generated artifacts.

## OpenTelemetry First

OpenTelemetry semantic conventions are the default vocabulary for resources, spans, metrics, logs, and events. Organization-wide extensions are allowed only when a concept is operationally required and not already represented by upstream conventions.

## No Anxiety-Driven Observability

Observability must reduce uncertainty. Humans should not be expected to periodically inspect overview dashboards to discover incidents.

Alerts must include enough context to decide and act. Dashboards must support incident response and open already scoped from alert context.

## Platform Agnostic

The model assumes a generic Kubernetes-based platform and OpenTelemetry-compatible telemetry. It must not require a specific cloud provider, cluster product, observability backend, or vendor-specific monitor resource.

## Generated Implementation

Telemetry backend resources, admission policies, Helm snippets, workflow files, and API calls are generated from neutral intent. Hand-authored backend resources are acceptable during migration, but they should be treated as intermediate artifacts.

## Observable Pipelines

Telemetry pipelines are not invisible plumbing. Collection, transformation, buffering, routing, delivery, and pipeline self-observability are part of the model when they affect SLOs, incident response, data security, cost, or backend generation.
