# SLO And Error Budget Model

## Unified SLO Intent

SLOs are declared as neutral intent, then bound to existing telemetry.

An SLO intent must define:

- application and service identity
- user journey or capability
- SLI type
- success condition
- objective
- evaluation window
- evaluation basis: event, request, or time-slice
- telemetry binding
- burn-rate policy
- alert routing
- decision dashboard
- playbook action

## Telemetry Binding

An SLI query binding maps neutral SLO intent to backend telemetry. It must define:

- signal type: metric, span, log, RUM event, synthetic check, or probe
- source attributes
- numerator condition
- denominator condition
- grouping
- exclusions
- minimum volume rules
- backend target

If no telemetry exists, the binding records an instrumentation gap instead of inventing a rule.

## Burn-Rate Alerts

Burn-rate alerts are generated from SLO intent. They alert on error-budget consumption velocity, not remaining budget alone.

The model supports multiple windows and severities. A page-worthy burn-rate alert must include the SLO, SLI, objective, window, consumed budget, affected service, playbook, and decision dashboard.

