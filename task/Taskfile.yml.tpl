# ------------------------------------------------------------------
#  Taskfile for CI/automation
#  Go version: [[ .GO_VERSION | default "1.22" ]]
#  Platform  : [[ .PLATFORM ]]
# ------------------------------------------------------------------
version: '3'

vars:
  GO: "go"
  CGO_ENABLED: "0"

tasks:

  test: ## Run unit tests
    env:
      EMOJI: "🧪"
    cmds:
      - echo "{{ .EMOJI }} go test ./..."
      - go test -race ./..."

  default:
    deps: [test]
