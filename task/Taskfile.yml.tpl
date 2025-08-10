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
    dir: {{.USER_WORKING_DIR}}
    cmds:
      - echo "🧪 go test ./..."
      - go test -race ./..."

  default:
    deps: [test]
