# Decision Dashboard Model

Decision dashboards are opened from alerts. They are not manual overview boards.

## Required Behavior

A decision dashboard must open with variables already set from alert context:

- time window around detection
- application
- service
- component or workload
- environment
- namespace
- route, page, API, or user journey when applicable
- deployment or release
- team
- SLO when applicable

## Required Panels

Each dashboard should answer:

- Is traffic currently arriving?
- Is traffic reaching ready backends?
- Did the condition start after a deployment or config change?
- Are workloads unavailable, unscheduled, crash looping, or failing probes?
- Are users seeing errors, latency, or frustration?
- Is the SLO burning?
- Which dependency or platform layer is most likely involved?
- Which playbook action applies?

## Dashboard Output Contract

Dashboard definitions are generated artifacts. The source intent should define:

- dashboard purpose
- supported alert types
- required variables
- required evidence panels
- required decision panels
- backend target
- generated artifact location

