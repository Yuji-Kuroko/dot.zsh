```
git clone $repositoryUrl ~/dot.zsh
echo "ZDOTDIR=$HOME/dot.zsh" >> ~/.zshenv
# zinit install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
exec zsh -l
# auto setup zinit
```
