FROM kalilinux/kali-rolling

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    vim \
    net-tools \
    tmux \
    git \
    python3 \
    python3-pip \
    kali-tools-web \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root

CMD ["/bin/bash"]

