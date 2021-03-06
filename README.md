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
