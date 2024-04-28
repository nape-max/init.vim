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

- Mason -> DAP -> delve
- Mason -> Formatters -> gofumpt, goimports
