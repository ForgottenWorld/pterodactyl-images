#!/bin/sh
cd /home/container

# Output Current Java Version
java -version

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`

echo "PWD: ${PWD}"
echo "STARTUP: ${STARTUP}"
echo "M_STARTUP: ${MODIFIED_STARTUP}"

# Run the Server
exec ${MODIFIED_STARTUP}
