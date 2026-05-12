FROM docker.io/centos:centos8.4.2105

ENV NODE_VERSION=24.15.0
ENV NPM_VERSION=11.12.1
ENV YARN_VERSION=1.22.21
ENV CHROME_VERSION=147.0.7727.101
ENV PUPPETEER_VERSION=24.42.0
ENV LERNA_VERSION=8.2.2

COPY scripts ${SCRIPTS_DIR}

RUN sed -i s/mirror.centos.org/vault.centos.org/g /etc/yum.repos.d/CentOS-*.repo && \
    sed -i s/^#.*baseurl=http/baseurl=http/g /etc/yum.repos.d/CentOS-*.repo && \
    sed -i s/^mirrorlist=http/#mirrorlist=http/g /etc/yum.repos.d/CentOS-*.repo

# hadolint ignore=DL3041
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
      gcc-c++ \
      jq \
      # socat: used by jest-chrome-in-docker-environment to proxy 0.0.0.0:9222 -> 127.0.0.1:9223
      # because Chrome 113+ ignores --remote-debugging-address=0.0.0.0 in headless mode
      socat && \
    dnf clean all && \
    rm -rf /var/cache/dnf

ENV INSTALL_ROOT=/usr/local
ENV NODE_HOME=${INSTALL_ROOT}/node-v${NODE_VERSION}
ENV NODE_PATH=${NODE_HOME}/lib/node_modules
ENV PATH=${NODE_HOME}/bin:${PATH}
ENV NODE_OPTIONS="--max-old-space-size=4096"

RUN sh -e "${SCRIPTS_DIR}/install-node.sh"

LABEL soft.node="$NODE_VERSION"

RUN sh -e "${SCRIPTS_DIR}/install-npm.sh"

LABEL soft.npm="$NPM_VERSION"

RUN sh -e "${SCRIPTS_DIR}/install-yarn.sh"

LABEL soft.yarn="$YARN_VERSION"

RUN sh -e "${SCRIPTS_DIR}/install-chrome.sh"

LABEL soft.chrome="$CHROME_VERSION"

RUN sh -e "${SCRIPTS_DIR}/install-lerna.sh"

LABEL soft.lerna="$LERNA_VERSION"

ENV PUPPETEER_SKIP_DOWNLOAD=true
RUN npm i -g puppeteer@"${PUPPETEER_VERSION}" --unsafe-perm=true
ENV PUPPETEER_EXECUTABLE_PATH="/usr/bin/google-chrome-stable"

LABEL soft.puppeteer="$PUPPETEER_VERSION"

# hadolint ignore=DL3002
USER root
