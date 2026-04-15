# Backend Generation Model

Backend-specific resources are outputs from neutral intent.

## Inputs

- service observability intent
- platform observability intent
- semantic convention registry
- SLO intent
- SLI query binding
- alert intent
- decision dashboard intent
- backend target

## Outputs

Generated artifacts can include:

- backend monitor or alert resources
- recording or query rules
- dashboard definitions
- telemetry pipeline configuration
- pipeline transformation tests
- pipeline validation commands
- alert routing metadata
- playbook links
- admission policies
- Helm values
- CI workflow snippets
- API call manifests

## Rules

- Generated artifacts must carry a manifest linking them back to source intent.
- Backend-specific names must not become source-of-truth identifiers.
- Query templates must preserve semantic convention mappings.
- Pipeline artifacts must preserve source-to-sink lineage, transformation contracts, buffer behavior, and delivery policy from the source intent.
- Generation must fail when required alert context or SLO bindings are missing.
- Generation must report a gap when the target backend or pipeline engine cannot enforce required redaction, cardinality, delivery, or validation behavior.
