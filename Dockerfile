FROM storezhang/ubuntu:23.04.17


LABEL author="storezhang<华寅>"
LABEL email="storezhang@gmail.com"
LABEL qq="160290688"
LABEL wechat="storezhang"
LABEL description="Ohmyzsh镜像，集成常见的插件"


ENV OHMYZSH_HOME=/usr/lib/ohmyzsh
ENV OHMYZSH_PLUGINS ${OHMYZSH_HOME}/plugins
ENV OHMYZSH_THEMES ${OHMYZSH_HOME}/themes


RUN set -ex \
    \
    \
    \
    && apt update -y \
    && apt install git libcurl4-openssl-dev -y \
    \
    \
    \
    && git clone --depth=1 https://ghproxy.com/https://github.com/ohmyzsh/ohmyzsh.git ${OHMYZSH_HOME} \
    && git clone --depth=1 https://ghproxy.com/https://github.com/zsh-users/zsh-autosuggestions.git ${OHMYZSH_PLUGINS}/zsh-autosuggestions \
    && git clone --depth=1 https://ghproxy.com/https://github.com/zsh-users/zsh-syntax-highlighting.git ${OHMYZSH_PLUGINS}/zsh-syntax-highlighting \
    && git clone --depth=1 https://ghproxy.com/https://github.com/romkatv/powerlevel10k.git ${OHMYZSH_THEMES}/powerlevel10k \
    \
    \
    \
    # 清理镜像，减少无用包 \
    && apt autoremove git libcurl4-openssl-dev -y \
    && rm -rf /var/lib/apt/lists/* \
    && apt autoclean
