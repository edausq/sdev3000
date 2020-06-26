FROM fedora:32

RUN sed '/nodocs/d' /etc/dnf/dnf.conf -i \
  && dnf install -y man-db man-pages

RUN dnf upgrade -y && dnf groupinstall "C Development Tools and Libraries" -y

RUN dnf install -y \
  atop \
  bash-completion \
  bind-utils \
  curl \
  findutils \
  git \
  git-extras \
  gnupg2 \
  htop \
  mariadb \
  pinentry \
  procps-ng \
  rsync \
  sudo \
  tmux \
  vim \
  wget \
  && dnf clean all

RUN adduser --home-dir /home/user --no-create-home --shell /bin/bash user && \
  echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/user

USER user
