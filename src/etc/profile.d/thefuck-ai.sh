#!/bin/bash

_fuck__print_error() {
  echo "Zero fucks given! $*" >&2
}

_fuck__fix_command() {
  local command="$(cat)"
  local openai_token="$(cat /opt/thefuck-ai/OPENAI_API_TOKEN)"
  local system_prompt="$(cat /var/lib/thefuck-ai/system.prompt)"
  curl https://api.openai.com/v1/chat/completions -H "Authorization: Bearer $openai_token" -H "Content-Type: application/json" -X POST -d \
    "{ \"model\": \"gpt-4\", \"messages\": [{\"role\": \"system\", \"content\": \"$system_prompt\"}, {\"role\": \"user\", \"content\": \"$command\"}] }" \
    | jq -r '.choices[0].message.content'
}

_fuck__suggest_command() {
  ### strategy 0
  # cat
  ### strategy 1
  # READLINE_LINE="$(cat)"
  # READLINE_POINT=${#READLINE_LINE}
  ### strategy 2
}

fuck() {
  local exit_code=$?
  if [ "$exit_code" -eq 0 ]; then _fuck__print_error "The last command was successful."; return 0; fi
  if [ "$-" = *"i"* ]; then _fuck_print_error "Shell is not interactive."; return 1; fi
  local command="$(history | tail -n 2 | head -n 1 | awk '{$1=""; print substr($0,2)}')"
  if [ -z "$command" ]; then _fuck__print_error "The command could not be fixed."; return 1; fi
  history | tail -n 2 | head -n 1 | awk '{$1=""; print substr($0,2)}') | _fuck__fix_command | _fuck__suggest_command
  return $?
}
