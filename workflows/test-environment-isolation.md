# Test Environment Isolation

Inventory data stores, queues, external APIs, filesystem, clock, network and credentials used by tests. Prefer ephemeral resources and synthetic data; block destructive tests against production/shared systems. Ensure deterministic setup/teardown, safe cleanup after failure, clear mocks versus real integrations, reproducible fixtures, and recorded environment parity gaps. Track flaky-test evidence separately from product defects.
