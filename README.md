# dotfiles

## .vimrc
Minimalist (?) configuration. 
Installed plugins:
* ale
* editorconfig.vim
* emmet-vim
* fzf.vim
* swift.vim
* typescript-vim
* UltiSnips
* vim-airline
* vim-airline-themes
* vim-coffee-script
* vim-elixir
* vim-javascript
* vim-jsx
* vim-jsx-typescript
* vim-prettier
* vim-surround
* vim-test

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
