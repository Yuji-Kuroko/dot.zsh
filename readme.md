```
git clone $repositoryUrl ~/dot.zsh
echo "ZDOTDIR=$HOME/dot.zsh" >> ~/.zshenv
source ~/.zshenv
# setup submodule
git submodule init
git submodule update
```
