#!/bin/sh

# Start the ssh server
/etc/init.d/ssh restart

exec "$@"