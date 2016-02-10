if which pyenv > /dev/null;
then
  eval "$(pyenv init -)"
  if which pyenv-virtualenv-init > /dev/null;
  then
    eval "$(pyenv virtualenv-init -)";
  fi
  pyenv virtualenvwrapper
  export PYENV_ROOT="/usr/local/var/pyenv"
fi
