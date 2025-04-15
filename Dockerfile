FROM oven/bun:debian

RUN apt update && apt-get install -y \
    curl \
    lsb-release \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN npx playwright install-deps

RUN npx playwright install   

WORKDIR /workspaces
RUN chmod -R 755 /workspaces

CMD ["bash"] 