#!/usr/bin/env bash

phpConstantChangeTest() {
  local FILEPATH

  # Revert file.
  FILEPATH=$(_wexTestSampleInit sample.php)

  wex php/constantChange -f="${FILEPATH}" -k=TEST_VAR_ONE -v=tested
  _wexTestSampleDiff sample.php true "VAR_ONE changed"

  wex php/constantChange -f="${FILEPATH}" -k=TEST_VAR_TWO -v=tested
  _wexTestSampleDiff sample.php true "VAR_TWO changed"

  wex php/constantChange -f="${FILEPATH}" -k=TEST_VAR_ONE -v=one
  wex php/constantChange -f="${FILEPATH}" -k=TEST_VAR_TWO -v=two
  _wexTestSampleDiff sample.php false "vars rollback"
}
