# frank_listener.sh
if [ ! -p commands ]; then
  mkfifo commands
fi

RAILS_ENV=test rails s --pid `pwd`/tmp/frank_server.pid &
while true; do
  sh -c "clear && $(cat commands)"
done
