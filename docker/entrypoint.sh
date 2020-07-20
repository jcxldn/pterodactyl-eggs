#!/bin/sh

# https://pterodactyl.io/community/config/eggs/creating_a_custom_image.html

cd /home/container

echo "ptero-entrypoint > Welcome! In Directory: '$(pwd)'"

# Output Current Java Version
java -version ## only really needed to show what version is being used. Should be changed for different applications


echo "ptero-entrypoint > Replacing startup variables..."

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

echo "ptero-entrypoint > Starting server with: '$MODIFIED_STARTUP'"

# Run the Server
${MODIFIED_STARTUP}
