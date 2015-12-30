

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
