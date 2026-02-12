FROM mcr.microsoft.com/devcontainers/typescript-node:20

# Installiamo client mysql per script di utility
RUN apt-get update && apt-get install -y mysql-client php-cli && rm -rf /var/lib/apt/lists/*

WORKDIR /workspaces/joomla-mcp-suite
