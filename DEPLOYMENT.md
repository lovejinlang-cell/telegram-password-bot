# 🚀 ការណែនាំ Deploy Bot 24/7 នៅលើ Render

## 📋 ជំហានទី 1: Push Code ទៅ GitHub

### A. ប្រសិនបើអ្នកមាន GitHub account access:
```bash
git push origin main
```

### B. ប្រសិនបើ permission denied:
1. បើក GitHub នៅ https://github.com/God-092/password-bot
2. ចុច "Settings" (របស់ repository)
3. ចុច "Actions" > "General"
4. ឬសាកល្បងឡើងវិញដោយប្រើ GitHub Desktop app

### C. ឬបង្កើត Repository ថ្មី:
1. ទៅ https://github.com/new
2. បង្កើត repository ថ្មី (ឧ. `telegram-password-bot`)
3. រត់ commands:
```bash
git remote set-url origin https://github.com/YOUR_USERNAME/telegram-password-bot.git
git push -u origin main
```

---

## 📋 ជំហានទី 2: Deploy នៅលើ Render

### 1. បង្កើត Account
- ទៅ https://render.com
- Sign up ដោយ GitHub account (ឬ email)
- ✅ **Free tier** មាន: 750 hours/month (គ្រប់គ្រាន់សម្រាប់ 24/7!)

### 2. បង្កើត Web Service
1. ចុច **"New +"** > **"Web Service"**
2. Connect GitHub repository របស់អ្នក
3. ជ្រើសរើស `password-bot` (ឬ repository name របស់អ្នក)

### 3. Configure Service
Render នឹង auto-detect `render.yaml` ហើយបំពេញស្វ័យប្រវត្តិ:

```yaml
Name: secure-password-bot
Runtime: Python
Build Command: pip install -r requirements.txt
Start Command: python telegram_bot.py
```

**⚠️ សំខាន់:** ប្តូរ "Instance Type" ទៅ **"Worker"** ឬប្រើ `render.yaml` config!

### 4. បន្ថែម Environment Variable
នៅក្នុង "Environment" section:
- **Key**: `TELEGRAM_BOT_TOKEN`
- **Value**: `7995211245:AAGUVqKDHAnZgAkLmWjmMvGBk7CmABAWaS8`

### 5. Deploy!
ចុច **"Create Web Service"**

Render នឹង:
- ✅ Download code ពី GitHub
- ✅ Install dependencies
- ✅ Start bot
- ✅ រត់ 24/7 ដោយឥតគិតថ្លៃ!

---

## 📊 ពិនិត្យមើល Bot Status

### នៅលើ Render Dashboard:
- **Logs**: មើល real-time bot activity
- **Metrics**: CPU, memory usage
- **Manual Deploy**: Re-deploy បើមាន changes

### នៅលើ Telegram:
- ផ្ញើ `/start` ទៅ bot
- ប្រសិនបើវា respond = ✅ Bot ដំណើរការ!

---

## 🔧 Troubleshooting

### Bot មិនដំណើរការ?

**1. ពិនិត្យ Logs នៅលើ Render:**
- សាររបស់កំហុសមានអ្វី?
- Token ត្រឹមត្រូវអត់?

**2. Bot token ខុស:**
```
InvalidToken: The token was rejected
```
→ ពិនិត្យ `TELEGRAM_BOT_TOKEN` នៅក្នុង Environment Variables

**3. Dependencies error:**
```
ModuleNotFoundError: No module named 'telegram'
```
→ ពិនិត្យ `requirements.txt` ត្រឹមត្រូវ

**4. Service type ខុស:**
- ត្រូវប្រើ **Worker** type សម្រាប់ bot
- ទេ **Web Service** type (មាន timeout បញ្ហា)

---

## 🎯 បន្ទាប់មកធ្វើអ្វី?

### Auto-deploy on Push:
- រាល់ពេល push ទៅ GitHub
- Render នឹង auto-deploy ថ្មី
- មិនចាំបាច់ manual deploy!

### Monitor Bot:
- Render dashboard: https://dashboard.render.com
- មើល logs real-time
- ទទួល email notifications បើ bot crash

### Custom Domain (Optional):
- ប្រសិនបើអ្នកមាន domain
- អាច setup custom URL សម្រាប់ bot

---

## 💰 តម្លៃ

**Free Tier** (អ្វីដែលអ្នកនឹងប្រើ):
- ✅ 750 hours/month (= 31 days continuous!)
- ✅ Automatic deploy
- ✅ HTTPS included
- ✅ Logs & monitoring

**⚠️ Note:** Free services "spin down" after 15 mins of inactivity តែ bot នឹង auto-restart when messages arrive!

---

## 🆘 Need Help?

1. **Render Docs**: https://render.com/docs
2. **python-telegram-bot Docs**: https://docs.python-telegram-bot.org
3. **ខ្ញុំ (Kiro AI)**: សួរខ្ញុំបើមានបញ្ហា! 😊

---

## ✅ Checklist

នៅពេល deploy រួច, ពិនិត្យ:
- [ ] Code pushed ទៅ GitHub
- [ ] Render account created
- [ ] Web Service created
- [ ] `TELEGRAM_BOT_TOKEN` environment variable set
- [ ] Service type = **Worker**
- [ ] Deployment successful
- [ ] Bot responds to `/start` on Telegram

**ប្រសិនបើទាំងអស់ ✅ = Bot រត់ 24/7 ហើយ! 🎉**
