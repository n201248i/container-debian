FROM oven/bun:debian

WORKDIR /workspaces

RUN chmod -R 755 /workspaces

RUN apt update && apt-get install -y \
    curl \
    lsb-release \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*
    
RUN bun upgrade

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN bun add -d husky

RUN bunx husky init

RUN bunx playwright install-deps

RUN bunx playwright install

CMD ["bash"] 