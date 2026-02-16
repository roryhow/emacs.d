# emacs.d

A minimal, `use-package`-based Emacs configuration. All packages are installed automatically on first launch via MELPA.

## Structure

```
~/.emacs.d/
  early-init.el          -- GC tuning, GUI suppression before init
  init.el                -- Package bootstrap, core settings, module loading
  custom.el              -- Emacs customize storage (auto-managed)
  lisp/
    init-ui.el           -- Theme, editing helpers, visual niceties
    init-completion.el   -- Minibuffer completion stack
    init-dev.el          -- Git, projects, syntax checking, LSP, tree-sitter
    init-javascript.el   -- JavaScript / JSON
    init-typescript.el   -- TypeScript / TSX
    init-kotlin.el       -- Kotlin
    init-python.el       -- Python
    init-scala.el        -- Scala / sbt
    init-go.el           -- Go
    init-yaml.el         -- YAML
    init-docker.el       -- Dockerfiles, Compose, container management
    init-terraform.el    -- Terraform
```

## Language support

Each language module hooks into `lsp-mode` for IDE features (completion, diagnostics, navigation, refactoring). You'll need the corresponding language server installed on your system.

| Language   | Mode              | Language server          |
|------------|-------------------|--------------------------|
| JavaScript | `js-mode`         | typescript-language-server |
| TypeScript | `typescript-mode` | typescript-language-server |
| TSX        | `web-mode`        | typescript-language-server |
| Kotlin     | `kotlin-mode`     | kotlin-language-server   |
| Python     | `python-mode`     | pyright / pylsp          |
| Scala      | `scala-mode`      | Metals                   |
| Go         | `go-mode`         | gopls                    |

Additional language-specific tooling:

- **Go** -- `gofmt-before-save`, `gotest` for running tests (`C-c a` project, `C-c m` file, `C-c .` current test)
- **Python** -- `ruff-format` for formatting, `pip-requirements` mode, `pyproject.toml` recognised as project root
- **Scala** -- `sbt-mode` for build interaction, `lsp-metals` for Metals integration
- **TypeScript** -- `web-mode` handles `.tsx` files with JSX support
- **JavaScript** -- `js2-mode` for enhanced parsing, `json-mode` for JSON
- **Terraform** -- `reformatter` for `terraform fmt` on save
- **Docker** -- `dockerfile-mode`, `docker-compose-mode`, and `docker` for container management

## Packages

### Completion (init-completion.el)

- **vertico** -- Vertical minibuffer completion UI
- **orderless** -- Space-separated fuzzy matching (type terms in any order)
- **consult** -- Enhanced buffer switching, goto-line, ripgrep search
- **embark** -- Contextual actions on minibuffer candidates
- **embark-consult** -- Integration between embark and consult
- **marginalia** -- Rich annotations (keybindings, file sizes, descriptions) next to candidates

### UI (init-ui.el)

- **monokai-theme** -- Dark color theme
- **dimmer** -- Dims inactive windows
- **default-text-scale** -- Global font size adjustment
- **which-key** -- Shows available keybindings after a key prefix
- **rainbow-delimiters** -- Colored nested brackets/parens by depth
- **mode-line-bell** -- Visual flash instead of audible bell
- **multiple-cursors** -- Edit at multiple points simultaneously
- **avy** -- Jump to visible text with character hints

### Development (init-dev.el)

- **magit** -- Git porcelain (`C-x g` for status)
- **git-modes** -- Syntax highlighting for gitconfig, gitignore, etc.
- **git-link** -- Generate repository URLs for current file/line
- **git-timemachine** -- Step through file history (`C-x v t`)
- **projectile** -- Project management and navigation (`C-c p` prefix)
- **projectile-ripgrep** -- Ripgrep search within projects
- **flycheck** -- On-the-fly syntax checking
- **lsp-mode** -- Language Server Protocol client
- **lsp-ui** -- LSP UI enhancements (sideline, peek, doc)
- **envrc** -- Direnv integration for per-project environment variables (`C-c e` prefix)

### Core (init.el)

- **exec-path-from-shell** -- Imports shell PATH into Emacs (macOS)
- **gcmh** -- Garbage collection tuning (high threshold during use, collect when idle)

## Installation

Clone to `~/.emacs.d`:

```
git clone https://github.com/rhow93/emacs.d.git ~/.emacs.d
```

Start Emacs. All packages will be downloaded and installed automatically on first launch. If you see errors, restart Emacs or run `M-x package-refresh-contents` first.

## macOS

The config assumes macOS by default:

- Cmd is bound to Meta, right-Cmd to Super, Option passes through for special characters
- Menu bar is kept enabled (required for Cmd+Tab app switching)
- `exec-path-from-shell` imports your shell PATH
- GCC JIT library paths are configured for Homebrew native compilation
- Frames use the `undecorated-round` style
