# CI Validation

CI should turn observability drift into review feedback.

Recommended checks:

- schema validation
- semantic convention registry validation
- example rendering
- Helm render validation
- rendered manifest diff
- admission policy tests
- alert context completeness checks
- generated artifact manifest checks
- optional CI workflow trace export through OpenTelemetry

CI should comment on pull requests when generated observability artifacts change.

