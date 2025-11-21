# Simple HTTP server using PowerShell
$httpListener = New-Object System.Net.HttpListener
$httpListener.Prefixes.Add("http://localhost:3000/")
$httpListener.Start()

Write-Host "Server running at http://localhost:3000/"
Write-Host "Access your page at: http://localhost:3000/tmp.html"
Write-Host "Press Ctrl+C to stop the server"

try {
    while ($true) {
        $context = $httpListener.GetContext()
        $request = $context.Request
        $response = $context.Response
        
        if ($request.Url.LocalPath -eq "/" -or $request.Url.LocalPath -eq "/tmp.html") {
            $content = [System.IO.File]::ReadAllText("E:\cloud\1\tmp.html")
            $buffer = [System.Text.Encoding]::UTF8.GetBytes($content)
            $response.ContentLength64 = $buffer.Length
            $response.ContentType = "text/html; charset=utf-8"
            $response.OutputStream.Write($buffer, 0, $buffer.Length)
        } else {
            $response.StatusCode = 404
            $buffer = [System.Text.Encoding]::UTF8.GetBytes("Not Found")
            $response.ContentLength64 = $buffer.Length
            $response.OutputStream.Write($buffer, 0, $buffer.Length)
        }
        
        $response.Close()
    }
}
finally {
    $httpListener.Stop()
}