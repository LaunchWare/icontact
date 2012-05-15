export WORKING_DIR=~/work/i_contact
cd $WORKING_DIR; mvim; gitx
tmux set-option -tIContact default-path $WORKING_DIR

tmux start-server
tmux new-session -d -s IContact -n work

tmux new-window -tIContact:1 -n server
tmux new-window -tIContact:2 -n guard

tmux send-keys -tIContact:1 'ruby script/server' C-m
tmux send-keys -tIContact:2 'bundle exec guard' C-m


tmux select-window -tIContact:0
tmux attach-session -d -tIContact

