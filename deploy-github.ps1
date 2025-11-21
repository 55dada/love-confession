# GitHub Pages 部署脚本
# 创建 GitHub 仓库并部署

# 步骤1：去 GitHub 创建新仓库
Write-Host "1. 访问 https://github.com 创建新仓库"
Write-Host "2. 仓库名：love-confession"
Write-Host "3. 设置为公开仓库"
Write-Host "4. 复制仓库地址"

# 步骤2：Git 操作
cd E:\cloud\1

# 如果需要，更改远程仓库地址
# git remote set-url origin https://github.com/你的用户名/love-confession.git

# 推送到 GitHub
git add .
git commit -m "Add responsive love confession page"
git push origin master

Write-Host "3. 进入仓库设置 > Pages > 部署分支选择 master"
Write-Host "4. 访问地址：https://你的用户名.github.io/love-confession"