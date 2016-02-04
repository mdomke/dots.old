Bootstraping
============

This repo contains everything to bootsrap a new machine from scratch and to setup
all applications and services I commonly use. This includes especially the ZSH shell
and the VIM text editor.

As prerequisites you need to have Python and the ``invoke`` task execution tool installed.
Afterwards it's basically

```bash
$ pip install invoke
$ git clone git@github.com:mdomke/dots.git .dots
$ cd .dots
$ invoke install
```

and you're done.
