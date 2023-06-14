#!/bin/bash

# SSH to the server
ssh root@uzo.biasharaplus.com << 'ENDSSH'

# Navigate to the app repository
cd /root/uzo/web

# Pull the latest changes
cd /root/uzo/web && git restore .
cd /root/uzo/web && git pull

# Remove any previous build
# cd /root/uzo/web && rm -rf build/*

# Install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
apt install -y nodejs

# Build the React app
cd /root/uzo/web

pwd
if cd /root/uzo/web && npm run build ; then
    rm -rf /var/www/html/uzo/*

    # Move the build files to the server directory
    cp -r /root/uzo/web/build/* /var/www/html/uzo/

    # Restart Nginx server
    service nginx restart
    echo "** build succeeded **" 
else
    echo "** Build failed **"
fi

ENDSSH
