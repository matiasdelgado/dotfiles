# dotfiles

## .vimrc
Minimalist configuration. 
Installed plugins:
* editorconfig.vim
* fzf.vim
* vim-airline
* vim-airline-themes
* vim-elixir
* vim-javascript
* vim-jsx
* vim-prettier
* vim-ripgrep
* vim-surround
* UltiSnips

### Color scheme
* [gruvbox](https://github.com/morhetz/gruvbox)

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
