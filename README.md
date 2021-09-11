# dotfiles

## .vimrc
Minimalist (?) configuration.
Installed plugins:
* ale
* editorconfig.vim
* emmet-vim
* fzf.vim
* UltiSnips
* vim-airline
* vim-airline-themes
* vim-elixir
* vim-javascript
* vim-jsx
* vim-jsx-typescript
* vim-prettier
* vim-surround
* vim-test

### Color schemes
* [dracula](https://github.com/dracula/vim)
* [gruvbox](https://github.com/morhetz/gruvbox)
* [vim-one](https://github.com/rakr/vim-one)

## .bash_prompt, .aliases
Based on [@mathiasbynes's](https://github.com/mathiasbynens/dotfiles)

Add to the bash_profile or zprofile:
```
source ~/dotfiles/.aliases
```


# Usage
Create folders in `.vim/`:
* swaps
* backups

Install Plug:
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Create symbolic link in the appropriate directory:
```bash
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/custom ~/.vim/custom
```

<details>
  <summary>
  Elixir Language Server setup
  </summary

1. git clone https://github.com/elixir-lsp/elixir-ls.git
2. cd elixir-ls
3. mix deps.get
4. mix compile
5. MIX_ENV=prod mix elixir_ls.release
</details>
<details>
  <summary>
  Italics setup with tmux
  </summary>
  * [How to actually get italics and true colour to work in iTerm + tmux + vim](https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be#:~:text=Configure%20iTerm,to%20xterm%2D256color%2Ditalic%20. )
  * [Enabling italics in Vim and tmux](https://rsapkf.xyz/blog/enabling-italics-vim-tmux)
</details>
