
# Start...

## Install zsh

Install by apt if you are in Ubuntu. 

```
sudo apt install zsh
```

Yes, I love oh-my-zsh. It's almost filled.

## Neovim

You can use package manager such as apt. I recommend to download from github. You can get the newest one.


# Neovim

At first, we have to prepare plugins manager. I use packer. This command will install packer as the plugin manager.

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## tree-sitter

Tree-sitter is a good solution for syntax highlighting. In ubuntu, we can use it by npm.

```
npm install -g tree-sitter-cli
```

## typescript

If you are working on Typescript. Neovim needs its language server.
```
npm i -g typescript-language-server
```


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

