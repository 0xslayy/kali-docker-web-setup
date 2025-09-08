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

WORKDIR /root

CMD ["/bin/bash"]

