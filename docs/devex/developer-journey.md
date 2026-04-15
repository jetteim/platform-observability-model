# Developer Journey

The default path should make correct observability easier than custom observability.

## Service Owner Flow

1. Declare service identity, owner, criticality, and user-facing capability.
2. Select telemetry tier and data classification.
3. Define SLO intent or record instrumentation gaps.
4. Confirm telemetry source-to-sink lineage, transformation tests, delivery policy, and buffer behavior when SLO or alert evidence depends on the pipeline.
5. Use default application featured alerts when criteria are met.
6. Generate backend artifacts.
7. Validate locally and in CI.
8. Deploy with admission enforcement.

## Platform Owner Flow

1. Define semantic convention registry.
2. Provide package, Helm, and CI templates.
3. Enforce required identity through policy.
4. Provide default telemetry pipeline contracts, validation templates, and self-observability requirements.
5. Monitor telemetry pipeline and semantic drift.
6. Review exceptions and high-cardinality attributes.
