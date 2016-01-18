# dotfiles
Just me trying to learn Vim.
A simple vimrc with Plug.vim as plugin manager.

## Install instructions
First, clone this repository, and execute the makesymlinks.sh bash script:
```
$ cd ~
$ git clone git://github.com/overtune/dotfiles.git
$ cd ~/dotfiles
$ chmod +x makesymlinks.sh
$ ./makesymlinks.sh
```

The open up vim (just press ENTER to supress the warnings):
```
$ vim
```

And enter the following to install the plugins:
```
:PlugInstall
```