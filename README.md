# 🔐 Secure Password Generator Bot

Telegram bot មួយដែលបង្កើតពាក្យសម្ងាត់ដែលមានសុវត្ថិភាពខ្ពស់ដោយប្រើ Python's `secrets` module។

## ✨ Features

- 🔒 Cryptographically secure passwords
- 📏 Customizable length (8-64 characters)
- 🔡 Uppercase, lowercase, digits, symbols
- 🎯 Quick commands: `/quick`, `/strong`, `/pin`
- ⚙️ Interactive settings panel
- 📱 Mobile-friendly (easy copy on phones)
- 🆓 100% free for everyone

## 🤖 Commands

- `/start` - Welcome message
- `/generate` - Generate with current settings
- `/quick` - 20-character password
- `/strong` - 32-character password
- `/pin` - 6-digit PIN
- `/settings` - Customize your passwords
- `/help` - Show all commands

You can also just type a number (e.g., `24`) to instantly get a password of that length!

## 🚀 Local Development

```bash
# Create virtual environment
python -m venv venv

# Activate (Windows)
.\venv\Scripts\Activate.ps1

# Install dependencies
pip install -r requirements.txt

# Set your bot token
$env:TELEGRAM_BOT_TOKEN = "YOUR_TOKEN_HERE"

# Run the bot
python telegram_bot.py
```

## ☁️ Deploy to Render

1. Push this code to GitHub
2. Create a new **Web Service** on [Render](https://render.com)
3. Connect your GitHub repository
4. Render will auto-detect `render.yaml`
5. Add environment variable: `TELEGRAM_BOT_TOKEN`
6. Deploy!

Bot will run 24/7 on Render's free tier.

## 📝 Environment Variables

- `TELEGRAM_BOT_TOKEN` - Your bot token from [@BotFather](https://t.me/BotFather)
- `PORT` - HTTP server port (default: 8080, auto-set by Render)
- `RENDER_EXTERNAL_URL` - Auto-set by Render for keep-alive ping

## 🔒 Security

- Uses Python's `secrets` module (cryptographically strong)
- No passwords are stored or logged
- Rate limiting (20 requests/user/minute)
- Open source - audit the code yourself!

## 📄 License

MIT License - Free to use and modify!
