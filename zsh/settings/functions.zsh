

# Create a dated file
mkdf() {
  touch "$(date +'%Y-%m-%d')_$@"
}


# Cleanup latex helper files
texclean() {
  rm -f ./*.{aux,log}
}


# Re-install the current project into the active virtual environment
py-reload() {
  local project=$(basename $PWD)
  pip uninstall -y ${project}
  pip install .
}


dl() {
  for fn in "$@"
  do
    if [ -r "$fn" ] ; then
      printf '\033]1337;File=name='`echo -n "$fn" | base64`";"
      wc -c "$fn" | awk '{printf "size=%d",$1}'
      printf ":"
      base64 < "$fn"
      printf '\a'
    else
      echo File $fn does not exist or is not readable.
    fi
  done
}


# (f)ind by (n)ame
# usage: fn foo
# to find all files containing 'foo' in the name
fn() { ls **/*$1* }

ifip() {
  ifconfig $1 | awk '/inet /{print$2}'
}

function cryptpw() {
  python -c "import bcrypt; print bcrypt.hashpw('$1', bcrypt.gensalt())"
}
