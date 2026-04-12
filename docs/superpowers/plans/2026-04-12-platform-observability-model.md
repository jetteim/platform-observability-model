# Platform Observability Model Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a private platform observability model repo and a public `observability-engineering` skill that can use the model to prepare observability and SRE-rule migration work.

**Architecture:** Store neutral intent in Markdown, contracts in JSON Schema, examples in YAML, and validation in a dependency-light shell script. Keep backend-specific resources as generated outputs outside the model.

**Tech Stack:** Markdown, JSON Schema, YAML examples, POSIX shell, Python standard library, Ruby Psych YAML parser.

---

### Task 1: Model Repository Foundation

**Files:**
- Create: `README.md`
- Create: `docs/superpowers/specs/2026-04-12-platform-observability-model-design.md`
- Create: `docs/superpowers/plans/2026-04-12-platform-observability-model.md`

- [x] **Step 1: Create repository directories**

Run: `mkdir -p docs/intent docs/devex docs/migration docs/sources docs/superpowers/specs docs/superpowers/plans schemas examples scripts`

Expected: directories exist.

- [x] **Step 2: Add design and plan documents**

Run: `git status --short`

Expected: new docs are visible as untracked files.

### Task 2: Intent Documents

**Files:**
- Create: `docs/intent/*.md`
- Create: `docs/devex/*.md`
- Create: `docs/migration/*.md`
- Create: `docs/sources/source-scan-summary.md`

- [x] **Step 1: Write observability boundaries and principles**

Expected: model distinguishes infra observability, application observability, notifications, findings, alerts, dashboards, and SLOs.

- [x] **Step 2: Write semantic convention and enforcement model**

Expected: model starts from OpenTelemetry and adds explicit org attributes only where required.

- [x] **Step 3: Write SRE migration model**

Expected: SRE rules become generated artifacts from SLO and alert intent.

### Task 3: Schemas And Examples

**Files:**
- Create: `schemas/*.schema.json`
- Create: `examples/*.yaml`

- [x] **Step 1: Add minimal schemas**

Expected: schemas parse as JSON and define required intent fields.

- [x] **Step 2: Add examples**

Expected: examples parse as YAML and demonstrate the intended contracts.

### Task 4: Validation

**Files:**
- Create: `scripts/validate.sh`

- [x] **Step 1: Add dependency-light validation**

Expected: script checks required files, JSON parsing, YAML parsing, and vendor neutrality for intention docs.

- [x] **Step 2: Run validation**

Run: `./scripts/validate.sh`

Expected: `validation ok`.

### Task 5: Skill And Bootstrap Integration

**Files:**
- Create public repo: `observability-engineering`
- Modify: `platform-workstation-bootstrap/scripts/install-skills.sh`
- Modify: `platform-workstation-bootstrap/scripts/refresh-github.sh`
- Modify: `platform-workstation-bootstrap/manifests/github-repos.txt`
- Modify: `platform-workstation-bootstrap/docs/skill-trigger-examples.md`
- Modify: `platform-workstation-bootstrap/README.md`

- [x] **Step 1: Create the public skill repo**

Expected: skill describes reusable observability engineering, not this one repo scan.

- [x] **Step 2: Add bootstrap install support**

Expected: clean workstation refreshes the private model repo and public skill repo, then installs the skill.

- [x] **Step 3: Verify bootstrap**

Run: `./scripts/verify.sh`

Expected: bootstrap verification passes.
