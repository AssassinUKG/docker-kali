FROM kalilinux/kali

WORKDIR /root

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color

# update
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get autoremove -y && \
    apt-get clean
    

#install python-pip, git, kali top10
RUN apt-get install -y \ 
    python3-pip \
    git \
    nmap \
    sqlmap \
    hydra \
    exploitdb \
    nikto \
    hashcat \
    cewl
    #apt install kali-tools-top10 -y





#install Xsstrike
WORKDIR /opt/Tools/
RUN git clone https://github.com/s0md3v/XSStrike.git && \
    ls -la
WORKDIR /opt/Tools/XSStrike/
RUN pip3 install -r requirements.txt

WORKDIR /root
ENTRYPOINT ["/bin/bash" ]
