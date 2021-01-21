# NVIM Configuration

This configuration is based on the course offered in Udemy by Nicolas Schurmann: 
[Course](https://www.udemy.com/course/vim-aumenta-tu-velocidad-de-desarrollo/learn/lecture/15700992#overview)

This installation is for ArchLinux:
yay -S neovim 
yay -S neovim-plug


## First steps

You should make sure that there is a init.vim file located at ~/.config/nvim/init.vim
It is probable that there is not a nvim configuration folder so:

```bash
mkdir ~/.config/nvim
```

And place the following content:
```bash
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
```

The in ~/.vimrc place the configuration set in this repository. Otherwise you could also setup 
a symbolic link as follows:
```bash
ln -s  ./.vimrc ~/.vimrc
```

You could use also the script file provided here: letsconfig.sh

In addition to this you sould install the plugins provided, so make 
the following steps:
1. Open the configuration file with vim or nvim
2. Enter in normal mode the following command   :PlugInstall
3. Wait util it is installed.
4. Close the file and open again to see the changes

## Plugins installed

The plugins installed are related to the 

### Theme
The theme Grubvox [Gruvbox theme](https://github.com/morhetz/gruvbox)

### Easymotion
Easymotion plugin to follow quickly via two searching two letters
[Easymotion](https://github.com/easymotion/vim-easymotion)

Use in normal mode via:
```bash
<space>s <twoletters>
```

### NerdTree
Nerdtree plugin to navigate into the files directory
[NerdTree](https://github.com/preservim/nerdtree)

Use in normal mode via:
```bash
<space>nt
```

### Vim-Tmux-Navigator
Tmux Navigator for VIM plugin to navigate into panels
[Vim-Tmux](https://github.com/christoomey/vim-tmux-navigator)

Use the combination of Ctrl+h,j,k,l to move left, down, up and rigth,
respectively.

