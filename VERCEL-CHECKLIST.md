# ✅ VERCEL DEPLOYMENT CHECKLIST

## Pre-Deployment (Local)

- [x] ✅ PHP version updated in composer.json to support PHP 8.x
- [x] ✅ Vercel.json configured with correct PHP runtime (0.6.0)
- [x] ✅ Function limits configured (memory: 1024MB, timeout: 10s)
- [x] ✅ Cache paths configured to use /tmp
- [x] ✅ .vercelignore updated to exclude development files
- [ ] All changes committed and pushed to GitHub

## Vercel Dashboard Configuration

### Step 1: Import Project
- [ ] Log in to [Vercel Dashboard](https://vercel.com/dashboard)
- [ ] Click "Add New..." → "Project"
- [ ] Import your GitHub repository: `Felipe16051975/ababu-veterinario`
- [ ] Click "Import"

### Step 2: Configure Environment Variables

**Required Variables:**
```
APP_NAME=Ababu Veterinario
APP_ENV=production
APP_KEY=base64:YOUR_KEY_HERE
APP_DEBUG=false
APP_URL=https://your-project.vercel.app
```

**Database Variables:**
```
DB_CONNECTION=mysql
DB_HOST=your-database-host
DB_PORT=3306
DB_DATABASE=your-database-name
DB_USERNAME=your-database-user
DB_PASSWORD=your-database-password
```

**Laravel Configuration:**
```
SESSION_DRIVER=cookie
CACHE_DRIVER=array
LOG_CHANNEL=stderr
QUEUE_CONNECTION=sync
SESSION_LIFETIME=120
```

### Step 3: Generate APP_KEY (if needed)
```bash
# Run locally:
php artisan key:generate --show

# Copy the entire output (including "base64:")
# Example: base64:iWMer7qYPW9sePpKwPEKhNkE38NxL6btMNjNjY46Wi4=
```

### Step 4: Database Setup

Choose one option:

**Option A: PlanetScale (Recommended)**
- [ ] Create account at [planetscale.com](https://planetscale.com)
- [ ] Create new database: `ababu-veterinario`
- [ ] Copy connection credentials
- [ ] Update Vercel environment variables

**Option B: Railway**
- [ ] Create account at [railway.app](https://railway.app)
- [ ] Create MySQL service
- [ ] Copy connection credentials
- [ ] Update Vercel environment variables

**Option C: Existing MySQL**
- [ ] Ensure database is accessible from internet
- [ ] Allow connections from all IPs (0.0.0.0/0) or Vercel IPs
- [ ] Configure SSL if required
- [ ] Update Vercel environment variables

### Step 5: Deploy
- [ ] Click "Deploy" in Vercel dashboard
- [ ] Wait for deployment to complete (2-5 minutes)
- [ ] Note the deployment URL

## Post-Deployment

### Step 6: Migrate Database
```bash
# Configure .env with remote database credentials temporarily
php artisan migrate --force

# Seed database if needed
php artisan db:seed --force
```

### Step 7: Verification
- [ ] Visit your Vercel URL
- [ ] Application loads without 500 error
- [ ] CSS and JavaScript load correctly
- [ ] Can access login page
- [ ] Can log in (if users exist)
- [ ] Database operations work
- [ ] Images and assets load properly

### Step 8: Check Logs
```bash
# Install Vercel CLI (optional)
npm i -g vercel

# View logs
vercel logs your-project-url

# Or check in Vercel Dashboard → Project → Deployments → Click deployment → Function logs
```

## Troubleshooting

### ⚠️ Error 500 - Internal Server Error
1. [ ] Check Vercel function logs
2. [ ] Verify APP_KEY is set correctly
3. [ ] Verify database credentials
4. [ ] Verify database is accessible

### ⚠️ CSS/JS Not Loading
1. [ ] Check browser console for errors
2. [ ] Verify APP_URL matches your Vercel URL
3. [ ] Check vercel.json routes configuration

### ⚠️ Database Connection Failed
1. [ ] Verify database credentials in environment variables
2. [ ] Check if database allows remote connections
3. [ ] Verify SSL configuration if required
4. [ ] Test connection from local with same credentials

### ⚠️ Session Issues
1. [ ] Verify SESSION_DRIVER=cookie in environment variables
2. [ ] Verify APP_KEY is set
3. [ ] Clear browser cookies and try again

### ⚠️ Timeout Errors
1. [ ] Optimize slow database queries
2. [ ] Add database indexes
3. [ ] Consider upgrading to Vercel Pro for longer timeouts

## Success Criteria

✅ Application loads without errors  
✅ All assets (CSS, JS, images) load correctly  
✅ Users can log in  
✅ Database operations work  
✅ No console errors  
✅ Pages load in < 3 seconds  

## Performance Optimization (Optional)

- [ ] Enable OPcache in production
- [ ] Configure CDN for static assets
- [ ] Add database connection pooling
- [ ] Implement caching strategy
- [ ] Add custom domain

## Custom Domain (Optional)

1. [ ] Go to Vercel Dashboard → Project → Settings → Domains
2. [ ] Add your custom domain
3. [ ] Configure DNS records as instructed
4. [ ] Update APP_URL in environment variables
5. [ ] Wait for SSL certificate (automatic)

## Maintenance

### Regular Tasks:
- [ ] Monitor error logs weekly
- [ ] Check database backup status
- [ ] Review Vercel usage/billing
- [ ] Update dependencies monthly
- [ ] Test critical features after deployment

### When Updating Code:
- [ ] Test locally first
- [ ] Commit and push to GitHub
- [ ] Vercel auto-deploys from main branch
- [ ] Monitor deployment logs
- [ ] Test production after deployment

## Support Resources

- 📖 [VERCEL-FIXES.md](./VERCEL-FIXES.md) - Detailed explanation of fixes
- 📖 [VERCEL-DEPLOYMENT.md](./VERCEL-DEPLOYMENT.md) - Original deployment guide
- 🌐 [Vercel Documentation](https://vercel.com/docs)
- 🌐 [Laravel Deployment](https://laravel.com/docs/7.x/deployment)
- 🆘 [Vercel Support](https://vercel.com/support)

---

**Last Updated:** 2025-11-15  
**Version:** 1.0  
**Status:** ✅ Ready for Deployment
