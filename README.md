

### Python

I use *pyright*. Neovim supports lsp. So, we need a lsp client for python. 

```
npm i -g pyright
```

Then, add following lines at *init.lua*.

```
requre'lspconfig'.pyright.setup{}
```
That's all.

https://github.com/neovim/nvim-lspconfig

