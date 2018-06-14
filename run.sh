#!/bin/bash

# default environment is production, override with environment variable
set ENV=${TIDEWAYS_ENV:-production}

echo "Starting Tideways Daemon with env=$ENV"

tideways-daemon --hostname=tideways-daemon --address=0.0.0.0:9135 --env=$ENV >> /dev/stdout 2>/dev/stderr

/sbin/my_init
