bind 'unix:///home/centos/socket/puma.sock'
daemonize true
preload_app!

workers 2
threads_count 16, 16

