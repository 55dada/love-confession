# 快速修复部署脚本
cd E:\cloud\1

Write-Host "开始部署修复..."

# 添加所有更改
git add .

# 提交修复
git commit -m "Fix moveNoButton function error - ensure global function definition and onclick binding"

# 推送到GitHub
git push origin master

Write-Host "✅ 修复已部署到GitHub!"
Write-Host "等待1-2分钟后访问: https://55dada.github.io/love-confession/"
Write-Host "刷新浏览器页面(Ctrl+F5)查看修复效果"