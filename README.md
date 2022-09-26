
# Start...

## Install zsh

Install by apt if you are in Ubuntu. 

```
sudo apt install zsh
```

Yes, I love oh-my-zsh. It's almost filled.

## rg

I use ripgrep for finding in source code.


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


## Chrome OS 

Maybe, you got a problem about custom font. Here, I give a way to set custom font in terminal.
In terminal, you open DevTools by <Ctrl + Shift + j>

```
term_.prefs_.set('font-family', '"JetBrains Mono Nerd", monospace');
term_.prefs_.set('user-css-text', '@font-face {font-family: "JetBrains Mono Nerd"; src: url("https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf"); font-weight: normal; font-style: normal;}')
```



