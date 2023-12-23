#!/bin/bash

_fuck__fix_command() {
  local command="$*"
  local openai_token="$(cat /var/lib/thefuck-ai/OPENAI_API_TOKEN)"
  local system_prompt="$(cat /var/lib/thefuck-ai/system.prompt)"
  curl https://api.openai.com/v1/chat/completions -H "Authorization: Bearer $openai_token" -H "Content-Type: application/json" -X POST -d \
    "{ \"model\": \"gpt-4\", \"messages\": [{\"role\": \"system\", \"content\": \"$system_prompt\"}, {\"role\": \"user\", \"content\": \"$command\"}] }" \
    | jq -r '.choices[0].message.content'
}

fuck() {
  local exit_code=$?
  if [ "$exit_code" -eq 0 ]; then echo "Zero fucks given!"; return 0; fi
  if [ "$-" = *"i"* ]; then echo "Shell is not interactive!"; return 1; fi
  local command="$(history | tail -n 2 | head -n 1 | awk '{$1=""; print substr($0,2)}')"
  if [ -z "$command" ]; then echo "Zero fucks given!"; return 0; fi
  _fuck__fix_command "$command"
  return $?
}
