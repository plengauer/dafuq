#!/bin/bash -e

_dafuq__print_error() {
  echo "Zero fucks given! $*" 1>&2
}

_dafuq__rerun_command() {
  echo "Retrying command to see what the fuck is going on ..." 1>&2
  bash -c "$*" 2>&1 1> /dev/null
}

_dafuq__fix_command() {
  local command="$(cat)"
  local output="$(_dafuq__rerun_command "$command")"
  echo "Analyzing and fixing the fuckery ..." 1>&2
  AI_SYSTEM_PROMPT="$(cat /var/lib/dafuq/system.prompt)" ai "Command: $command Output: $output"
}

_dafuq__suggest_command() {
  cat
}

dafuq() {
  local exit_code=$?
  if [ "$exit_code" -eq 0 ]; then _dafuq__print_error "The last command was successful."; return 0; fi
  # if [ "$-" = *"i"* ]; then _dafuq_print_error "Shell is not interactive."; return 1; fi
  local command="$(history | tail -n 2 | head -n 1 | awk '{$1=""; print substr($0,2)}')"
  if [ -z "$command" ]; then _dafuq__print_error "The command could not be fixed."; return 1; fi
  history | tail -n 2 | head -n 1 | awk '{$1=""; print substr($0,2)}' | _dafuq__fix_command | _dafuq__suggest_command
  return $?
}

alias fuck=dafuq
alias wtf=dafuq
