# Admission Policy Patterns

Admission policy enforces the platform contract at deployment time.

Useful patterns:

- mutate workload labels from namespace or service metadata
- inject OpenTelemetry resource attributes
- validate required identity fields
- validate telemetry opt-in and opt-out labels
- reject invalid semantic convention values
- reject high-cardinality resource attributes
- require owner, criticality, and data classification for serving workloads
- add policy test fixtures for every mutation and validation

The model does not require a specific policy engine. Kyverno-style mutate and validate policies are a useful implementation pattern.

