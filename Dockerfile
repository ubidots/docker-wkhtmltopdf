FROM debian:jessie-slim
MAINTAINER Gustavo Angulo <woakas@ubidots.com>

ENV WKHTML2PDF_VERSION 0.12.4


RUN echo "deb http://http.debian.net/debian/ jessie main contrib non-free" > /etc/apt/sources.list && \
    echo "deb http://http.debian.net/debian/ jessie-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list && \
    apt-get update


RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    openssl \
    build-essential \
    curl \
    xz-utils \
    ca-certificates \
    xfonts-100dpi \
    xfonts-75dpi \
    xfonts-base \
    fonts-roboto \
    fonts-inconsolata \
    ttf-mscorefonts-installer \
    fontconfig \
    xorg


RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*


WORKDIR /tmp
RUN curl -SL  "https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/${WKHTML2PDF_VERSION}/wkhtmltox-${WKHTML2PDF_VERSION}_linux-generic-amd64.tar.xz" | tar -xJ \
    && cp wkhtmltox/bin/* /usr/bin/ \
    && rm -rf wkhtmltox

COPY fonts/ /usr/share/fonts/

VOLUME ["/tmp/assets"]
