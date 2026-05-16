# AGENTS.md

This file provides guidance to Codex CLI and other AI coding agents when working with code in this repository.

## Project Overview

PowerToggle VM automatically starts and deallocates Azure VMs on a schedule defined by resource tags (`AutoStart`, `AutoStop`, `AutoEnabled`, `AutoWeekdaysOnly`). An Event Grid-triggered Azure Function ingests tag changes in real time, a minute-level timer executes due actions, and a daily job extends the scheduling horizon.

## Structure

- `functions/src/` — Azure Functions app for tag-change ingestion and scheduled VM actions.
- `infra/base/` — Terraform for core function app, storage, Event Grid, RBAC, and resource groups.
- `infra/eventgrid/` — Terraform for Event Grid subscription wiring.
- `.github/workflows/` — linting, Terraform, and tagging workflows.

## Common Commands

```bash
cd functions/src
npm ci
npm run build --if-present
```

For Terraform changes, run formatting and validation in the affected root module before proposing an apply.

```bash
cd infra/base
terraform fmt
terraform validate

cd ../eventgrid
terraform fmt
terraform validate
```

## Working Guidelines

- Treat `infra/**/*.tfvars`, local function settings, and environment files as sensitive; do not print or expose secrets.
- VM schedule behaviour is tag-driven; preserve backwards compatibility for existing tag names unless explicitly changing the contract.
- Keep the base infrastructure and Event Grid subscription root modules separate unless a change explicitly spans both.
