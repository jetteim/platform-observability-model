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
- Generation must fail when required alert context or SLO bindings are missing.

