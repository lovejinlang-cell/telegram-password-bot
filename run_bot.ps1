# 🔐 Secure Password Bot - Quick Start Script
# Run this script to start the bot locally

Write-Host "🔐 Starting Telegram Password Bot..." -ForegroundColor Cyan
Write-Host ""

# Check if virtual environment exists
if (-not (Test-Path "venv")) {
    Write-Host "📦 Creating virtual environment..." -ForegroundColor Yellow
    python -m venv venv
}

# Activate virtual environment
Write-Host "🔄 Activating virtual environment..." -ForegroundColor Yellow
& ".\venv\Scripts\Activate.ps1"

# Check if dependencies are installed
Write-Host "📚 Checking dependencies..." -ForegroundColor Yellow
pip list | Select-String "python-telegram-bot" | Out-Null
if (-not $?) {
    Write-Host "📥 Installing dependencies..." -ForegroundColor Yellow
    pip install -r requirements.txt
}

# Check for .env file
if (Test-Path ".env") {
    Write-Host "🔑 Loading token from .env file..." -ForegroundColor Green
    Get-Content .env | ForEach-Object {
        if ($_ -match "^TELEGRAM_BOT_TOKEN=(.+)$") {
            $env:TELEGRAM_BOT_TOKEN = $matches[1]
        }
    }
} else {
    Write-Host "⚠️  No .env file found!" -ForegroundColor Red
    Write-Host "Please create .env file with your TELEGRAM_BOT_TOKEN" -ForegroundColor Yellow
    Write-Host "Example: TELEGRAM_BOT_TOKEN=your_token_here" -ForegroundColor Yellow
    exit 1
}

# Check if token is set
if (-not $env:TELEGRAM_BOT_TOKEN) {
    Write-Host "❌ TELEGRAM_BOT_TOKEN not set!" -ForegroundColor Red
    Write-Host "Please add your token to .env file" -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "✅ Everything ready! Starting bot..." -ForegroundColor Green
Write-Host "📱 Go to Telegram and try your bot!" -ForegroundColor Cyan
Write-Host "⏹️  Press Ctrl+C to stop the bot" -ForegroundColor Yellow
Write-Host ""

# Run the bot
python telegram_bot.py
