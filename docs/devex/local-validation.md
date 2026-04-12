# Local Validation

Local validation should be fast and dependency-light.

Minimum checks:

- required files exist
- JSON schemas parse
- YAML examples parse
- examples include stable service identity
- intent docs remain backend-neutral
- alert examples include context, dashboard, owner, and playbook

Local validation is not a replacement for backend-specific dry runs. It protects the model contract before generation begins.

