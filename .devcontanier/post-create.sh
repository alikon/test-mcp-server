#!/bin/bash

echo "🚀 Inizio configurazione post-creazione..."

# 1. Installazione dipendenze Node.js per l'MCP Server
if [ -f "package.json" ]; then
    echo "📦 Installazione dipendenze npm..."
    npm install
else
    echo "⚠️ package.json non trovato, inizializzazione in corso..."
    npm init -y
    npm install @modelcontextprotocol/sdk mysql2
fi

# 2. Preparazione file .env (se non esiste)
if [ ! -f ".env" ]; then
    echo "📝 Creazione file .env di esempio..."
    echo "JOOMLA_API_TOKEN=inserisci_qui_il_token" >> .env
    echo "DB_PREFIX=jos_" >> .env
fi

# 3. Permessi cartella Joomla (condivisa tramite volume)
# Assicuriamoci che il server MCP possa scrivere se necessario
sudo chmod -R 775 /var/www/html 2>/dev/null || true

echo "✅ Setup completato correttamente!"
