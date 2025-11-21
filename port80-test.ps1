# 80端口测试服务器
try {
    $listener = New-Object System.Net.HttpListener
    $listener.Prefixes.Add("http://+:80/")
    $listener.Start()
    
    Write-Host "✅ 80端口服务器启动成功！"
    Write-Host "手机访问: http://172.16.103.131/tmp.html"
    Write-Host "按 Ctrl+C 停止服务器"
    
    while ($true) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response
        
        if ($request.Url.LocalPath -eq "/tmp.html" -or $request.Url.LocalPath -eq "/") {
            $content = Get-Content "E:\cloud\1\tmp.html" -Raw -Encoding UTF8
            $buffer = [System.Text.Encoding]::UTF8.GetBytes($content)
            $response.ContentLength64 = $buffer.Length
            $response.ContentType = "text/html; charset=utf-8"
            $response.OutputStream.Write($buffer, 0, $buffer.Length)
        }
        
        $response.Close()
    }
}
catch {
    Write-Host "❌ 80端口被占用，需要管理员权限"
    Write-Host "请右键以管理员身份运行 PowerShell"
}
finally {
    $listener.Stop()
}