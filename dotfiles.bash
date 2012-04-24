# Run this from HOME directory!
# copies dotfiles to HOME directory and creates symbolic link
find ~/.dotfiles -type f -name ".*" -exec ln -s {} \;
