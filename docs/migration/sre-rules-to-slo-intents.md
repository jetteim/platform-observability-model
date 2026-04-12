# SRE Rules To SLO Intents

## Migration Flow

1. Inventory existing rules and group by capability.
2. Classify each rule as alert, notification, finding, or obsolete.
3. Extract the user-facing or platform-facing objective.
4. Define neutral SLO intent where an objective exists.
5. Define telemetry bindings to existing signals.
6. Preserve existing queries as backend bindings, not source truth.
7. Generate backend artifacts from the new intent.
8. Compare generated artifacts against existing behavior.
9. Cut over only after alert context and dashboard links are complete.

## Migration Rule

If a rule cannot explain user/service impact, owner, immediate action, and playbook path, it should not become a page-worthy alert by default.

