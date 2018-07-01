# my home

It's taken decades to refine my home inside computers to these few lines. I like them very much.

ssh client configuration lives above this directory: ../openbsd-skel/ssh_config

for f in .gitconfig .profile .tmux.conf .vimrc .xinitrc; do \
  ftp https://raw.githubusercontent.com/matthewjweaver/mjw-toolbox/master/skel/${f};
done
