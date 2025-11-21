# 使用80端口的HTTP服务器（需要管理员权限）
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://+:80/")
$listener.Start()

# 获取本机IP地址
$ipAddresses = [System.Net.Dns]::GetHostAddresses([System.Net.Dns]::GetHostName()) | Where-Object { $_.AddressFamily -eq 'InterNetwork' }
$localIP = $ipAddresses[0].IPAddressToString

Write-Host "Server started on port 80"
Write-Host "Local access: http://localhost/"
Write-Host "Mobile access: http://$($localIP)/"
Write-Host "Mobile page: http://$($localIP)/tmp.html"
Write-Host "Press Ctrl+C to stop server"

try {
    while ($true) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response
        
        $path = $request.Url.LocalPath
        if ($path -eq "/" -or $path -eq "/tmp.html") {
            $content = Get-Content "E:\cloud\1\tmp.html" -Raw -Encoding UTF8
            $buffer = [System.Text.Encoding]::UTF8.GetBytes($content)
            $response.ContentLength64 = $buffer.Length
            $response.ContentType = "text/html; charset=utf-8"
            $response.OutputStream.Write($buffer, 0, $buffer.Length)
        }
        else {
            $response.StatusCode = 404
            $notFound = "Page not found"
            $buffer = [System.Text.Encoding]::UTF8.GetBytes($notFound)
            $response.ContentLength64 = $buffer.Length
            $response.OutputStream.Write($buffer, 0, $buffer.Length)
        }
        
        $response.Close()
    }
}
finally {
    $listener.Stop()
    Write-Host "Server stopped"
}