# Developer Journey

The default path should make correct observability easier than custom observability.

## Service Owner Flow

1. Declare service identity, owner, criticality, and user-facing capability.
2. Select telemetry tier and data classification.
3. Define SLO intent or record instrumentation gaps.
4. Use default application featured alerts when criteria are met.
5. Generate backend artifacts.
6. Validate locally and in CI.
7. Deploy with admission enforcement.

## Platform Owner Flow

1. Define semantic convention registry.
2. Provide package, Helm, and CI templates.
3. Enforce required identity through policy.
4. Monitor telemetry pipeline and semantic drift.
5. Review exceptions and high-cardinality attributes.

