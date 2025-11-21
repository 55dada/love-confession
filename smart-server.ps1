# Smart HTTP Server with Auto Port Detection
function Find-OpenPort {
    param($startPort = 9000)
    
    for ($port = $startPort; $port -lt 10000; $port++) {
        try {
            $listener = New-Object System.Net.HttpListener
            $listener.Prefixes.Add("http://localhost:$port/")
            $listener.Start()
            $listener.Stop()
            return $port
        }
        catch {
            continue
        }
    }
    throw "Cannot find available port"
}

$port = Find-OpenPort
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://+:$port/")
$listener.Start()

# 获取本机IP地址
$ipAddresses = [System.Net.Dns]::GetHostAddresses([System.Net.Dns]::GetHostName()) | Where-Object { $_.AddressFamily -eq 'InterNetwork' }
$localIP = $ipAddresses[0].IPAddressToString

Write-Host "Server started on port $port"
Write-Host "Local access: http://localhost:$port/"
Write-Host "Mobile access: http://$($localIP):$port/"
Write-Host "Mobile page: http://$($localIP):$port/tmp.html"
Write-Host "Press Ctrl+C to stop server"
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