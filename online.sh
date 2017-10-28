#!/bin/bash

if ! hash wget 2>/dev/null; then
        echo "Wget not present. Trying to install"
	yum install -y wget
else
	echo "wget is present.Continuing..."
fi

wget -q --tries=10 --timeout=20 --spider http://google.com
if [[ $? -eq 0 ]]; then
        echo "Online"
else
        echo "Offline"
fi
