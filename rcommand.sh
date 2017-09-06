#!/bin/sh

command=$@
echo ${command}

if [ "${command}" == "help" ]; then
    echo "rcommand 'command'"
    exit
fi

if [ -f hosts ]; then
    echo "Found hosts file.."
    servers=`cat hosts | grep -v '\[' | grep -v '\#'`
else
    servers=`grep  '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' ~/openstack-configs/mercury_servers_info | grep '|' | cut -d'|' -f 2`
fi

for name in $servers; do
   echo  "${name}:"
   ssh ${name} ${command}
   echo "============================="
done
