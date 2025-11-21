# Gitee 部署脚本
cd E:\cloud\1

# 初始化 Git 仓库（如果还没初始化）
if (-not (Test-Path ".git")) {
    git init
}

# 复制文件到正确位置
Copy-Item "index.html" -Destination "." -Force
Copy-Item "README.md" -Destination "." -Force

# 添加所有文件到 Git
git add .

# 提交更改
git commit -m "Add love confession page"

# 添加远程仓库
git remote add origin https://gitee.com/yqs2/love-confession.git

# 推送到 Gitee
git push -u origin master

Write-Host "部署完成！访问 https://yqs2.gitee.io/love-confession 查看页面"