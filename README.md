# awf-workflow-hello

Test workflow pack for AWF CLI.

## Workflows

| Workflow | Description |
|----------|-------------|
| `hello` | Simple echo greeting |
| `greet` | Multi-step with prompt and script |

## Install

```bash
awf workflow install awf-project/awf-workflow-hello

# Local dev
make install          # → .awf/workflow-packs/hello/
make install-global   # → ~/.local/share/awf/workflow-packs/hello/
```

## Test tarball

```bash
make pack      # creates .tar.gz + checksums.txt
make validate  # checks manifest + workflow files
```
