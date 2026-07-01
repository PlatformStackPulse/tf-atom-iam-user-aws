# Unit Tests for tf-atom-iam-user-aws
#
# These tests use a mock AWS provider — no real AWS calls are made.
# Run with:      terraform test -test-directory=tests/unit
# Run verbose:   terraform test -test-directory=tests/unit -verbose
# Run specific:  terraform test -test-directory=tests/unit -run "creates_when_enabled"
#
# IMPORTANT: assertions target plan-KNOWN values only (label pass-throughs,
# the `enabled` flag). Computed AWS attributes (arns/ids) are unknown under a
# mock provider and must not be asserted against.

mock_provider "aws" {}

# Standard tf-label inputs shared by every run block.
variables {
  namespace   = "eg"
  stage       = "test"
  name        = "thing"
  environment = "ue1"
}

# ---------------------------------------------------------------------------
# Test: module is enabled by default and produces its label context
# ---------------------------------------------------------------------------
run "creates_when_enabled" {
  command = plan

  assert {
    condition     = output.enabled == true
    error_message = "Module should report enabled == true when var.enabled is true (default)."
  }
}

# ---------------------------------------------------------------------------
# Test: disabling the module creates nothing
# ---------------------------------------------------------------------------
run "disabled_creates_nothing" {
  command = plan

  variables {
    enabled = false
  }

  assert {
    condition     = output.enabled == false
    error_message = "Module should report enabled == false when var.enabled is false."
  }
}
