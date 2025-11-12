# WhatsApp Chatbot

Node.js chatbot built on Baileys that connects to a MySQL database and exposes HTTP endpoints for sending and receiving WhatsApp messages.

## Requirements

- Node.js 18+
- npm
- MySQL 8 (or compatible version)

## Installation

1. **Install dependencies**
   ```bash
   npm install
   ```

2. **Configure environment**
   - Create a `.env` file using the template:
     ```bash
     cp .env.example .env
     ```
   - Update the values to match your database server:
     - `DB_HOST` – database host
     - `DB_PORT` – port (default `3306`)
     - `DB_USER` – username
     - `DB_PASS` – password
     - `DB_NAME` – schema name

3. **Import the database (optional)**
   - Use the provided SQL dump (`chatbot lasmini 12112025.sql`) to seed tables:
     ```bash
     mysql -u your_user -p your_database < "chatbot lasmini 12112025.sql"
     ```

## Running the bot

```bash
node index.js
```

When the process starts it will:
- Load credentials from `.env`
- Connect to the WhatsApp Web socket (scan the QR at `/qr`)
- Expose API routes under `/chat`, `/group`, `/auth`, and `/contact`

## Useful tips

- Keep `.env`, `baileys_auth_info`, and `data/jid-cache.json` out of version control (already covered in `.gitignore`).
- Restart the bot if you change environment variables or update dependencies.
