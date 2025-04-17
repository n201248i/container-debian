FROM mcr.microsoft.com/playwright:v1.42.1@sha256:b2b78a74b04b3cfdf35046c623c49741de35ef67f1b4a21de8e316dbb89fe68e

WORKDIR /app

RUN chmod -R 755 /app

RUN apt update && apt-get install -y \
    curl \
    git \
    unzip \
    lsb-release

RUN curl -fsSL https://bun.sh/install | bash
ENV PATH=$PATH:/root/.bun/bin
RUN bun upgrade

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN bun add -d husky
RUN bunx husky init

RUN bunx playwright install-deps
RUN bunx playwright install

CMD ["bash"]