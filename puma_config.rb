bind 'unix:///home/centos/socket/puma.sock'
daemonize true
preload_app!

workers 2
threads 16, 16

