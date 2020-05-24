FROM nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04
RUN apt-get update && apt-get -y install mc vim htop zsh wget git htop curl python3 python3-pip
RUN pip3 install voila jupyter opencv-python keras piexif
RUN pip3 install --upgrade pip
RUN pip3 install tensorflow-gpu==2.1.1
RUN pip3 install opencv-python keras piexif
RUN pip3 install imageai --upgrade
RUN mkdir /root/data
RUN curl -sSOL https://github.com/cdr/code-server/releases/download/v3.3.1/code-server_3.3.1_amd64.deb
RUN dpkg -i code-server_3.3.1_amd64.deb
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
WORKDIR "/root/data"
CMD ["code-server", "--host", "0.0.0.0", "--auth", "none", "--cert", "/root/cert.crt", "--cert-key", "/root/cert.key",  "--port", "443"]
