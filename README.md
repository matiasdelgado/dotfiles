# dotfiles

## .vimrc
Minimalist configuration. 
Installed plugins:
* ctrlp.vim
* editorconfig.vim
* vim-surround
* vim-elixir

## .bash_prompt, .aliases
Based on [@mathiasbynes's](https://github.com/mathiasbynens/dotfiles)

Add to the bash_profile:
```
source ~/dotfiles/.aliases
```

# Usage
Create symbolic link in the appropriate directory: 
```bash
ln -s ~/dotfiles/.vimrc ~/.vimrc
```
