#!/bin/bash
set -euo pipefail

if [[ -n "${HOMEBREW_PKG_USER:-}" ]]
then
  exit 0
fi

logged_in_user=$(echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ { print $3 }')
if [[ "${logged_in_user}" =~ _mbsetupuser|loginwindow|root ]] || [[ -z "${logged_in_user}" ]]
then
  exit 1
else
  exit 0
fi
