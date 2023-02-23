#!/usr/bin/env bash

jsonReadValueArgs() {
 # shellcheck disable=SC2034
  _ARGUMENTS=(
   'file f "File" true'
   'key k "Key to read" true'
 )
}

jsonReadValue() {
  # Handle OS specific path
  FILE=$(wex-exec path/safe -p="${FILE}")
  # Double slashes for windows like paths.
  FILE=$(echo "${FILE}" | sed 's/\\/\\\\/g')
  # Allow regex search patterns
  sed -n "s/^[ ]\{0,\}\"${KEY}\":[ ]\{0,\}\"\(.\{0,\}\)\",\{0,\}/\1/p" "${FILE}"
}
