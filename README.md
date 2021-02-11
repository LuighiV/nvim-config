# NVIM Configuration

This configuration is based on the course offered in Udemy by Nicolas Schurmann: 
[Course](https://www.udemy.com/course/vim-aumenta-tu-velocidad-de-desarrollo/learn/lecture/15700992#overview)

This installation is for ArchLinux:
```bash
yay -S neovim 
yay -S neovim-plug
yay -S vim-plug
```
The last line is to enable plug package installer for vim in addition to neovim,
otherwise configuration file won't be valid for vim

## Adding dependencies

For UtilSnip it is required to have a provider, so to install providers in NVIM you should run:
```bash
yay -S python2-neovim
sudo pip install neovim
yarn global add neovim
```

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

In addition to this you should install the plugins provided, so make 
the following steps:
1. Open the configuration file with vim or nvim
2. Enter in normal mode the following command   :PlugInstall
3. Wait util it is installed.
4. Close the file and open again to see the changes

## Using filetype plugin 
Personal plugins are in the home directory of VIM which is in ~/.vim/after
```bash
mkdir -p ~/.vim/after
mkdir -p ~/.vim/after/ftplugin
```

Then copy the corresponding files located in ftplugin allows using the
spellcheck for certain files only.

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

### Vim-surrond
Vim sorround for VIM plugin to add surround characters and tags in normal mode and visual mode: 
[Vim-surround](https://github.com/tpope/vim-surround)

Use the command `S` in visual mode to add a surround character or tag and command `cs`
It is really useful when adding tags in HTML  and changing it.

### SCSS-syntax
Is a plugin to add support for SASS language.
[SCSS-syntax](https://github.com/cakebaker/scss-syntax.vim)

### Vim-TeX
Add support for LaTeX files and environments.
[Vim-tex](https://github.com/lervag/vimtex/)

> Q: Does Vimtex work with neovim?
> A: Yes, but backward sync requires the `neovim-remote` utility. It may be
>    installed and used by vimtex as follows:
> 
>      1. Install the `pynvim` and `neovim-remote` modules for python3 (e.g.,
>         using `pip3 install --user pynvim neovim-remote`; if `python3 -c
>         "import pynvim"` returns without error and `nvr` starts neovim from
>         the command line, everything should be good to go).
> 
>      2. Configure your viewer to use `nvr --remote +"%line" "%file"` for
>         backward sync.
> 
>    See https://github.com/mhinz/neovim-remote for more information on `nvr`.

According with this help it is required to install neovim-remote and add in
zathura the following configuration at `~/.config/zathura/zathurarc`:
```bash
set synctex true
set synctex-editor-command "nvr --remote-silent %f -c %l"
```

### Deoplete
Add support for autocompleting capabilities
[Deoplete](https://github.com/Shougo/deoplete.nvim)

### UtilSnips
This plugin enables the capabilities of using snippets:
[UtilSnips](https://github.com/SirVer/ultisnips)

Take into account that utilsnips only allows the capabilities to make some
snippets which will be available when you configure it. However, it doesn't
provide such snippets so you should add it by your self. In this case, there
are some libraries which provides those snippets.

### Vim-Snippets
This plugin adds snippets for the most common languages. It includes some
snippets for TeX. 
[Vim-Snippets](https://github.com/honza/vim-snippets)

### ALE linter
This plugin enables the capabilities to check syntax and integrates with
deoplete for autocompleting. 
[ALE linter](https://github.com/dense-analysis/ale)


## Comments on Youcompleteme vs Deoplete
I have proven both two Youcompleteme and Deoplete for autocompleting commands
however I had some trouble with Youcompleteme as it uses also Tab for
autocompleting wich is used also for UtilSnips. On the other hand Deoplete
is well adapted to Neovim.

## Notes:
For TeX there are some interesting references in which I was based:
[Writing LaTeX with VIM](https://castel.dev/post/lecture-notes-1/)
[Snippets for LaTeX](https://github.com/gillescastel/latex-snippets)

## Terminal keybindings 
Terminals by default uses Emacs keybindings, however you could edit this
configuration adding the corresponding configuration in the `~/.inputrc` file:

```bash
set editing-mode vi
set keymap vi-command
```

