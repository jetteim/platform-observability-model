# Data Security And Cost Controls

## Security

Telemetry must not become a second data lake for secrets or private data.

Controls should exist at multiple layers:

- application instrumentation
- logging libraries
- OpenTelemetry processors
- collectors
- telemetry pipeline transforms
- pipeline buffers and quarantine paths
- admission policy
- backend ingestion filters
- retention policy

Sensitive data must be redacted before it becomes searchable telemetry whenever possible.

## Cost

Cost controls must be part of the model:

- low-cardinality semantic attributes by default
- explicit high-cardinality exceptions
- sampling policy
- log opt-in and retention policy
- RUM/session replay sampling
- telemetry tier by service criticality
- cardinality and ingestion budget alerts as notifications unless incident response is impaired
- pipeline-level cardinality limits and drop/quarantine behavior for high-risk metric labels
