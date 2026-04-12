# Platform Observability Model Design

## Goal

Create an intention-first observability model that can be used to design, validate, and generate platform-agnostic observability for Kubernetes workloads using OpenTelemetry semantics and backend-specific generated artifacts.

## Source Context

The model is informed by local repositories under `NEW_WORK`, including observability documentation, SRE docs, SRE rules, monitor resources, telemetry package wrappers, Kyverno policies, Helm charts, and GitHub Actions workflows.

Those repositories are evidence. Their implementation choices are not copied as architecture. Vendor-specific names, cloud-specific locations, and proprietary backend resource types are generalized into neutral concepts.

## Architecture

The repository has four layers:

1. Intent documents define the operating model.
2. Schemas define stable contracts for service observability, platform observability, semantic conventions, SLOs, alert context, dashboards, and generated artifacts.
3. Examples show minimal valid intent instances.
4. Validation scripts make the repo executable on a clean workstation.

Backend-specific implementation belongs in generators, org repositories, or follow-on projects. This repo defines what those generators must preserve.

## Core Model

The model separates:

- Infra observability: cluster, namespace, node, workload, network, control-plane, and telemetry pipeline health.
- Application observability: user-facing capabilities, services, releases, dependencies, RUM signals, SLOs, alerts, playbooks, and decision dashboards.
- Semantic conventions: OpenTelemetry baseline plus org-wide extensions.
- Enforcement: local validation, CI, Helm contracts, admission policy, runtime drift detection.
- SRE rules: generated backend artifacts from unified SLO and alert intent.

## Alert Philosophy

The model explicitly rejects anxiety-driven observability.

An alert must include enough context to act without manually hunting through overview dashboards. Dashboards are incident response tools and should open dynamically scoped to the alert dimensions, time window, service identity, release, and likely failure mode.

Events that are useful but do not require immediate human action are notifications. Standards drift is a finding handled through DevEx, CI, admission feedback, or backlog.

## Skill Relationship

The public `observability-engineering` skill should not wrap this repo scan. It should teach a reusable workflow for building observability from this model:

- define neutral intent;
- bind SLOs to existing telemetry;
- extend and enforce semantic conventions;
- generate backend artifacts;
- validate alert context and decision dashboards;
- migrate SRE rules into unified SLO and alert intent.

## Acceptance

- The private model repo can be cloned and validated on a clean machine.
- The public skill can be installed independently.
- The workstation bootstrap can refresh and install both.
- The model documents intentions rather than current implementation.
- The SRE migration path is based on a unified interface for SLOs and generated artifacts.

