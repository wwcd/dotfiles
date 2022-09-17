ROOT=$(cd `dirname $0` | pwd)

for d in lsd nvim starship tmux; do
  cp -rf $ROOT/$d $HOME/.config/
done

for f in editorconfig gitconfig zsh_profile; do
  cp -f $ROOT/$f $HOME/.$f
done


