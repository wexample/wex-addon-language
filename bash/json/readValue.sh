#!/usr/bin/env bash

jsonReadValueArgs() {
  _DESCRIPTION="Read a value from a json file"
  # shellcheck disable=SC2034
  _ARGUMENTS=(
    'file f "File" true'
    'key k "Key to read" true'
  )
}

jsonReadValue() {
  # Double slashes for windows like paths.
  FILE=$(echo "${FILE}" | sed 's/\\/\\\\/g')
  # Allow regex search patterns
  sed -n "s/^[ ]\{0,\}\"${KEY}\":[ ]\{0,\}\"\(.\{0,\}\)\",\{0,\}/\1/p" "${FILE}"
}
