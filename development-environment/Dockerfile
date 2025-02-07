FROM docker.io/centos:centos8.4.2105 

ENV NODE_VERSION=20.11.1
ENV NPM_VERSION=10.2.4
ENV YARN_VERSION=1.22.21
ENV CHROME_VERSION=125
ENV PUPPETEER_VERSION=21.11.0

ADD scripts ${SCRIPTS_DIR}

RUN  sed -i s/mirror.centos.org/vault.centos.org/g /etc/yum.repos.d/CentOS-*.repo
RUN  sed -i s/^#.*baseurl=http/baseurl=http/g /etc/yum.repos.d/CentOS-*.repo
RUN  sed -i s/^mirrorlist=http/#mirrorlist=http/g /etc/yum.repos.d/CentOS-*.repo

RUN dnf clean all && \
    dnf install -y glibc-locale-source && \
    localedef -c -f UTF-8 -i en_US en_US.UTF-8 && \
    dnf -y update && \
    dnf install -y \
      wget \
      fuse \
      gcc \
      unzip \
      bzip2 \
      gzip \
      openssl-devel \
      git \
      make  \
      yum-utils \
      zip \
      curl \
      hostname iputils iproute sysstat procps-ng \
      gcc-c++ && \
    dnf clean all && \
    rm -rf /var/cache/dnf
  

ENV INSTALL_ROOT=/usr/local
ENV NODE_HOME=${INSTALL_ROOT}/node-v${NODE_VERSION}
ENV NODE_PATH=${NODE_HOME}/lib/node_modules
ENV PATH=${NODE_HOME}/bin:${PATH}
ENV NODE_OPTIONS="--max-old-space-size=4096"

RUN sh -e ${SCRIPTS_DIR}/install-node.sh

LABEL soft.node="$NODE_VERSION"

RUN sh -e ${SCRIPTS_DIR}/install-npm.sh

LABEL soft.npm="$NPM_VERSION"

RUN sh -e ${SCRIPTS_DIR}/install-yarn.sh

LABEL soft.yarn="$YARN_VERSION"

RUN sh -e ${SCRIPTS_DIR}/install-chrome.sh

LABEL soft.chrome="$CHROME_VERSION"

ENV PUPPETEER_SKIP_DOWNLOAD=true
RUN npm i -g puppeteer@${PUPPETEER_VERSION} --unsafe-perm=true
ENV PUPPETEER_EXECUTABLE_PATH="/usr/bin/google-chrome-stable"
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

LABEL soft.puppeteer="$PUPPETEER_VERSION"
