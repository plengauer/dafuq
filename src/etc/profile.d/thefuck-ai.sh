#!/bin/bash

_fuck__fix_command() {
  local command="$*"
  local openai_token="$(cat /opt/thefuck-ai/OPENAI_API_TOKEN)"
  local system_prompt="$(cat /var/lib/thefuck-ai/system.prompt)"
  curl https://api.openai.com/v1/chat/completions -H "Authorization: Bearer $openai_token" -H "Content-Type: application/json" -X POST -d \
    "{ \"model\": \"gpt-4\", \"messages\": [{\"role\": \"system\", \"content\": \"$system_prompt\"}, {\"role\": \"user\", \"content\": \"$command\"}] }" \
    | jq -r '.choices[0].message.content'
}

_fuck__suggest_command() {
  echo "$*"
}

fuck() {
  local exit_code=$?
  if [ "$exit_code" -eq 0 ]; then echo "Zero fucks given! The last command was successful."; return 0; fi
  if [ "$-" = *"i"* ]; then echo "Zero fucks fiven! Shell is not interactive."; return 1; fi
  local command="$(history | tail -n 2 | head -n 1 | awk '{$1=""; print substr($0,2)}')"
  if [ -z "$command" ]; then echo "Zero fucks given! The command could not be fixed."; return 0; fi
  local fixed="$(_fuck__fix_command "$command")"
  _fuck__suggest_command "$fixed"
  return $?
}
