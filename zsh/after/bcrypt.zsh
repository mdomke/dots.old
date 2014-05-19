function cryptpw() {
  python -c "import bcrypt; print bcrypt.hashpw('$1', bcrypt.gensalt())"
}
