#!/usr/bin/env bash

jsonReadValueTest() {
  local FILEPATH
  FILEPATH=$(_wexTestSampleInit "jsonSample.json")

  VALUE=$(wex-exec json/readValue -f="${FILEPATH}" -k="simpleValue")

  _wexTestAssertEqual "${VALUE}" "value"
}
