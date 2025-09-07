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
    golang \
    kali-tools-web \
    kali-tools-exploitation \
    kali-tools-information-gathering \
    kali-tools-passwords \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir \
    requests \
    beautifulsoup4 \
    flask \
    scapy \
    paramiko \
    pwntools

WORKDIR /root

CMD ["/bin/bash"]

