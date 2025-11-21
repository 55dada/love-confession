@echo off
title 部署到GitHub Pages
color 0A

echo 🚀 开始部署到GitHub Pages...
echo.

cd /d E:\cloud\1

echo 📋 检查Git状态...
git status
echo.

echo ➕ 添加所有文件...
git add .
echo.

echo 💾 提交更改...
git commit -m "Fix button responsiveness with multiple event binding strategies"
echo.

echo 📤 推送到GitHub...
git push origin master
echo.

echo ✅ 部署完成！
echo.
echo 📍 访问地址：https://55dada.github.io/love-confession/
echo 🔍 记得按F12查看控制台日志
echo 🔄 如果按钮不工作，请按Ctrl+F5强制刷新
echo.
pause