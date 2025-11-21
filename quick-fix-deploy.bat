@echo off
cd /d E:\cloud\1

echo 开始部署修复...

git add .

git commit -m "Fix moveNoButton function error - ensure global function definition and onclick binding"

git push origin master

echo ✅ 修复已部署到GitHub!
echo 等待1-2分钟后访问: https://55dada.github.io/love-confession/
echo 刷新浏览器页面(Ctrl+F5)查看修复效果
pause