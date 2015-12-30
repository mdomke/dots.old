

# Create a dated file
mkdf() {
  touch "$(date +'%Y-%m-%d')_$@"
}
