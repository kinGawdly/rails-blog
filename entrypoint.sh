#!/bin/bash
set -e

# Remove or potentially pre-existing server PID for rails
rm -rf /app/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile)
exec "$@"