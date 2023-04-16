# Installing dotfiles

Clone the repo, then run the install script:

> :warning: **This will replace your current dot files in your $HOME**. Be very careful here!

```bash
git clone https://github.com/RhydianJenkins/dotfiles.git
cd dotfiles/dotfiles
./install.sh
```

After a shell restart, functions, aliases, and other personal customisations should be applied.

## Tmuxifier

While Tmuxifier config is present, the binary will need to be manually added to `$PATH`.

```bash
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier.git
cd /usr/local/bin
sudo ln -s ~/.tmuxifier.git/bin/tmuxifier tmuxifier
```
