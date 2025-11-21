# 修复 JavaScript 脚本

# 读取当前文件内容
$content = Get-Content "E:\cloud\1\tmp.html" -Raw

# 检查 JavaScript 是否完整
if (-not $content.Contains("function resetPage()")) {
    Write-Host "❌ JavaScript 代码不完整，正在修复..."
    
    # 修复文件，添加缺失的 JavaScript 代码
    $fixedContent = $content + @"

        // 显示甜蜜消息
        function showSweetMessage() {
            const button = document.getElementById('noBtn');
            button.textContent = '我就知道你愿意~';
            button.style.background = '#4CAF50';
            button.onclick = handleYes;
            button.onmouseover = null;
            
            // 显示额外的爱心
            for (let i = 0; i < 10; i++) {
                setTimeout(() => {
                    const heart = document.createElement('div');
                    heart.textContent = '💕';
                    heart.style.position = 'fixed';
                    heart.style.left = Math.random() * 100 + 'vw';
                    heart.style.top = Math.random() * 100 + 'vh';
                    heart.style.fontSize = '30px';
                    heart.style.zIndex = '1001';
                    heart.style.animation = 'float 3s ease-out forwards';
                    heart.style.pointerEvents = 'none';
                    document.body.appendChild(heart);
                    
                    setTimeout(() => {
                        heart.remove();
                    }, 3000);
                }, i * 100);
            }
        }
        
        // 创建庆祝效果
        function createFireworks() {
            const container = document.getElementById('fireworks');
            const colors = ['#ff0000', '#00ff00', '#0000ff', '#ffff00', '#ff00ff', '#00ffff'];
            
            for (let i = 0; i < 50; i++) {
                setTimeout(() => {
                    const firework = document.createElement('div');
                    firework.style.position = 'absolute';
                    firework.style.width = '4px';
                    firework.style.height = '4px';
                    firework.style.background = colors[Math.floor(Math.random() * colors.length)];
                    firework.style.borderRadius = '50%';
                    firework.style.left = Math.random() * 100 + 'vw';
                    firework.style.top = Math.random() * 100 + 'vh';
                    firework.style.boxShadow = '0 0 10px 2px ' + colors[Math.floor(Math.random() * colors.length)];
                    container.appendChild(firework);
                    
                    // 烟花爆炸效果
                    setTimeout(() => {
                        firework.style.transform = 'scale(3)';
                        firework.style.opacity = '0';
                        firework.style.transition = 'all 0.5s ease';
                    }, 100);
                    
                    // 移除烟花
                    setTimeout(() => {
                        if (firework.parentNode) {
                            firework.parentNode.removeChild(firework);
                        }
                    }, 1000);
                }, i * 100);
            }
        }
        
        // 重置页面
        function resetPage() {
            document.getElementById('mainContent').classList.remove('hidden');
            document.getElementById('successMessage').classList.add('hidden');
            
            // 重置"再考虑一下"按钮位置和属性
            const noBtn = document.getElementById('noBtn');
            noBtn.style.position = '';
            noBtn.style.left = '';
            noBtn.style.top = '';
            noBtn.style.zIndex = '';
            noBtn.style.background = '';
            noBtn.textContent = '再考虑一下';
            noBtn.onclick = null;
            noBtn.onmouseover = moveNoButton;
            
            // 重置计数器
            moveCount = 0;
            
            // 清除所有额外爱心
            const extraHearts = document.querySelectorAll('div[style*="fixed"]');
            extraHearts.forEach(heart => {
                if (heart.textContent === '💕' && heart.style.zIndex === '1001') {
                    heart.remove();
                }
            });
        }
        
        // 添加淡入淡出动画
        const style = document.createElement('style');
        style.textContent = `
            @keyframes fadeInOut {
                0% { opacity: 0; transform: translate(-50%, -50%) scale(0.8); }
                20% { opacity: 1; transform: translate(-50%, -50%) scale(1); }
                80% { opacity: 1; transform: translate(-50%, -50%) scale(1); }
                100% { opacity: 0; transform: translate(-50%, -50%) scale(0.8); }
            }
        `;
        document.head.appendChild(style);

    </script>
</body>
</html>"@
    
    # 写入修复后的内容
    $fixedContent | Out-File -FilePath "E:\cloud\1\tmp.html" -Encoding UTF8
    Write-Host "✅ JavaScript 代码已修复！"
} else {
    Write-Host "✅ JavaScript 代码看起来是完整的"
}

# 同步到 GitHub
Write-Host "🔄 正在同步到 GitHub..."
cd E:\cloud\1
copy tmp.html index.html -Force
git add .
git commit -m "修复 JavaScript 按钮响应问题"
git push origin master

Write-Host "🎉 修复完成！等待 2 分钟后访问："
Write-Host "📱 https://55dada.github.io/love-confession/"