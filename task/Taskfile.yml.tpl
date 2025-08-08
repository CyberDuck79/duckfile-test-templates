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

  lint: ## Run static linters
    cmds:
      - echo "🔍 linting code with golangci-lint"
      - golangci-lint run ./...

  test: ## Run unit tests
    cmds:
      - echo "🧪 go test ./..."
      - "{{ .GO_VERSION }} go test -race ./..."

  build: ## Compile binaries
    env:
      CGO_ENABLED: "{{ .CGO_ENABLED }}"
    cmds:
      - echo "🏗️  building {{ .PLATFORM }}"
      - GOOS=$(echo "{{ .PLATFORM }}" | cut -d/ -f1) \
        GOARCH=$(echo "{{ .PLATFORM }}" | cut -d/ -f2) \
        {{ .GO }} build -o dist/app ./cmd/app

  default:
    deps: [lint, test, build]
