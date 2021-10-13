# Dotfiles (under development)

## Installation: Clone the Repo
```shell
$ git clone https://github.com/grav3m1nd-byte/dotfiles.git
```

### Update Repository Submodules
```shell
$ git submodule update --init oh-my-zsh

$ git submodule update --init vim_runtime/my_plugins/csv.vim

$ git submodule update --init vim_runtime/my_plugins/logstash.vim

$ git submodule update --init vim_runtime/my_plugins/onedark.vim

$ git submodule update --init vim_runtime/my_plugins/syntastic

$ git submodule update --init vim_runtime/my_plugins/vim-devicons
```

### Create Oh-My-ZSH .gitmodules for your custom themes and update
```shell
$ cat .gitmodules | grep -A1 -E "oh-my-zsh\/" | sed -e 's/--//' -e 's/oh-my-zsh\///' -e 's/^#//' | tee -a oh-my-zsh/.gitmodules
[submodule "custom/plugins/zsh-syntax-highlighting"]
    path = custom/plugins/zsh-syntax-highlighting
    url = https://github.com/zsh-users/zsh-syntax-highlighting.git

[submodule "custom/plugins/zsh-autosuggestions"]
    path = custom/plugins/zsh-autosuggestions
    url = https://github.com/zsh-users/zsh-autosuggestions.git

[submodule "custom/plugins/zsh-completions"]
    path = custom/plugins/zsh-completions
    url = https://github.com/zsh-users/zsh-completions.git

[submodule "custom/themes/dracula"]
    path = custom/themes/dracula
    url = https://github.com/dracula/zsh.git

[submodule "custom/themes/powerlevel10k"]
    path = custom/themes/powerlevel10k
    url = https://github.com/romkatv/powerlevel10k.git

[submodule "custom/themes/kali"]
    path = custom/themes/kali
    url = git@github.com:grav3m1nd-byte/kali.git

$ cd oh-my-zsh/ && \
    git submodule update add https://github.com/zsh-users/zsh-syntax-highlighting.git custom/plugins/zsh-syntax-highlighting && \
     git submodule add -f https://github.com/zsh-users/zsh-autosuggestions.git custom/plugins/zsh-autosuggestions && \
     git submodule add -f https://github.com/zsh-users/zsh-completions.git custom/plugins/zsh-completions && \
     git submodule add -f https://github.com/dracula/zsh.git custom/themes/dracula && \
     git submodule add -f  https://github.com/romkatv/powerlevel10k.git custom/themes/powerlevel10k
```

### Create Symlinks
```shell
$ ln -s dotfiles/zshrc-mac ~/.zshrc

$ ln -s dotfiles/oh-my-zsh ~/.oh-my-zsh

$ ln -s dotfiles/vimrc-mac ~/.vimrc

$ ln -s dotfiles/vim_runtime ~/.vim_runtime

$ ln -s dotfiles/motd-mac ~/.motd
```
> To use these inside the root user context (only recommended for advanced users and at your own risk), create the same symlinks as root but use the full path to these files and directories.

