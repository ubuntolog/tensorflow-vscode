# tensorflow-vscode
Development server for machine learning experiments

## What is inside?
The image is based on [code-server](https://github.com/cdr/code-server) and on the official Nvidia CUDA libraries -  an open source project that allows to run VSCode editor on a server. The editor becomes available in a browser: in certain cases it may be very useful. This particular image has been created for my experiments with neural networks. My plan is to train models on a server with a powerful GPU and a fast SSD, while using Mac OS. The server itself has to have NVIDIA drivers and Docker installed. The rest (e.g. CUDA libraries and other dependencies) is handled by the image.

## How to use it?
- Install (Nvidia Docker)[https://github.com/NVIDIA/nvidia-docker]
- Generate a self signed certificate and a key (or real ones, if you want to run code server on a real server):
`sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt`
- Start the image with all the necessary volumes (to keep settings and data)
`docker run --gpus all -it -p 443:443 -v /home/user/vscode-server/vscode-server-settings/:/root/.local/share/code-server -v /home/user/vscode-server/vscode-server-data/:/root/data -v /etc/ssl/private/nginx-selfsigned.key:/root/cert.key -v /etc/ssl/certs/nginx-selfsigned.crt:/root/cert.crt ubuntolog/vscode-tensorflow-gpu:24.05.2020`

## Extra Information
This code may helps if Keras crashes. It helps to dinamically grow GPU memory:

`from keras.backend.tensorflow_backend import set_session
import tensorflow as tf
config = tf.compat.v1.ConfigProto()
config.gpu_options.allow_growth = True
config.log_device_placement = True
sess = tf.compat.v1.Session(config=config)
tf.compat.v1.keras.backend.set_session(sess)`
