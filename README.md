# awf-workflow-hello

Test workflow pack for AWF CLI.

## Workflows

| Workflow | Description |
|----------|-------------|
| `hello` | Simple echo greeting with optional name input |
| `greet` | Multi-step with prompt file, script file, and language selection |

## Install

```bash
awf workflow install awf-project/awf-workflow-hello

# Local dev
make install          # → .awf/workflow-packs/hello/
make install-global   # → ~/.local/share/awf/workflow-packs/hello/
```

## Usage

```bash
awf run hello/hello                        # Hello, World!
awf run hello/hello --input name=Alice     # Hello, Alice!
awf run hello/greet --input language=fr    # Bonjour le monde!
```

## User overrides

Override pack-embedded prompts or scripts locally:

```bash
mkdir -p .awf/prompts/hello/hello/
echo "Custom prompt" > .awf/prompts/hello/hello/system-prompt.md
awf run hello/greet  # uses your local override
```

## Build tarball

```bash
make pack      # creates .tar.gz + checksums.txt
make validate  # checks manifest + workflow files
make clean     # removes build artifacts
```
