You need to install before open NeoVim:

- Packer:

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

- Cargo:

```bash
curl https://sh.rustup.rs -sSf | sh
```

- Golang:
  [Download and Install, go.dev](https://go.dev/dl/)

Requirements, not installed automatically:

1. Language servers:

   - lua-language-server (`brew install lua-language-server`)
   - gopls (`go install golang.org/x/tools/gopls@latest`)
   - tsserver (`brew install typescript-language-server`)
   - json-server (`npm i -g vscode-langservers-extracted`)
   - eslint (`npm install -g eslint_d`)
   - prettier (`brew install prettier`)
   - prettierd (`brew install prettierd`)

2. Formatters:

   - stylua (`cargo install stylua`)
