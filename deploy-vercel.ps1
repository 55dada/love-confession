# Vercel 部署准备脚本

# 确保文件名为 index.html（Vercel 默认主页）
Copy-Item "tmp.html" -Destination "index.html" -Force

Write-Host "✅ 文件已重命名为 index.html"
Write-Host ""
Write-Host "📋 接下来的步骤："
Write-Host "1. 访问 https://github.com 创建新仓库 'love-confession'"
Write-Host "2. 运行以下 Git 命令："
Write-Host ""
Write-Host "   cd E:\cloud\1"
Write-Host "   git init"
Write-Host "   git add ."
Write-Host "   git commit -m 'Add love confession page'"
Write-Host "   git remote add origin https://github.com/你的用户名/love-confession.git"
Write-Host "   git push -u origin master"
Write-Host ""
Write-Host "3. 然后访问 https://vercel.com 进行部署"