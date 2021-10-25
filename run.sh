#!/bin/bash

# default environment is production, override with environment variable
tidewaysEnv=${TIDEWAYS_ENV:-production}

echo "Starting Tideways Daemon with env=$tidewaysEnv"

tideways-daemon --hostname=tideways-daemon-$tidewaysEnv --address=0.0.0.0:9135 --env=$tidewaysEnv >> /dev/stdout 2>/dev/stderr

/sbin/my_init
