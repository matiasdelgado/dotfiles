# dotfiles

## .vimrc
Minimalist configuration. 
Installed plugins:
* ctrlp.vim
* editorconfig.vim
* vim-airline
* vim-elixir
* vim-javascript
* vim-jsx
* vim-surround

### Color scheme
* [gruvbox](https://github.com/morhetz/gruvbox)

## .bash_prompt, .aliases
Based on [@mathiasbynes's](https://github.com/mathiasbynens/dotfiles)

Add to the bash_profile:
```
source ~/dotfiles/.aliases
```

## .vimrc_ctrlp
Adds a function to insert the relative path of the selected file in the current buffer, using `<C-x>`.
It's particularly helpful for importing files:
```
import Component from "../../component";
```


# Usage
Create symbolic link in the appropriate directory: 
```bash
ln -s ~/dotfiles/.vimrc ~/.vimrc
```
