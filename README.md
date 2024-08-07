# Dot files

It means it will be used with GNU Stow to manage dotfiles across my systems.
Or other files I need across everything

## Commands

For the sake of my sanity, I am using the `--dotfiles` option; this allows me to
use the file path `dot-config` instead of `.config.` Because having these files
hidden inside an editor's/ls does not make sense here.

There are quite a few templating things that manage the differences between
Macos and Linux, make sure to run the `./build.sh`; I have not tested this on
any other system than what I run (Arch and Macos); your mileage may vary.
