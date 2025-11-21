# 立即部署到GitHub Pages
Write-Host "🚀 开始部署到GitHub Pages..." -ForegroundColor Green

# 切换到项目目录
cd E:\cloud\1

# 检查git状态
Write-Host "📋 检查Git状态..." -ForegroundColor Yellow
git status

# 添加所有文件
Write-Host "➕ 添加所有文件到Git..." -ForegroundColor Blue
git add .

# 提交更改
Write-Host "💾 提交更改..." -ForegroundColor Blue
git commit -m "Fix button responsiveness with multiple event binding strategies"

# 推送到GitHub
Write-Host "📤 推送到GitHub..." -ForegroundColor Magenta
try {
    git push origin master
    Write-Host "✅ 推送成功！" -ForegroundColor Green
} catch {
    Write-Host "⚠️  推送失败，尝试强制推送..." -ForegroundColor Yellow
    git push origin master --force
    Write-Host "✅ 强制推送完成！" -ForegroundColor Green
}

Write-Host "🎉 部署完成！" -ForegroundColor Green
Write-Host "📍 请访问：https://55dada.github.io/love-confession/" -ForegroundColor Cyan
Write-Host "🔍 记得按F12查看控制台日志" -ForegroundColor Yellow
Write-Host "🔄 如果按钮不工作，请按Ctrl+F5强制刷新" -ForegroundColor Magenta

# 等待用户确认
Write-Host "按任意键继续..." -ForegroundColor White
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")