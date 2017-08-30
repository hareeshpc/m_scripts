#!/bin/sh

command=$1
echo ${command}

if [ ${command} == 'help' ]; then
    echo "rcommand 'command'"
    exit
fi


servers=`grep  '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' ~/openstack-configs/mercury_servers_info | grep '|' | cut -d'|' -f 2` 

for name in $servers; do
   echo  "${name}:"
   ssh ${name} ${command}
   echo "============================="
done

