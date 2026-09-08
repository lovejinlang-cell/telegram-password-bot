# 🚀 Render Setup Guide - Visual Step-by-Step

## 🎯 គោលដៅ: Deploy Bot ដើម្បីរត់ 24/7 ដោយឥតគិតថ្លៃ

---

## ជំហានទី 1: ត្រៀមរៀបចំ GitHub Repository

### Option A: Push ទៅ Existing Repo (Recommended)
```bash
cd "C:\Users\Lenovo\Downloads\Password Security"
git add .
git commit -m "Ready for deployment"
git push origin main
```

### Option B: បង្កើត Repository ថ្មី
1. ទៅ: https://github.com/new
2. Repository name: `telegram-password-bot`
3. Visibility: Public (or Private, both work!)
4. Click "Create repository"
5. រត់:
```bash
git remote set-url origin https://github.com/YOUR_USERNAME/telegram-password-bot.git
git push -u origin main
```

---

## ជំហានទី 2: បង្កើត Render Account

1. **ទៅ**: https://render.com/register
2. **ជ្រើសរើស**: "Sign up with GitHub" (ងាយស្រួលបំផុត!)
3. **Authorize** Render to access your repositories
4. ✅ Account បានបង្កើតហើយ!

---

## ជំហានទី 3: បង្កើត Web Service

### 3.1 Click "New +"
- នៅ Render Dashboard, ចុច **"New +"** button (ខាងលើស្តាំ)
- ជ្រើសរើស **"Web Service"**

### 3.2 Connect Repository
- Click **"Connect a repository"**
- ជ្រើសរើស `password-bot` (ឬ repository name របស់អ្នក)
- Click **"Connect"**

### 3.3 Configure Service

#### Basic Info:
- **Name**: `secure-password-bot` (ឬឈ្មោះអ្វីក៏បាន)
- **Region**: Singapore (លឿនបំផុតសម្រាប់ Asia!)
- **Branch**: `main`

#### Build Settings:
```
Runtime: Python 3
Build Command: pip install -r requirements.txt
Start Command: python telegram_bot.py
```

#### ⚠️ សំខាន់: Instance Type
- ជ្រើសរើស **"Free"** plan
- **IMPORTANT**: Scroll down និងមើល "Instance Type"
  - បើវាបង្ហាញ "Web Service" → **ប្តូរទៅ "Background Worker"**!
  - Bots ត្រូវការ Worker, ទេ Web Service

---

## ជំហានទី 4: បន្ថែម Environment Variables

### 4.1 Scroll down ទៅ "Environment Variables" section
### 4.2 Click "Add Environment Variable"
### 4.3 បញ្ចូល:
```
Key:   TELEGRAM_BOT_TOKEN
Value: 7995211245:AAGUVqKDHAnZgAkLmWjmMvGBk7CmABAWaS8
```

### 4.4 Click "Save"

---

## ជំហានទី 5: Deploy!

### 5.1 Click "Create Web Service" (button ខាងក្រោម)

### 5.2 រង់ចាំ Deployment
Render នឹង:
1. ✅ Clone repository ពី GitHub
2. ✅ Install Python dependencies
3. ✅ Start bot
4. ✅ Status → "Live" (ប្រហែល 2-3 នាទី)

### 5.3 ពិនិត្យ Logs
- Click **"Logs"** tab
- អ្នកគួរឃើញ:
```
🌐 HTTP ping server on port 8080
🔐 Password Bot is running…
```

---

## ជំហានទី 6: Test Bot!

### 6.1 បើក Telegram
### 6.2 ស្វែងរក bot របស់អ្នក (ឈ្មោះដែលអ្នកបានបង្កើតជាមួយ @BotFather)
### 6.3 ផ្ញើ: `/start`

### ✅ ប្រសិនបើ bot responds = Success! Bot កំពុងរត់ 24/7!

---

## 📊 Dashboard Features

### Logs Tab
- Real-time bot activity
- មើលរាល់ messages ដែល bot receive
- Debug errors

### Metrics Tab
- CPU usage
- Memory usage
- Response time

### Settings Tab
- Environment variables
- Service configuration
- Suspend/Resume service

---

## 🔄 Auto-Deploy

### ការ Setup Auto-Deploy:
1. Push code ថ្មីទៅ GitHub
2. Render auto-detects changes
3. Auto-redeploy bot
4. **មិនចាំបាច់ធ្វើអ្វីផ្សេងទៀត!**

### Disable Auto-Deploy:
- Settings → Auto-Deploy → Toggle OFF

---

## ⚠️ Free Tier Limitations

### រត់តែបើមាន activity?
- Free services "spin down" after **15 min** of inactivity
- Bot auto-restart when message arrives
- First message after sleep = 30 sec delay

### ដំណោះស្រាយ:
Code របស់អ្នកមាន **HTTP ping server** រួចហើយ!
- Port 8080 open
- Keep-alive ping every 10 min
- **Bot នឹងមិនដេកទេ!** 🎉

---

## 🐛 Common Issues

### Issue 1: "Build Failed"
**Reason:** `requirements.txt` មិនត្រឹមត្រូវ
**Fix:** ពិនិត្យ file contains:
```
python-telegram-bot==20.7
```

### Issue 2: "Application failed to start"
**Reason:** Token ខុស ឬគ្មាន
**Fix:** ពិនិត្យ Environment Variables → `TELEGRAM_BOT_TOKEN`

### Issue 3: Bot responds slowly
**Reason:** Free tier "spinning up"
**Fix:** រង់ចាំ 30 វិនាទី after first message

### Issue 4: "Web Service" timeout
**Reason:** Wrong instance type
**Fix:** Change to **"Background Worker"** type

---

## 💡 Pro Tips

### 1. Custom Domain
- Settings → Custom Domains
- Add your own domain (optional)

### 2. Notifications
- Settings → Notifications
- Email alerts for failures

### 3. Multiple Environments
- Create separate services:
  - `password-bot-dev` (development)
  - `password-bot-prod` (production)

### 4. Secret Management
- Environment Variables → Hide values
- មិនបង្ហាញនៅក្នុង logs

---

## 📞 Support

### Render Support:
- Dashboard → Help
- https://render.com/docs

### Bot Issues:
- Check logs first
- Test locally: `.\run_bot.ps1`
- Compare with working version

---

## ✅ Final Checklist

នៅពេល deploy រួច:
- [ ] Repository pushed ទៅ GitHub
- [ ] Render account created និង connected
- [ ] Web Service created (**Background Worker** type)
- [ ] Environment variable `TELEGRAM_BOT_TOKEN` set correctly
- [ ] Build successful (check Logs)
- [ ] Service status = **"Live"** (green)
- [ ] Bot responds to `/start` on Telegram
- [ ] No errors នៅក្នុង Logs tab

### 🎉 ប្រសិនបើទាំងអស់ ✅ = Bot រត់ 24/7!

---

## 📈 Next Steps

### Monitor Performance:
- Check metrics daily
- Watch for errors
- Monitor response time

### Update Bot:
1. Make changes locally
2. Test: `.\run_bot.ps1`
3. Push to GitHub
4. Render auto-deploys!

### Add Features:
- User analytics
- Custom commands
- Database integration
- Multi-language support

---

**🎯 ចប់! Bot របស់អ្នក ready សម្រាប់ world! 🌍**
