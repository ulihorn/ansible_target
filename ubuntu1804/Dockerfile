FROM ubuntu:18.04


RUN \
  apt-get update -qq && \
  apt-get install -y \
    openssh-server \
    sudo \
    locales \
    tzdata \
    rsyslog \
    python \
    && \
  rm -fr /var/lib/apt/lists/*

# create user - ubuntu - for ssh access and enable sudo operations
RUN groupadd -r ubuntu && \
    useradd -rmg ubuntu ubuntu && \
    echo 'ubuntu ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN su - ubuntu -c "mkdir ~/.ssh"

# Various options to make SSH access easier when testing Ansible playbooks
RUN \
  echo "UsePrivilegeSeparation no" >> /etc/ssh/sshd_config && \
  sed -i "s/#StrictModes.*/StrictModes no/g" /etc/ssh/sshd_config && \
  touch /home/ubuntu/.Xauthority && \
  update-locale && \
  mkdir /var/run/sshd && \
  chmod 0755 /var/run/sshd

EXPOSE 22

COPY docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]
