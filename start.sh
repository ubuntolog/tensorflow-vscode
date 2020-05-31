#!/bin/bash
echo "Starting code server"
docker run --gpus all -d -p 443:443 -v /home/ubuntolog/vscode-server/vscode-server-settings/:/root/.local/share/code-server -v /home/ubuntolog/vscode-server/vscode-server-data/:/root/data -v /etc/ssl/private/nginx-selfsigned.key:/root/cert.key -v /etc/ssl/certs/nginx-selfsigned.crt:/root/cert.crt ubuntolog/vscode-tensorflow-gpu:31.05.2020
